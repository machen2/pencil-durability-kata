class PencilDurability::Pencil
    attr_reader :point_durability

    def initialize(point_durability=5000)
        @point_durability = point_durability
    end

    def point_degradation(input)
        input.split('').each do |character|
            if ('A'..'Z').include?(character) && @point_durability >= 2
                @point_durability -= 2
            elsif character == '\n' || character == ' '
            elsif @point_durability >= 1
                @point_durability -= 1
            end
        end
    end
end