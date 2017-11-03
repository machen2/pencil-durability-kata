require_relative './paper.rb'

class PencilDurability::Pencil 
	attr_reader :point_durability, :initial_point_durability, :length, :eraser_durability

	def initialize(length, eraser_durability, point_durability=5000)
		@length = length
		@eraser_durability = eraser_durability
		@point_durability = point_durability
		@initial_point_durability = point_durability
	end

	def sharpen
		if @length > 0
			@point_durability = @initial_point_durability
			@length -= 1
		else
			return "This pencil is too short to sharpen."
		end
	end

	def count_point_cost(input)
		capital_count = input.scan(/[A-Z]/).length * 2
		lowercase_count = input.scan(/[a-z]/).length
		
		capital_count + lowercase_count
	end
	
	def reduce_point_durability(input_cost)
		point_remainder = 0
		if @point_durability > input_cost 
			@point_durability -= input_cost
		else
			point_remainder = input_cost - @point_durability
			@point_durability = 0
		end
		point_remainder
	end
	
	def calculate_writable_text(input, point_remainder)
		if point_remainder == 0
			return input
		end
		
		index = -1
		while point_remainder > 0 
			if ('A'..'Z').include?(input[index])
				point_remainder -= 2
			elsif ('a'..'z').include?(input[index])
				point_remainder -= 1
			end	
			input[index] = " "            
			index -= 1
		end
		input
	end
	
	def point_degradation(input)
		input_cost = count_point_cost(input)
		point_remainder = reduce_point_durability(input_cost)
		calculate_writable_text(input, point_remainder)
	end

	def write_to_paper(input, paper_object) 
		valid_write = point_degradation(input)
		paper_object.write(valid_write) 
	end

	def eraser_degradation(input)
		valid_erase = []

		input.split('').reverse.each do |character|
			if eraser_durability == 0 || character == ' ' || character == '\n'
				valid_erase << character
			else 
				@eraser_durability -= 1
				valid_erase << " "                           
			end
		end
		valid_erase.reverse.join("")
	end

	def erase_from_paper(input, paper_object)
		if paper_object.is_text_present?(input)
			valid_erase = eraser_degradation(input)
			paper_object.erase(input, valid_erase)
		else 
			return "Unable to find \'#{input}\' on the paper."
		end
	end

	def edit_paper(input, paper_object)
		if paper_object.has_erase_history?
			valid_text = point_degradation(input)
			paper_object.edit(valid_text)
		else
			return "There is no erase history to edit."
		end
	end
end