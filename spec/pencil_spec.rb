require "spec_helper"

RSpec.describe PencilDurability::Pencil do 
    it "is defined as a class" do 
        expect(PencilDurability::Pencil).to be_a(Class)
    end

    let(:pencil) { PencilDurability::Pencil.new(1000) }
    
    describe "#new" do 
        it "initializes a new instance of pencil" do 
            expect{PencilDurability::Pencil.new(1000)}.to_not raise_error
        end

        it "initializes an instance with a given value for point durability" do
            test_pencil = PencilDurability::Pencil.new(1000)
            expect(test_pencil.point_durability).to eq(1000)
        end
    end 

    describe "#point_durability" do 
        it "has a point_durability" do 
            expect(pencil).to respond_to('point_durability')
        end
    end
end