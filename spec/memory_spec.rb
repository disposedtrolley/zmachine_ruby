require 'spec_helper'
require 'zm/memory'

RSpec.describe ZM::Memory do
  describe 'out of bounds checking' do
    it 'should throw an exception if an out-of-bounds address is read' do
      mem = ZM::Memory.new([0xfe, 0xa2, 0x19, 0x00])
      expect { mem.read_byte(5) }.to raise_error(ZM::Memory::OutOfBoundsError, 'Address 5 is out of bounds')
      expect { mem.read_word(4) }.to raise_error(ZM::Memory::OutOfBoundsError, 'Address 4 is out of bounds')
    end
  end
end