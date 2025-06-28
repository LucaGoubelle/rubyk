require "./rubyklib/move/mover.rb"


class CubeScrambler
    attr_reader :scrambles
    attr_reader :mover

    def initialize()
        @mover = Mover.new()
        @scrambles = [
            "U2 F R2 F' U2 R2 F2 U' R2 U' R' F U2 F U2 F U' R' U R F' U F2 R2 F'",
            "R2 U F R U' R' U' R' U F' U' R2 U2 F' R' U F' R U F2 U F R2 F R2",
            "R' F2 R' U' F R F' U' R2 F2 U' F U' R F U F' U2 R2 U' R U R F' U",
            "U' F' R' F R2 U2 F' R' U2 R U F2 R2 U F R' U F U F2 R2 F' U F2 U2",
            "U R2 F R U2 R' F R' F R2 F U F' R' F R2 U F2 U F2 U R2 U2 R' U2"
        ]
    end

    def scramble(cube)
        rd = rand(@scrambles.size)
        scrb = @scrambles[rd]
        cube = @mover.multiMoves(cube, scrb)
        return cube
    end
end
