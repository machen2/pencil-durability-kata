require "spec_helper"

RSpec.describe PencilDurability::Paper do 
    it "is defined as a class" do 
        expect(PencilDurability::Paper).to be_a(Class)
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

end