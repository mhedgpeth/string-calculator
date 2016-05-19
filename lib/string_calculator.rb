module StringCalculator
  def add
    @delimiter = ','
    if empty?
      0
    else
      if start_with? '//'
        @delimiter = self[2, 1]
      end 
      negatives = numbers.select { |element| element < 0 }
      if negatives.size > 0
        negatives_description = negatives.join(', ')
        raise ArgumentError.new("negatives not allowed: #{ negatives_description }")
      end
      numbers.inject { |sum, part| sum += part }
    end
  end
  
  def numbers 
    gsub('\n', @delimiter).split(@delimiter).map(&:to_i)
  end

end