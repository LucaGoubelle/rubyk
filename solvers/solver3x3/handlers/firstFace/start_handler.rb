require "./solvers/solver3x3/processors/center_processor.rb"
require "./solvers/solver3x3/handlers/handler.rb"
require "./solver_helpers/scanners/Cube3x3Scanner.rb"

class StartHandler < Handler
    attr_reader :processor
    attr_reader :scanner

    def initialize()
        super()
        @processor = CenterProcessor.new()
        @scanner = Cube3x3Scanner.new()
    end

    # handle the starting part, which consist to 
    # orient the cube in the good axis
    # (yellow on top, white on bottom)
    # @author: LucaGoubelle

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
