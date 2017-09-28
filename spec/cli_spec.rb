require "spec_helper"

RSpec.describe PencilDurability::Cli do 
    let(:cli) { PencilDurability::Cli.new }
    
    it "is defined as a class" do 
        expect(PencilDurability::Cli).to be_a(Class)
    end

    describe '#call' do
        it 'calls the welcome_user method' do 
            expect(cli).to receive(:welcome_user)
            cli.call
        end
    end

    describe '#welcome_user' do 
        it "welcomes the user with a message" do 
            expect{cli.welcome_user}.to output("Welcome!\n").to_stdout
        end
    end
end