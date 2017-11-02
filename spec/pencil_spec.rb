require "spec_helper"
require_relative '../lib/pencil_durability/paper.rb'

RSpec.describe PencilDurability::Pencil do 
    let(:pencil) { PencilDurability::Pencil.new(10, 20, 1000) }
    let(:paper) { PencilDurability::Paper.new }    

    describe "#point_degradation" do 
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
        it "adjusts point_durability correctly based on input string" do
            pencil.write_to_paper("She sells sea shells", paper)
            expect(pencil.point_durability).to eq(982)         
        end

        it "appends the valid input text to the paper object passed in" do 
            pencil.write_to_paper("She sells sea shells", paper)
            expect(paper.paper_text).to eq("She sells sea shells")
        end

        it "appends valid input to existing text on the paper" do 
            pencil.write_to_paper("She sells sea shells", paper)
            pencil.write_to_paper(" down by the sea shore", paper)
            expect(paper.paper_text).to eq("She sells sea shells down by the sea shore")
        end

        it "returns the correct string based on input and durability" do
            test_pencil = PencilDurability::Pencil.new(10, 20, 4)
            expect(test_pencil.write_to_paper("Text", paper)).to eq("Tex ")
        end
    end
   
    describe "#sharpen" do 
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

    describe "#eraser_degradation" do 
        it "adjusts eraser durability by 1 for each character of the input excluding white spaces" do 
            eraser_value = pencil.eraser_durability
            pencil.eraser_degradation("Buffalo Bill")
            expect(pencil.eraser_durability).to eq(eraser_value - 11)
        end

        it "returns a string of valid erased text result based on eraser_durability" do
            result = pencil.eraser_degradation("Buffalo Bill")
            expect(result).to eq("            ")            
        end

        it "does not erase characters if eraser_durability is too low" do 
            test_pencil = PencilDurability::Pencil.new(10, 3, 1000)
            result = test_pencil.eraser_degradation("Buffalo Bill")
            expect(result).to eq("Buffalo B   ")
        end
    end

    describe "#erase_from_paper" do 
        it "adjusts eraser_durability correctly based on input string" do
            pencil.write_to_paper("How much wood would a woodchuck chuck if a woodchuck could chuck wood?", paper)
            pencil.erase_from_paper("chuck", paper)  
            expect(pencil.eraser_durability).to eq(15)
       end

       it "erases the valid erase text from the paper object passed in" do 
            pencil.write_to_paper("How much wood would a woodchuck chuck if a woodchuck could chuck wood?", paper)        
            pencil.erase_from_paper("chuck", paper)
            expect(paper.paper_text).to eq("How much wood would a woodchuck chuck if a woodchuck could       wood?")
        end

        it "returns the correct altered string based on input, valid erase, and eraser durability" do
            test_pencil = PencilDurability::Pencil.new(10, 6, 1000)
            test_pencil.write_to_paper("How much wood would a woodchuck chuck if a woodchuck could chuck wood?", paper)
            expect(test_pencil.erase_from_paper("chuck chuck", paper)).to eq("How much wood would a woodchuc        if a woodchuck could chuck wood?")
        end
        
        it "paper text remains unchanged if the input is not found on the paper" do 
            pencil.write_to_paper("How much wood would a woodchuck chuck if a woodchuck could chuck wood?", paper)
            pencil.erase_from_paper("bob", paper)
            expect(paper.paper_text).to eq("How much wood would a woodchuck chuck if a woodchuck could chuck wood?")
        end
    end

    describe "#edit_paper" do 
        it "adjusts the point_durability based on the edit" do 
            pencil.write_to_paper("An apple a day keeps the doctor away", paper)            
            point_value = pencil.point_durability
            pencil.erase_from_paper("apple", paper)
            pencil.edit_paper("onion", paper)
            expect(pencil.point_durability).to eq(point_value - 5)
        end

        it "returns a message if the paper has no valid erase history" do 
            pencil.write_to_paper("An apple a day keeps the doctor away", paper)            
            result = pencil.edit_paper("onion", paper)
            expect(result).to eq("There is no erase history to edit.")
        end

        it "returns the correct edited string based on input, erase history, and point_durability" do 
            pencil.write_to_paper("An apple a day keeps the doctor away", paper)
            pencil.erase_from_paper("apple", paper)            
            result = pencil.edit_paper("onion", paper)
            expect(result).to eq("An onion a day keeps the doctor away")            
        end
    end
end