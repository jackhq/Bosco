DBNAME = 'sqlite://bosco.db'
DB = Sequel.connect(DBNAME) 

class Result < Sequel::Model
  one_to_many :result_items

  def get_data
    result = {}
    result_items.each do |ri|
      if ri[:type] == 'grid'
        result.merge!( ri[:name].to_sym => Crack::JSON.parse(ri[:value]) )      
      elsif ri[:type] == 'scale'
        result.merge!( ri[:name].to_sym => ri[:value].to_i )      
      else
        result.merge!( ri[:name].to_sym => ri[:value] )
      end
    end
    result
  end
  
end

class ResultItem < Sequel::Model
  many_to_one :result
  
end
