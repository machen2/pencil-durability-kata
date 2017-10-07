class PencilDurability::Pencil
    attr_reader :point_durability

    def initialize(point_durability=5000)
        @point_durability = point_durability
    end

    def point_degradation(input)
    end
end