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

    def moveX(cube)
        cube.right = RH.rotate(cube.right)
        cube.left = RH.rotateAsync(cube.left)

        newFront = RH.copyFace(cube.down)
        newUp = RH.copyFace(cube.front)
        newBack = RH.rotateTwice(RH.copyFace(cube.up))
        newDown = RH.rotateTwice(RH.copyFace(cube.back))

        cube.front = RH.transfert(cube.front, newFront)
        cube.up = RH.transfert(cube.up, newUp)
        cube.back = RH.transfert(cube.back, newBack)
        cube.down = RH.transfert(cube.down, newDown)

        return cube
    end

    def moveXPrime(cube)
        for i in 0..2 do
            cube = moveX(cube)
        end
        return cube
    end

    def moveX2(cube)
        newCube = moveX(cube)
        newCube = moveX(newCube)
        return newCube
    end

    def moveZ(cube)
        cube.front = RH.rotate(cube.front)
        cube.back = RH.rotateAsync(cube.back)

        newUp = RH.rotate(RH.copyFace(cube.left))
        newRight = RH.rotate(RH.copyFace(cube.up))
        newLeft = RH.rotate(RH.copyFace(cube.down))
        newDown = RH.rotate(RH.copyFace(cube.right))

        cube.up = RH.transfert(cube.up, newUp)
        cube.right = RH.transfert(cube.right, newRight)
        cube.left = RH.transfert(cube.left, newLeft)
        cube.down = RH.transfert(cube.down, newDown)

        return cube
    end

    def moveZPrime(cube)
        for i in 0..2 do
            cube = moveZ(cube)
        end
        return cube
    end

    def moveZ2(cube)
        newCube = moveZ(cube)
        newCube = moveZ(newCube)
        return newCube
    end

end

