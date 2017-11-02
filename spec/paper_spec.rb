require "spec_helper"

RSpec.describe PencilDurability::Paper do 
    let(:paper) { PencilDurability::Paper.new }

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