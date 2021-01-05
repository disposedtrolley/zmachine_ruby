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
      bounds_check(address) && bounds_check(address + 1)

      @content[address]<<8 | @content[address+1]
    end

    private

    def bounds_check(address)
      if address >= @content.length
        raise OutOfBoundsError, "Address #{address} is out of bounds"
      end
    end

    def read_only_check(address)
      if address >= Memory.header[:static_memory_begin]
        raise ReadOnlyError, "Address #{address} is in the read-only region of memory"
      end
    end
  end
end