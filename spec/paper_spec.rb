require "spec_helper"

RSpec.describe PencilDurability::Paper do 
    let(:paper) { PencilDurability::Paper.new }

    describe "#paper_text" do 
        it "has paper_text" do 
            expect(paper).to respond_to('paper_text')
        end

        it "returns a string when called" do 
            expect(paper.paper_text).to be_a(String)
        end
    end

    describe "#write" do 
        it "takes a string as an argument and appends it to paper_text" do 
            paper.write("She sells sea shells")
            expect(paper.paper_text).to eq("She sells sea shells")
        end

        it "appends to existing text on the paper" do 
            paper.write("She sells sea shells")
            paper.write(" down by the sea shore")
            expect(paper.paper_text).to eq("She sells sea shells down by the sea shore")
        end
    end

    describe "#erase" do 
        it "replaces the last occurence of the input with empty spaces" do 
            paper.write("How much wood would a woodchuck chuck if a woodchuck could chuck wood?")
            paper.erase("chuck", "     ")
            expect(paper.paper_text).to eq("How much wood would a woodchuck chuck if a woodchuck could       wood?")
        end

        it "erases the correct last occurrence of the input if the same input is erased again" do 
            paper.write("How much wood would a woodchuck chuck if a woodchuck could chuck wood?")
            paper.erase("chuck", "     ")
            paper.erase("chuck", "     ")
            expect(paper.paper_text).to eq("How much wood would a woodchuck chuck if a wood      could       wood?")
        end
    end

    describe "#edit" do 
        it "replaces the last erased whitespace with the input text" do 
            paper.write("An apple a day keeps the doctor away")
            paper.erase("apple", "     ")
            paper.edit("onion")
            expect(paper.paper_text).to eq("An onion a day keeps the doctor away")
        end

        it "replaces any collisions with existing characters on the page with @ symbol" do
            paper.write("An apple a day keeps the doctor away")
            paper.erase("apple", "     ")
            paper.edit("artichoke")
            expect(paper.paper_text).to eq("An artich@k@ay keeps the doctor away")
        end

        it "returns the paper_text if there is no erase history to edit" do 
            paper.write("An apple a day keeps the doctor away")
            expect(paper.edit("onion")).to eq("An apple a day keeps the doctor away")
        end
    end
end