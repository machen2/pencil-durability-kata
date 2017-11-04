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
		points_not_written = 0
		if @point_durability > input_cost 
			@point_durability -= input_cost
		else
			points_not_written = input_cost - @point_durability
			@point_durability = 0
		end
		points_not_written
	end

	def point_degradation(input)
		input_cost = count_point_cost(input)
		points_not_written = reduce_point_durability(input_cost)
	end
	
	def calculate_writeable_text(input, points_not_written)
		if points_not_written == 0
			return input
		end

		index = -1
		while points_not_written > 0 
			if ('A'..'Z').include?(input[index])
				points_not_written -= 2
			elsif ('a'..'z').include?(input[index])
				points_not_written -= 1
			end	
			input[index] = " "            
			index -= 1
		end
		input
	end

	def write_to_paper(input, paper_object) 
		points_not_written = point_degradation(input)
		writable_text = calculate_writeable_text(input, points_not_written)
		paper_object.write(writable_text) 
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
			points_not_written = point_degradation(input)
			writeable_text = calculate_writeable_text(input, points_not_written)
			paper_object.edit(writeable_text)
		else
			return "There is no erase history to edit."
		end
	end
end