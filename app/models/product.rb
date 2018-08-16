class Product < ApplicationRecord

	
		
	def self.total_worth
		total = 0
		Product.all.each do |prod|
			total += prod.price
		end
		total = number_to_indian_currency(total)
	end

	def self.number_to_indian_currency(number)
	  if number.present?
	    string = number.to_s.split('.')
	    number = string[0].gsub(/(\d+)(\d{3})$/){ p = $2;"#{$1.reverse.gsub(/(\d{2})/,'\1,').reverse},#{p}"}
	    number = number.gsub(/^,/, '') + '.' + string[1] if string[1] # remove leading comma
	    number = number[1..-1] if number[0] == 44
	  end
  		"Rs.#{number}"
 	end
end
