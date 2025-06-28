require "./rubyklib/move/rotateHelpers.rb"

#################################
#########  AXIS MOVE    #########
#################################

class AxisMoves
    RH = RotateHelpers

    def moveY(cube)
        cube.up = RH.rotate(cube.up)
        cube.down = RH.rotateAsync(cube.down)

        newFront = RH.copyFace(cube.right)
        newLeft = RH.copyFace(cube.front) 
        newRight = RH.copyFace(cube.back)
        newBack = RH.copyFace(cube.left)

        cube.front = RH.transfert(cube.front, newFront)
        cube.left = RH.transfert(cube.left, newLeft)
        cube.right = RH.transfert(cube.right, newRight)
        cube.back = RH.transfert(cube.back, newBack)

        return cube
    end


    def moveYPrime(cube)
        for i in 0..2 do
            cube = moveY(cube)
        end
        return cube
    end


    def moveY2(cube)
        newCube = moveY(cube)
        newCube = moveY(newCube)
        return newCube
    end
end

