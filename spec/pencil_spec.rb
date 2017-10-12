require "spec_helper"
require_relative '../lib/pencil_durability/paper.rb'

RSpec.describe PencilDurability::Pencil do 
    it "is defined as a class" do 
        expect(PencilDurability::Pencil).to be_a(Class)
    end

    let(:pencil) { PencilDurability::Pencil.new(10, 20, 1000) }
    let(:paper) { PencilDurability::Paper.new }    
    
    describe "#new" do 
        it "initializes a new instance of pencil" do 
            expect{PencilDurability::Pencil.new(10, 20, 1000)}.to_not raise_error
        end

        it "initializes an instance with a given value for point durability" do
            test_pencil = PencilDurability::Pencil.new(10, 20, 1000)
            expect(test_pencil.point_durability).to eq(1000)
        end

        it "sets a default value for point_durability if not given one upon initilization" do 
            test_pencil = PencilDurability::Pencil.new(10, 20)
            expect(test_pencil.point_durability).to eq(5000)
        end

        it "sets the initial point durability upon initialization" do 
            expect(pencil.initial_point_durability).to eq(1000)
        end

        it "initializes an instance with a given value for pencil length" do
            expect(pencil.length).to eq(10)
        end

        it "initializes an instance with a given value for eraser durability" do
            expect(pencil.eraser_durability).to eq(20)
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
            test_pencil = PencilDurability::Pencil.new(10, 20, 5)
            result = test_pencil.point_degradation("She Sells")
            expect(result).to eq("She      ")
        end
    end

    describe "#write_to_paper" do 
        it "is called with 2 arguments" do 
            expect(pencil).to respond_to(:write_to_paper).with(2).argument
        end   
        
        it "adjusts point_durability correctly based on input string" do
            pencil.write_to_paper("She sells sea shells", paper)
            expect(pencil.point_durability).to eq(982)         
       end

       it "appends the valid input text to the paper object passed in" do 
        pencil.write_to_paper("She sells sea shells", paper)
        expect(paper.paper_text).to eq("She sells sea shells")
       end

       it "returns the correct string based on input and durability" do
        test_pencil = PencilDurability::Pencil.new(10, 20, 4)
        expect(test_pencil.write_to_paper("Text", paper)).to eq("Tex ")
       end
    end

    describe "#initial_point_durability" do 
        it "has an initial point durability" do 
            expect(pencil).to respond_to('initial_point_durability')
        end

        it "returns an integer when called" do 
            expect(pencil.initial_point_durability).to be_an(Integer)
        end
    end
   
    describe "#sharpen" do 
        it "can be called with no arguments" do 
            expect(pencil).to respond_to('sharpen').with(0).arguments
        end

        it "resets the point durability of the pencil" do 
            pencil.write_to_paper("She sells sea shells", paper)
            pencil.sharpen
            expect(pencil.point_durability).to eq(1000)
        end

        it "reduces pencil length by 1 when called" do 
            pencil.sharpen
            expect(pencil.length).to eq(9)
        end

        it "does not restore point durability if length is 0" do 
            test_pencil = PencilDurability::Pencil.new(0, 20, 1000)
            test_pencil.write_to_paper("She sells sea shells", paper)
            test_pencil.sharpen
            expect(test_pencil.point_durability).to eq(982)
        end

        it "does not reduce length if already 0" do 
            test_pencil = PencilDurability::Pencil.new(0, 20, 1000)
            test_pencil.sharpen
            expect(test_pencil.length).to eq(0)
        end
    end

    describe "#length" do 
        it "has a length" do 
            expect(pencil).to respond_to('length')
        end

        it "returns an integer when called" do 
            expect(pencil.length).to be_an(Integer)
        end
    end

    describe "#eraser_durability" do 
        it "has an eraser durability" do 
            expect(pencil).to respond_to('eraser_durability')
        end

        it "returns an integer when called" do 
            expect(pencil.eraser_durability).to be_an(Integer)
        end
    end

    describe "#eraser_degradation" do 
        it "can be called with 1 argument" do 
            expect(pencil).to respond_to(:eraser_degradation).with(1).argument
        end

        it "adjusts eraser durability by 1 for each character of the input excluding white spaces" do 
            eraser_value = pencil.eraser_durability
            pencil.eraser_degradation("Buffalo Bill")
            expect(pencil.eraser_durability).to eq(eraser_value - 11)
        end

        it "returns a string of valid erased text result based on eraser_durability" do
            result = pencil.eraser_degradation("Buffalo Bill")
            expect(result).to eq("            ")            
        end
    end
end