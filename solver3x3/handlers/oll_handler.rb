require "./rubyklib/move/mover.rb"
require "./solver_helpers/advanced/OLLScanner.rb"
require "./solver3x3/processors/lastFace/oll_processor.rb"

class OLLHandler
    attr_reader :mover
    attr_reader :scanner
    attr_reader :ollProcessor

    def initialize()
        @mover = Mover.new()
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
