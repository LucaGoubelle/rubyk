require "./rubyklib/move/rotateHelpers.rb"

class STDMoves 
    RH = RotateHelpers

    def moveU(cube)
        size = cube.up.size

        cube.up = RH.rotate(cube.up)

        newFront = RH.genEmptyFace(size)
        newLeft = RH.genEmptyFace(size)
        newRight = RH.genEmptyFace(size)
        newBack = RH.genEmptyFace(size)

        for i in 0..size-1 do
            newFront[0][i] = cube.right[0][i]
            newLeft[0][i] = cube.front[0][i]
            newRight[0][i] = cube.back[0][i]
            newBack[0][i] = cube.left[0][i]
        end

        cube.front = RH.transfert(cube.front, newFront)
        cube.left = RH.transfert(cube.left, newLeft)
        cube.right = RH.transfert(cube.right, newRight)
        cube.back = RH.transfert(cube.back, newBack)
        
        return cube
    end


    def moveUPrime(cube)
        for i in 0..2 do
            cube = moveU(cube)
        end
        return cube
    end


    def moveU2(cube)
        newCube = moveU(cube)
        newCube = moveU(newCube)
        return newCube
    end


    def moveD(cube)
        size = cube.down.size
        cube.down = RH.rotate(cube.down)

        newFront = RH.genEmptyFace(size)
        newLeft = RH.genEmptyFace(size)
        newRight = RH.genEmptyFace(size)
        newBack = RH.genEmptyFace(size)

        for i in 0..size-1 do
            newFront[size-1][i] = cube.left[size-1][i]
            newLeft[size-1][i] = cube.back[size-1][i]
            newRight[size-1][i] = cube.front[size-1][i]
            newBack[size-1][i] = cube.right[size-1][i]
        end

        cube.front = RH.transfert(cube.front, newFront)
        cube.left = RH.transfert(cube.left, newLeft)
        cube.right = RH.transfert(cube.right, newRight)
        cube.back = RH.transfert(cube.back, newBack)

        return cube
    end

    def moveDPrime(cube)
        for i in 0..2 do
            cube = moveD(cube)
        end
        return cube
    end

    def moveD2(cube)
        newCube = moveD(cube)
        newCube = moveD(newCube)
        return newCube
    end

    def moveR(cube)
        size = cube.up.size

        cube.right = RH.rotate(cube.right)
        
        newFront = RH.genEmptyFace(size)
        newUp = RH.genEmptyFace(size)
        newBack = RH.genEmptyFace(size)
        newDown = RH.genEmptyFace(size)

        for i in 0..size-1 do
            newFront[i][size-1] = cube.down[i][size-1]
            newUp[i][size-1] = cube.front[i][size-1]
            newBack[i][size-1] = cube.up[i][size-1]
            newDown[i][0] = cube.back[i][0]
        end

        cube.front = RH.transfert(cube.front, newFront)
        cube.up = RH.transfert(cube.up, newUp)
        cube.back = RH.transfert(cube.back, RH.rotateTwice(newBack))
        cube.down = RH.transfert(cube.down, RH.rotateTwice(newDown))

        return cube
    end


    def moveRPrime(cube)
        for i in 0..2 do
            cube = moveR(cube)
        end
        return cube
    end


    def moveR2(cube)
        newCube = moveR(cube)
        newCube = moveR(newCube)
        return newCube
    end

    def moveL(cube)
        size = cube.left.size
        cube.left = RH.rotate(cube.left)

        newUp = RH.genEmptyFace(size)
        newFront = RH.genEmptyFace(size)
        newDown = RH.genEmptyFace(size)
        newBack = RH.genEmptyFace(size)

        for i in 0..size-1 do
            newFront[i][0] = cube.up[i][0]
            newDown[i][0] = cube.front[i][0]
            newBack[i][0] = cube.down[i][0]
            newUp[i][size-1] = cube.back[i][size-1]
        end

        cube.front = RH.transfert(cube.front, newFront)
        cube.up = RH.transfert(cube.up, RH.rotateTwice(newUp))
        cube.down = RH.transfert(cube.down, newDown)
        cube.back = RH.transfert(cube.back, RH.rotateTwice(newBack))

        return cube
    end


    def moveLPrime(cube)
        for i in 0..2 do
            cube = moveL(cube)
        end
        return cube
    end


    def moveL2(cube)
        newCube = moveL(cube)
        newCube = moveL(newCube)
        return newCube
    end

    def moveF(cube)
        size = cube.front.size
        cube.front = RH.rotate(cube.front)

        newUp = RH.genEmptyFace(size)
        newLeft = RH.genEmptyFace(size)
        newRight = RH.genEmptyFace(size)
        newDown = RH.genEmptyFace(size)

        for i in 0..size-1 do
            newUp[i][size-1] = cube.left[i][size-1]
            newLeft[0][i] = cube.down[0][i]
            newRight[size-1][i] = cube.up[size-1][i]
            newDown[i][0] = cube.right[i][0]
        end

        cube.up = RH.transfert(cube.up, RH.rotate(newUp))
        cube.left = RH.transfert(cube.left, RH.rotate(newLeft))
        cube.right = RH.transfert(cube.right, RH.rotate(newRight))
        cube.down = RH.transfert(cube.down, RH.rotate(newDown))

        return cube
    end


    def moveFPrime(cube)
        for i in 0..2 do
            cube = moveF(cube)
        end
        return cube
    end


    def moveF2(cube)
        newCube = moveF(cube)
        newCube = moveF(newCube)
        return newCube
    end
end
