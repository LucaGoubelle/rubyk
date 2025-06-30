require "./rubyklib/move/mover.rb"
require "./solver_helpers/seekers/Edge3Seeker.rb"

require "./solver3x3/processors/middleEdges/br_processor.rb"
require "./solver3x3/processors/middleEdges/gr_processor.rb"
require "./solver3x3/processors/middleEdges/go_processor.rb"
require "./solver3x3/processors/middleEdges/bo_processor.rb"

class SecondLayerHandler
    attr_reader :mover
    attr_reader :seeker
    # processors
    attr_reader :brProcessor
    attr_reader :grProcessor
    attr_reader :goProcessor
    attr_reader :boProcessor

    def initialize()
        @mover = Mover.new()
        @seeker = Edge3Seeker.new()
        # processors
        @brProcessor = BRProcessor.new()
        @grProcessor = GRProcessor.new()
        @goProcessor = GOProcessor.new()
        @boProcessor = BOProcessor.new()
    end

    # handle the middle layer part
    # @author: LucaGoubelle

    def handle(cube)
        cube = handleBREdge(cube)
        cube = handleGREdge(cube)
        cube = handleGOEdge(cube)
        cube = handleBOEdge(cube)
        return cube
    end


    private def handleBREdge(cube)
        edge = @seeker.seekEdge(cube, ["blue_red","red_blue"])
        sequence = @brProcessor.process(edge)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handleGREdge(cube)
        edge = @seeker.seekEdge(cube, ["green_red","red_green"])
        sequence = @grProcessor.process(edge)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handleGOEdge(cube)
        edge = @seeker.seekEdge(cube, ["green_orange","orange_green"])
        sequence = @goProcessor.process(edge)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handleBOEdge(cube)
        edge = @seeker.seekEdge(cube, ["blue_orange","orange_blue"])
        sequence = @boProcessor.process(edge)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end
end
