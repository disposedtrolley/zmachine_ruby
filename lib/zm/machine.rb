# frozen_string_literal: true

module ZM
  class Machine

    def initialize(game, version)
      @game = game
      @version = version
    end

    def start
      0
    end

    def say_hello
      'I am a machine'
    end
  end
end
