require "spec_helper"

RSpec.describe PencilDurability::Paper do 
    it "is defined as a class" do 
        expect(PencilDurability::Paper).to be_a(Class)
    end

    let(:paper) { PencilDurability::Paper.new }
    it "must able to create an instance of Paper" do 
        expect(paper).to be_a(PencilDurability::Paper)
    end
end