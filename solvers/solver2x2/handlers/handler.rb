require "./rubyklib/move/mover.rb"

class Handler
    attr_reader :mover

    def initialize()
        @mover = Mover.new()
    end

end
