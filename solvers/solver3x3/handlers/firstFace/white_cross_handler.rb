
require "./solver_helpers/seekers/Edge3Seeker.rb"

require "./solvers/solver3x3/handlers/handler.rb"
require "./solvers/solver3x3/processors/firstEdges/wb_processor.rb"
require "./solvers/solver3x3/processors/firstEdges/wr_processor.rb"
require "./solvers/solver3x3/processors/firstEdges/wg_processor.rb"
require "./solvers/solver3x3/processors/firstEdges/wo_processor.rb"


class WhiteCrossHandler < Handler
    attr_reader :seeker
    # processors
    attr_reader :wbProcessor
    attr_reader :wrProcessor
    attr_reader :wgProcessor
    attr_reader :woProcessor


    def initialize()
        super()
        @seeker = Edge3Seeker.new()
        # processors
        @wbProcessor = WBProcessor.new()
        @wrProcessor = WRProcessor.new()
        @wgProcessor = WGProcessor.new()
        @woProcessor = WOProcessor.new()
    end

    # solve the white cross on the cube
    # (actually the first step in solving cube)
    # @author: LucaGoubelle

    def handle(cube)
        cube = handleWBEdge(cube)
        cube = handleWREdge(cube)
        cube = handleWGEdge(cube)
        cube = handleWOEdge(cube)
        return cube
    end

    private def handleWBEdge(cube)
        edge = @seeker.seekEdge(cube, ["white_blue","blue_white"])
        sequence = @wbProcessor.process(edge)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handleWREdge(cube)
        edge = @seeker.seekEdge(cube, ["white_red","red_white"])
        sequence = @wrProcessor.process(edge)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handleWGEdge(cube)
        edge = @seeker.seekEdge(cube, ["white_green","green_white"])
        sequence = @wgProcessor.process(edge)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handleWOEdge(cube)
        edge = @seeker.seekEdge(cube, ["white_orange","orange_white"])
        sequence = @woProcessor.process(edge)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end
end
