require "./rubyklib/move/mover.rb"
require "./solver_helpers/advanced/PLLScanner.rb"
require "./solver3x3/processors/lastFace/pll_processor.rb"

class PLLHandler
    attr_reader :mover
    attr_reader :scanner
    attr_reader :pllProcessor

    def initialize()
        @mover = Mover.new()
        @scanner = PLLScanner.new()
        @pllProcessor = PLLProcessor.new()
    end

    def handle(cube)
        cube = handlePLL(cube)
        cube = handleAUF(cube)
        return cube
    end

    private handlePLL(cube)
        pllConfig = @scanner.scanPLL(cube)
        sequence = @pllProcessor.process(pllConfig)
        cube = @mover.multiMoves(cube, sequence)
        return cube
    end

    private handleAUF(cube)
        color = cube.front[0][0]
        hmap = {
            "red" => "U'",
            "green" => "U2",
            "orange" => "U"
        }
        cube = if hmap.key?(color) then @mover.multiMoves(cube, hmap[color]) else cube end
        return cube
    end

end
