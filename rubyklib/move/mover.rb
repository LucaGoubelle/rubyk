require "./rubyklib/move/std_moves.rb"
require "./rubyklib/move/axis_moves.rb"
require "./rubyklib/move/wmoves.rb"

class Mover
    attr_reader :stdMoves
    attr_reader :axisMoves
    attr_reader :wmoves

    def initialize()
        @stdMoves = STDMoves.new()
        @axisMoves = AxisMoves.new()
        @wmoves = WMoves.new()
    end

    # Do one specific move on a passed cube object
    # @author: LucaGoubelle

    def simpleMove(cube, move)
        case move

        when "U"
            cube = @stdMoves.moveU(cube)
        when "U'"
            cube = @stdMoves.moveUPrime(cube)
        when "U2"
            cube = @stdMoves.moveU2(cube)

        when "D"
            cube = @stdMoves.moveD(cube)
        when "D'"
            cube = @stdMoves.moveDPrime(cube)
        when "D2"
            cube = @stdMoves.moveD2(cube)

        when "R"
            cube = @stdMoves.moveR(cube)
        when "R'"
            cube = @stdMoves.moveRPrime(cube)
        when "R2"
            cube = @stdMoves.moveR2(cube)

        when "L"
            cube = @stdMoves.moveL(cube)
        when "L'"
            cube = @stdMoves.moveLPrime(cube)
        when "L2"
            cube = @stdMoves.moveL2(cube)

        when "F"
            cube = @stdMoves.moveF(cube)
        when "F'"
            cube = @stdMoves.moveFPrime(cube)
        when "F2"
            cube = @stdMoves.moveF2(cube)

        when "y"
            cube = @axisMoves.moveY(cube)
        when "y'"
            cube = @axisMoves.moveYPrime(cube)
        when "y2"
            cube = @axisMoves.moveY2(cube)

        when "x"
            cube = @axisMoves.moveX(cube)
        when "x'"
            cube = @axisMoves.moveXPrime(cube)
        when "x2"
            cube = @axisMoves.moveX2(cube)

        when "z"
            cube = @axisMoves.moveZ(cube)
        when "z'"
            cube = @axisMoves.moveZPrime(cube)
        when "z2"
            cube = @axisMoves.moveZ2(cube)

        when "Uw"
            cube = @wmoves.moveUw(cube)
        when "Uw'"
            cube = @wmoves.moveUwPrime(cube)
        when "Uw2"
            cube = @wmoves.moveUw2(cube)

        when "Dw"
            cube = @wmoves.moveDw(cube)
        when "Dw'"
            cube = @wmoves.moveDwPrime(cube)
        when "Dw2"
            cube = @wmoves.moveDw2(cube)

        when "Lw"
            cube = @wmoves.moveLw(cube)
        when "Lw'"
            cube = @wmoves.moveLwPrime(cube)
        when "Lw2"
            cube = @wmoves.moveLw2(cube)

        when "Rw"
            cube = @wmoves.moveRw(cube)
        when "Rw'"
            cube = @wmoves.moveRwPrime(cube)
        when "Rw2"
            cube = @wmoves.moveRw2(cube)

        when "Fw"
            cube = @wmoves.moveFw(cube)
        when "Fw'"
            cube = @wmoves.moveFwPrime(cube)
        when "Fw2"
            cube = @wmoves.moveFw2(cube)

        else
            cube = cube
        end
        return cube
    end

    # do multiple moves on a passed cube object
    # @author: LucaGoubelle

    def multiMoves(cube, moves)
        begin
            movesArr = moves.split(" ")
            for mv in movesArr do
                cube = simpleMove(cube, mv)
            end
            return cube
        rescue Exception => e
            raise "ERR: invalid param cube, mv(s)..."
        end
    end
end
