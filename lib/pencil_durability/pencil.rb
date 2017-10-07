class PencilDurability::Pencil
    attr_reader :point_durability

    def initialize(point_durability=5000)
        @point_durability = point_durability
    end

    def point_degradation(input)
        valid_text = ""

        input.split('').each do |character|
            if ('A'..'Z').include?(character) && @point_durability >= 2
                @point_durability -= 2
                valid_text += character
            elsif character == '\n' || character == ' '
                valid_text += character                
            elsif @point_durability >= 1
                @point_durability -= 1
                valid_text += character                
            end
        end
        valid_text
    end
end