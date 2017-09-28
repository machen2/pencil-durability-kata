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
    end 

    describe "#paper_text" do 
        it "has paper_text" do 
            expect(paper).to respond_to('paper_text')
        end
    end
end