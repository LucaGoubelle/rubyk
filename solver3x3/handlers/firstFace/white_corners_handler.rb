require "./rubyklib/move/mover.rb"
require "./solver_helpers/seekers/Corner3Seeker.rb"

require "./solver3x3/processors/firstCorners/wbr_processor.rb"
require "./solver3x3/processors/firstCorners/wgr_processor.rb"
require "./solver3x3/processors/firstCorners/wgo_processor.rb"
require "./solver3x3/processors/firstCorners/wbo_processor.rb"

class WhiteCornersHandler

    # White corners Handler
    # handle corners of first face (bottom)
    # @author: LucaGoubelle

    attr_reader :mover
    attr_reader :seeker

    attr_reader :wbrProcessor
    attr_reader :wgrProcessor
    attr_reader :wgoProcessor
    attr_reader :wboProcessor

    def initialize()
        @mover = Mover.new()
        @seeker = Corner3Seeker.new()
        # processors
        @wbrProcessor = WBRProcessor.new()
        @wgrProcessor = WGRProcessor.new()
        @wgoProcessor =  WGOProcessor.new()
        @wboProcessor =  WBOProcessor.new()
    end

    # solve the first corners, 
    # then to assembling the first face
    # @author: LucaGoubelle

    def handle(cube)
        cube = handleWBRCorner(cube)
        cube = handleWGRCorner(cube)
        cube = handleWGOCorner(cube)
        cube = handleWBOCorner(cube)
        return cube
    end

    private def handleWBRCorner(cube)
        corner = @seeker.seekCorner(cube, 
            [
                "white_blue_red", "white_red_blue",
                "blue_white_red", "blue_red_white",
                "red_white_blue", "red_blue_white"
            ])
        sequence = @wbrProcessor.process(corner)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handleWGRCorner(cube)
        corner = @seeker.seekCorner(cube, 
            [
                "white_green_red", "white_red_green",
                "green_white_red", "green_red_white",
                "red_white_green", "red_green_white"
            ])
        sequence = @wgrProcessor.process(corner)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handleWGOCorner(cube)
        corner = @seeker.seekCorner(cube, 
            [
                "white_green_orange", "white_orange_green",
                "green_white_orange", "green_orange_white",
                "orange_white_green", "orange_green_white"
            ])
        sequence = @wgoProcessor.process(corner)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handleWBOCorner(cube)
        corner = @seeker.seekCorner(cube, 
            [
                "white_blue_orange", "white_orange_blue",
                "blue_white_orange", "blue_orange_white",
                "orange_white_blue", "orange_blue_white"
            ])
        sequence = @wboProcessor.process(corner)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end
end
