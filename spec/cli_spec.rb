require "spec_helper"

RSpec.describe PencilDurability::Cli do 
    it "is defined as a class" do 
        expect(PencilDurability::Cli).to be_a(Class)
    end

    describe PencilDurability::Cli, '#call' do
        cli = PencilDurability::Cli.new
        it "welcomes the user" do 
            expect{cli.call}.to output("Welcome!\n").to_stdout
        end
    end

    describe PencilDurability::Cli, '#welcome_user' do 
        cli = PencilDurability::Cli.new
        it "welcomes the user with a message" do 
            expect{cli.welcome_user}.to output("Welcome!\n").to_stdout
        end
    end
end