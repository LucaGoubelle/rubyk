require "./solver3x3/handlers/start_handler.rb"
require "./solver3x3/handlers/white_cross_handler.rb"
require "./solver3x3/handlers/white_corners_handler.rb"
require "./solver3x3/handlers/second_layer_handler.rb"

class Solver3x3

    attr_reader :startHandler
    attr_reader :whiteCrossHandler
    attr_reader :whiteCornersHandler
    attr_reader :secondLayerHandler

    def initialize()
        @startHandler = StartHandler.new()
        @whiteCrossHandler = WhiteCrossHandler.new()
        @whiteCornersHandler = WhiteCornersHandler.new()
        @secondLayerHandler = SecondLayerHandler.new()
    end

    # solve a 3x3 with a mix of standard methods 
    # and OLL / PLL from CFOP method
    # @author: LucaGoubelle

    def solve(cube)
        cube = @startHandler.handle(cube)
        cube = @whiteCrossHandler.handle(cube)
        cube = @whiteCornersHandler.handle(cube)
        cube = @secondLayerHandler.handle(cube)
        #todo: implement remaining code
        return cube
    end

end
