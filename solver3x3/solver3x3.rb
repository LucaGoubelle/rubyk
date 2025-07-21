require "./solver3x3/handlers/firstFace/start_handler.rb"
require "./solver3x3/handlers/firstFace/white_cross_handler.rb"
require "./solver3x3/handlers/firstFace/white_corners_handler.rb"
require "./solver3x3/handlers/second_layer_handler.rb"
require "./solver3x3/handlers/lastFace/yellow_cross_handler.rb"
require "./solver3x3/handlers/lastFace/oll_handler.rb"
require "./solver3x3/handlers/lastFace/pll_handler.rb"

class Solver3x3

    attr_reader :startHandler
    attr_reader :whiteCrossHandler
    attr_reader :whiteCornersHandler
    attr_reader :secondLayerHandler
    attr_reader :yellowCrossHandler
    attr_reader :ollHandler
    attr_reader :pllHandler

    def initialize()
        @startHandler = StartHandler.new()
        @whiteCrossHandler = WhiteCrossHandler.new()
        @whiteCornersHandler = WhiteCornersHandler.new()
        @secondLayerHandler = SecondLayerHandler.new()
        @yellowCrossHandler = YellowCrossHandler.new()
        @ollHandler = OLLHandler.new()
        @pllHandler = PLLHandler.new()
    end

    # solve a 3x3 with a mix of standard methods 
    # and OLL / PLL from CFOP method
    # @author: LucaGoubelle

    def solve(cube)
        cube = @startHandler.handle(cube)
        cube = @whiteCrossHandler.handle(cube)
        cube = @whiteCornersHandler.handle(cube)
        cube = @secondLayerHandler.handle(cube)
        cube = @yellowCrossHandler.handle(cube)
        cube = @ollHandler.handle(cube)
        cube = @pllHandler.handle(cube)
        return cube
    end

end
