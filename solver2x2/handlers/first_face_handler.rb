require "./rubyklib/move/mover.rb"
require "./solver_helpers/seekers/Corner2Seeker.rb"

require "./solver2x2/processors/firstCorners/wgr_processor.rb"
require "./solver2x2/processors/firstCorners/wgo_processor.rb"
require "./solver2x2/processors/firstCorners/wbo_processor.rb"


class FirstFaceHandler
    attr_reader :mover
    attr_reader :seeker
    # processors
    attr_reader :wgrProcessor
    attr_reader :wgoProcessor
    attr_reader :wboProcessor

    def initialize()
        @mover = Mover.new()
        @seeker = Corner2Seeker.new()
        # processors
        @wgrProcessor = WGRProcessor.new()
        @wgoProcessor = WGOProcessor.new()
        @wboProcessor = WBOProcessor.new()
    end

    # solve the first face
    # at bottom (white face)
    # @author: LucaGoubelle

    def handle(cube)
        cube = handleWGRCorner(cube)
        cube = handleWGOCorner(cube)
        cube = handleWBOCorner(cube)
        return cube
    end

    private def handleWGRCorner(cube)
        corner = @seeker.seekCorner(cube, [
            "white_green_red", "white_red_green",
            "green_white_red", "green_red_white",
            "red_white_green", "red_green_white"
        ])
        sequence = @wgrProcessor.process(corner)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handleWGOCorner(cube)
        corner = @seeker.seekCorner(cube, [
            "white_green_orange", "white_orange_green",
            "green_white_orange", "green_orange_white",
            "orange_white_green", "orange_green_white"
        ])
        sequence = @wgoProcessor.process(corner)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handleWBOCorner(cube)
        corner = @seeker.seekCorner(cube, [
            "white_blue_orange", "white_orange_blue",
            "blue_white_orange", "blue_orange_white",
            "orange_white_blue", "orange_blue_white"
        ])
        sequence = @wboProcessor.process(corner)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

end
