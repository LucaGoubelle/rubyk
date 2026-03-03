require "./solver_helpers/seekers/Corner2Seeker.rb"
require "./solvers/solver2x2/processors/firstCorners/wbr_processor.rb"
require "./solvers/solver2x2/handlers/handler.rb"

class StartHandler < Handler
    attr_reader :seeker
    attr_reader :wbrProcessor

    def initialize()
        super()
        @seeker = Corner2Seeker.new()
        @wbrProcessor = WBRProcessor.new()
    end

    # handle the first part
    # consisting to find and place 
    # the first corner (white_blue_red)
    # @author: LucaGoubelle

    def handle(cube)
        data = @seeker.seekCorner(cube, [
            "white_blue_red", "white_red_blue", 
            "blue_white_red", "blue_red_white",
            "red_white_blue", "red_blue_white"
        ])
        if data == "down_front_right::white_blue_red"
            return cube # nothing to do
        end
        return handleFirstCorner(cube, data)
    end

    private def handleFirstCorner(cube, data)
        sequence = @wbrProcessor.process(data)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

end
