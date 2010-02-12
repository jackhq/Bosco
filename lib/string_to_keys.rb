class Hash
  def key_strings_to_symbols!
    r = Hash.new
    self.each_pair do |k,v|
      if v.kind_of?(Array)
        r[k.to_sym] = v.map { |item| item.kind_of?(Hash) ? item.key_strings_to_symbols! : item }
      else
        v.key_strings_to_symbols! if v.kind_of? Hash and v.respond_to? :key_strings_to_symbols!
        r[k.to_sym] = v
      end
    end
    self.replace(r)
  end
end
