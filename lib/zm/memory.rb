module ZM
  class Memory
    class OutOfBoundsError < StandardError
    end

    class ReadOnlyError < StandardError
    end

    @@header = {
      static_memory_begin: 0x0E
    }

    def initialize(content)
      @content = content
    end

    def read_byte(address)
      bounds_check(address)

      @content[address]
    end

    def read_word(address)
      bounds_check(address)
      bounds_check(address + 1)

      @content[address] << 8 | @content[address + 1]
    end

    def write_byte(address, byte)
      bounds_check(address)
      read_only_check(address)

      @content[address] = byte
    end

    def write_word(address, word)
      bounds_check(address)
      bounds_check(address + 1)
      read_only_check(address)

      @content[address] = word >> 8
      @content[address + 1] = word
    end

    private

    def bounds_check(address)
      if address >= @content.length
        raise OutOfBoundsError, "Address #{address} is out of bounds"
      end
    end

    def read_only_check(address)
      if address >= @@header[:static_memory_begin]
        raise ReadOnlyError, "Address #{address} is in the read-only region of memory"
      end
    end
  end
end