require "spec_helper"

RSpec.describe PencilDurability::Paper do 
    it "is defined as a class" do 
        expect(PencilDurability::Paper).to be_a(Class)
    end

    let(:paper) { PencilDurability::Paper.new }
    it "must able to create an instance of Paper" do 
        expect(paper).to be_a(PencilDurability::Paper)
    end

    describe "#paper_text" do 
        it "has paper_text" do 
            expect(paper).to respond_to('paper_text')
        end
    end
end