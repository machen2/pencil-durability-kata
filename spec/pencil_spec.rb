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

        it "sets a default value for point_durability if not given one upon initilization" do 
            test_pencil = PencilDurability::Pencil.new()
            expect(test_pencil.point_durability).to eq(5000)
        end
    end 

    describe "#point_durability" do 
        it "has a point_durability" do 
            expect(pencil).to respond_to('point_durability')
        end

        it "returns an integer when called" do 
            expect(pencil.point_durability).to be_an(Integer)
        end
    end

    describe "#point_degradation" do 
        it "can be called with 1 argument" do 
            expect(pencil).to respond_to(:point_degradation).with(1).argument
        end

        it "adjusts point durability based on input" do 
            point_value = pencil.point_durability
            pencil.point_degradation("She sells sea shells")
            expect(pencil.point_durability).to eq(point_value - 18)
        end
        
        it "returns a string of valid text based on point_durability" do
            result = pencil.point_degradation("She sells sea shells")
            expect(result).to eq("She sells sea shells")            
        end

        it "adds spaces instead of characters to valid_text if point_durability is too low" do 
            test_pencil = PencilDurability::Pencil.new(5)
            result = test_pencil.point_degradation("She Sells")
            expect(result).to eq("She      ")
        end
    end

    describe "#write_to_paper" do 
        it "is called with 1 argument" do 
            expect(pencil).to respond_to(:write_to_paper).with(1).argument
        end            
    end
end