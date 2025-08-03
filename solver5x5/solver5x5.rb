require "./solver5x5/handlers/center/whiteCenterHandler.rb"

class Solver5x5 
    attr_reader :whiteCenterHandler 

    def initialize()
        @whiteCenterHandler = WhiteCenterHandler.new()
    end

    def solve(cube)
        cube = handleCenters(cube)
        cube = handleEdges(cube)
        # TODO: implement remaining lines
        return cube
    end

    private def handleCenters(cube)
        cube = @whiteCenterHandler.handle(cube)
        # todo: implement remaining lines
        return cube
    end

    private def handleEdges(cube)
        # todo: implement this
        return cube
    end
end
