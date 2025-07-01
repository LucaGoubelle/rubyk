require "./rubyklib/move/mover.rb"
require "./solver_helpers/advanced/OLLScanner.rb"
require "./solver_helpers/advanced/PLLScanner.rb"

require "./solver2x2/processors/lastFace/oll_processor.rb"
require "./solver2x2/processors/lastFace/pll_processor.rb"

class LastFaceHandler
    attr_reader :mover
    attr_reader :ollScanner
    attr_reader :pllScanner
    # processors
    attr_reader :ollProcessor
    attr_reader :pllProcessor

    def initialize()
        @mover = Mover.new()
        @ollScanner = OLLScanner.new()
        @pllScanner = PLLScanner.new()
        # processors
        @ollProcessor = OLLProcessor.new()
        @pllProcessor = PLLProcessor.new()
    end

    def handle(cube)
        cube = handleOLL(cube)
        cube = handlePLL(cube)
        cube = handleAUF(cube)
        return cube
    end

    private def handleOLL(cube)
        ollConfig = @ollScanner.scanOLL(cube)
        sequence = @ollProcessor.process(ollConfig)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handlePLL(cube)
        pllConfig = @pllScanner.scanPLL(cube)
        sequence = @pllProcessor.process(pllConfig)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private def handleAUF(cube)
        color = cube.front[0][0]
        hmap = {
            "orange" => "U",
            "red" => "U'",
            "green" => "U2"
        }
        cube = if hmap.key?(color) then @mover.multiMoves(cube, hmap[color]) else cube end
        return cube
    end

end
