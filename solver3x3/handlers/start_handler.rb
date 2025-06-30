require "./solver3x3/processors/center_processor.rb"
require "./solver_helpers/scanners/Cube3x3Scanner.rb"
require "./rubyklib/move/mover.rb"

class StartHandler
    attr_reader :processor
    attr_reader :scanner
    attr_reader :mover

    def initialize()
        @processor = CenterProcessor.new()
        @scanner = Cube3x3Scanner.new()
        @mover = Mover.new()
    end

    def handle(cube)
        centerUp = @scanner.scanCenter(cube, "up")
        centerFront = @scanner.scanCenter(cube, "front")
        data = centerUp +"_"+ centerFront
        if data == "yellow_blue"
            return cube # nothing to do
        end
        return handleCenterOrient(cube, data)
    end

    private def handleCenterOrient(cube, data)
        sequence = @processor.process(data)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

end
