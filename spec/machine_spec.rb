require 'spec_helper'
require 'zm/machine'

RSpec.describe ZM::Machine do
  describe '#say_hello' do
    it "should say hello" do
      machine = ZM::Machine.new("", "")
      expect(machine.say_hello).to eq 'I am a machine'
    end
  end
end
