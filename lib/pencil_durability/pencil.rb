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