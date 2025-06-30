require "./rubyklib/move/mover.rb"


class CubeScrambler
    attr_reader :mover
    attr_reader :scrambles
    attr_reader :bigScrambles
    attr_reader :hugeScrambles

    def initialize()
        @mover = Mover.new()
        @scrambles = [
            "U D2 R B2 F2 L2 B' U' D B U2 B U B R' L U' B' U2 F' R F' R L U2",
            "B' F2 D' F2 U2 F2 B U F' D B2 F' L' B' F L2 D L F R' F B' D' F B2",
            "R2 D2 L2 B' L2 R' U' F L' R2 D2 B2 F2 R2 F' B' U' L D' B L B R' U2 F2",
            "R' D' B2 F R' L' F2 B R L2 B' F' L2 R' D B' D2 L U R B2 L' D2 U2 F",
            "L2 D' L' B L2 R2 F' D U B2 F U' F2 R' D2 F R' D2 U2 B' L2 U L U R2"
        ]
        @bigScrambles = [
            "U' F2 U' Fw' U' Dw R F2 U B2 R' B Fw U L' Uw Lw Dw2 U Fw2 Lw Uw' F U' Bw' D Fw Lw2",
            "F Lw2 F' Uw' Fw B' Lw2 Fw Lw2 D Fw2 D' U' R U2 B' D' F' Rw Lw2 U Dw2 Bw' L' Fw L",
            "Fw' Lw' Uw' F' U' L F' Dw' B2 Rw D F2 Lw2 Dw U R L2 F2 U2 L' Fw' U2 F2 R Fw2"
        ]
        @hugeScrambles = "R Dw2 L' Fw2 Bww' Lww Dww' F Bw Dww F Dww2 Rww Lw2 Fw' Rw D2 B D2 Bww2 Fw Dww ";
        @hugeScrambles += "Fw' Lww' Bww2 F' Lw Dww Uww' Rw F' U Rww' Fw2 D' Bww D2 Lw Bw Lw Bww' U' F Rww Bw2 ";
        @hugeScrambles += "Dww2 Fw Bw2 Lww' B2 Uww' Fw B2 Dw' Uww Lw' Uw2 Bw2 D' L' Uw' Lw2 U2 Dw' L Fww R2 " +
                "Bw2 Lww2 F2 U Lww2 Bw2 Rw' F2 Uw2 Dw F2 Lww' Rw2 ";

    end

    def scramble(cube)
        size = cube.up.size
        case size
        when 2
            cube = scrambleSimpleCube(cube)
        when 3
            cube = scrambleSimpleCube(cube)
        when 4
            cube = scrambleBigCubes(cube)
        when 5
            cube = scrambleBigCubes(cube)
        when 6
            cube = scrambleHugeCubes(cube)
        when 7
            cube = scrambleHugeCubes(cube)
        else
            cube = scrambleSimpleCube(cube)
        end
        return cube
    end    

    private def scrambleSimpleCube(cube)
        rd = rand(@scrambles.size)
        scrb = @scrambles[rd]
        cube = @mover.multiMoves(cube, scrb)
        return cube
    end

    private def scrambleBigCubes(cube)
        rd = rand(@bigScrambles.size)
        scrb = @bigScrambles[rd]
        cube = @mover.multiMoves(cube, scrb)
        return cube
    end

    private def scrambleHugeCubes(cube)
        scrb = @hugeScrambles
        cube = @mover.multiMoves(cube, scrb)
        return cube
    end

end
