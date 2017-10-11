require "spec_helper"

RSpec.describe PencilDurability::Paper do 
    it "is defined as a class" do 
        expect(PencilDurability::Paper).to be_a(Class)
    end

    it "responds to the write method with 1 argument" do 
        expect(paper).to respond_to(:write).with(1).argument
    end

    let(:paper) { PencilDurability::Paper.new }
    describe "#new" do 
        it "initializes a new instance of paper" do 
            expect{PencilDurability::Paper.new}.to_not raise_error
        end

        it "sets the paper_text attribute of the instance to an empty string" do 
            expect(paper.paper_text).to eq("")
        end
    end 

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
        it "can be called with 1 argument" do
             expect(paper).to respond_to('erase').with(1).arguments
        end
    end
end