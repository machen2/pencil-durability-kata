require_relative './paper.rb'

class PencilDurability::Pencil 
    attr_reader :point_durability, :initial_point_durability, :length

    def initialize(length, point_durability=5000)
        @length = length
        @point_durability = point_durability
        @initial_point_durability = point_durability
    end

    def point_degradation(input)
        valid_text = ""
        dull = false

        input.split('').each do |character|
            if point_durability == 0 || (('A'..'Z').include?(character) && @point_durability < 2)
                valid_text += " "
                dull = true
                next
            end

            if ('A'..'Z').include?(character) && @point_durability >= 2
                @point_durability -= 2
                valid_text += character
            elsif character == '\n' || character == ' '
                valid_text += character                
            elsif @point_durability >= 1
                if dull == true 
                    valid_text += " "
                else
                    @point_durability -= 1
                    valid_text += character 
                end               
            end
        end    
        valid_text
    end

    def write_to_paper(input, paper_object) 
        valid_write = point_degradation(input) 
        paper_object.write(valid_write) 
    end

    def sharpen
        if @length > 0
            @point_durability = @initial_point_durability
            @length -= 1
        end
    end

    def erase(input)
    end
end