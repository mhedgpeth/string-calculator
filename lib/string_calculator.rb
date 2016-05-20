class StringCalculator
  def self.add(text)
    if text.empty?
      0
    else 
      delimiter = ','
      match_data = /\/\/(.+)\\n.*/.match(text)
      unless (match_data.nil?)
        delimiter = match_data[1]
      end
      numbers = text.gsub('\n', delimiter).split(delimiter).map(&:to_i)
      numbers.inject {|sum,x| sum += x.to_i}
    end
  end
  

end