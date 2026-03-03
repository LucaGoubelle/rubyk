require "./solver_helpers/advanced/OLLScanner.rb"
require "./solvers/solver3x3/handlers/handler.rb"
require "./solvers/solver3x3/processors/lastFace/oll_processor.rb"

class OLLHandler < Handler
    attr_reader :scanner
    attr_reader :ollProcessor

    def initialize()
        super()
        @scanner = OLLScanner.new()
        @ollProcessor = OLLProcessor.new()
    end

    def handle(cube)
        ollConfig = @scanner.scanOLL(cube)
        sequence = @ollProcessor.process(ollConfig)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

end
