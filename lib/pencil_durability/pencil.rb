class PencilDurability::Pencil
    attr_reader :point_durability

    def initialize(point_durability)
        @point_durability = point_durability
    end
end