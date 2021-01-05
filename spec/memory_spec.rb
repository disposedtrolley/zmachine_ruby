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

  describe 'read' do
    mem = ZM::Memory.new([0xfe, 0xa2, 0x0d, 0x19, 0x00])

    it 'should read a byte' do
      expect(mem.read_byte(0)).to equal 0xfe
    end

    it 'should read a byte at the end of memory' do
      expect(mem.read_byte(4)).to equal 0x00
    end

    it 'should read a word' do
      expect(mem.read_word(0)).to equal 0xfea2
    end

    it 'should read a word at the end of memory' do
      expect(mem.read_word(3)).to equal 0x1900
    end
  end
end