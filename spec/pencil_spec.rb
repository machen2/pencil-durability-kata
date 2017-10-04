require "spec_helper"

RSpec.describe PencilDurability::Pencil do 
    it "is defined as a class" do 
        expect(PencilDurability::Pencil).to be_a(Class)
    end

    describe "#new" do 
        it "initializes a new instance of pencil" do 
            expect{PencilDurability::Pencil.new}.to_not raise_error
        end
    end 

end