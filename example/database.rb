DBNAME = 'sqlite://bosco.db'
DB = Sequel.connect(DBNAME) 

class Result < Sequel::Model
  one_to_many :result_items

  def get_data
    result = {}
    result_items.each do |ri|
      if ri[:type] == 'grid' or ri[:type] == 'checkboxes' 
        result.merge!( ri[:name].to_sym => Crack::JSON.parse(ri[:value]) )      
      elsif ri[:type] == 'scale'
        result.merge!( ri[:name].to_sym => ri[:value].to_i )      
      else
        result.merge!( ri[:name].to_sym => ri[:value] )
      end
    end
    result
  end
    
  def save_items(data, form)
    form.pages.each do |p|
      p.questions.each do |q|
        value = nil
        if q.kind_of?(Bosco::Grid)
          value = []
          data[q.name].each do |k, v|
            value << {k => v}
          end if data[q.name]
          value = value.to_json
        elsif q.kind_of?(Bosco::Checkboxes)
          value = []
          data[q.name].each do |k, v|
            value << k
          end if data[q.name]
          value = value.to_json
        else
          value = data[q.name.to_s] if data[q.name]
        end
                
        ResultItem.find_or_create(
          :result_id    => self[:id], 
          :name         => q.name).update(
          :value        => value,
          :title        => q.title, 
          :type         => q.class.to_s.split('::').pop.underscore
          
        )        

      end
    end
    
  end
  
  
end

class ResultItem < Sequel::Model
  many_to_one :result
  
end
