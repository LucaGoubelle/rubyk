require "./rubyklib/move/rotateHelpers.rb"

class WMoves
    RH = RotateHelpers

    def moveUw(cube, nbLayers=2)
        size = cube.up.size
        cube.up = RH.rotate(cube.up)

        newFront = RH.genEmptyFace(size)
        newLeft = RH.genEmptyFace(size)
        newRight = RH.genEmptyFace(size)
        newBack = RH.genEmptyFace(size)

        for j in 0..nbLayers-1 do
            for i in 0..size-1 do
                newFront[j][i] = cube.right[j][i]
                newRight[j][i] = cube.back[j][i]
                newLeft[j][i] = cube.front[j][i]
                newBack[j][i] = cube.left[j][i]
            end
        end

        cube.front = RH.transfert(cube.front, newFront)
        cube.left = RH.transfert(cube.left, newLeft)
        cube.right = RH.transfert(cube.right, newRight)
        cube.back = RH.transfert(cube.back, newBack)
        
        return cube
    end

    def moveUwPrime(cube, nbLayers=2)
        for i in 0..2 do
            cube = moveUw(cube, nbLayers)
        end
        return cube
    end

    def moveUw2(cube, nbLayers=2)
        for i in 0..1 do
            cube = moveUw(cube, nbLayers)
        end
        return cube
    end

    def moveDw(cube, nbLayers=2)
        size = cube.down.size();
        cube.down = RH.rotate(cube.down)

        newFront = RH.genEmptyFace(size)
        newLeft = RH.genEmptyFace(size)
        newRight = RH.genEmptyFace(size)
        newBack = RH.genEmptyFace(size)

        for j in 0..nbLayers-1 do
            for i in 0..size-1 do
                newFront[size-(1+j)][i] = cube.left[size-(1+j)][i]
                newLeft[size-(1+j)][i] = cube.back[size-(1+j)][i]
                newRight[size-(1+j)][i] = cube.front[size-(1+j)][i]
                newBack[size-(1+j)][i] = cube.right[size-(1+j)][i]
            end
        end

        cube.front = RH.transfert(cube.front, newFront)
        cube.left = RH.transfert(cube.left, newLeft)
        cube.right = RH.transfert(cube.right, newRight)
        cube.back = RH.transfert(cube.back, newBack)

        return cube
    end

    def moveDwPrime(cube, nbLayers = 2)
        for i in 0..2 do
            cube = moveDw(cube, nbLayers)
        end
        return cube
    end

    def moveDw2(cube, nbLayers = 2)
        for i in 0..1 do
            cube = moveDw(cube, nbLayers)
        end
        return cube
    end


    def moveLw(cube, nbLayers=2)
        size = cube.left.size
        cube.left = RH.rotate(cube.left)

        newUp = RH.genEmptyFace(size)
        newFront = RH.genEmptyFace(size)
        newDown = RH.genEmptyFace(size)
        newBack = RH.genEmptyFace(size)

        for j in 0..nbLayers-1 do
            for i in 0..size-1 do
                newFront[i][j] = cube.up[i][j]
                newDown[i][j] = cube.front[i][j]
                newBack[i][j] = cube.down[i][j]
                newUp[i][size-(1+j)] = cube.back[i][size-(1+j)]
            end
        end

        cube.front = RH.transfert(cube.front, newFront)
        cube.up = RH.transfert(cube.up, RH.rotateTwice(newUp))
        cube.down = RH.transfert(cube.down, newDown)
        cube.back = RH.transfert(cube.back, RH.rotateTwice(newBack))

        return cube
    end

    def moveLwPrime(cube, nbLayers=2)
        for i in 0..2 do
            cube = moveLw(cube, nbLayers)
        end
        return cube
    end

    def moveLw2(cube, nbLayers=2)
        for i in 0..1 do
            cube = moveLw(cube, nbLayers)
        end
        return cube
    end

    def moveRw(cube, nbLayers=2)
        size = cube.right.size
        cube.right = RH.rotate(cube.right)

        newFront = RH.genEmptyFace(size)
        newUp = RH.genEmptyFace(size)
        newBack = RH.genEmptyFace(size)
        newDown = RH.genEmptyFace(size)

        for j in 0..nbLayers-1 do
            for i in 0..size-1 do
                newFront[i][size-(1+j)] = cube.down[i][size-(1+j)]
                newUp[i][size-(1+j)] = cube.front[i][size-(1+j)]
                newBack[i][size-(1+j)] = cube.up[i][size-(1+j)]
                newDown[i][j] = cube.back[i][j]
            end
        end

        cube.front = RH.transfert(cube.front, newFront)
        cube.up = RH.transfert(cube.up, newUp)
        cube.back = RH.transfert(cube.back, RH.rotateTwice(newBack))
        cube.down = RH.transfert(cube.down, RH.rotateTwice(newDown))

        return cube
    end

    def moveRwPrime(cube, nbLayers=2)
        for i in 0..2 do
            cube = moveRw(cube, nbLayers)
        end
        return cube
    end

    def moveRw2(cube, nbLayers=2)
        for i in 0..1 do
            cube = moveRw(cube, nbLayers)
        end
        return cube
    end


    def moveFw(cube, nbLayers=2)
        size = cube.front.size
        cube.front = RH.rotate(cube.front)

        newUp = RH.genEmptyFace(size)
        newLeft = RH.genEmptyFace(size)
        newRight = RH.genEmptyFace(size)
        newDown = RH.genEmptyFace(size)

        for j in 0..nbLayers-1 do
            for i in 0..size-1 do
                newUp[i][size-(1+j)] = cube.left[i][size-(1+j)]
                newLeft[j][i] = cube.down[j][i]
                newRight[size-(1+j)][i] = cube.up[size-(1+j)][i]
                newDown[i][j] = cube.right[i][j]
            end
        end

        cube.up = RH.transfert(cube.up, RH.rotate(newUp))
        cube.left = RH.transfert(cube.left, RH.rotate(newLeft))
        cube.right = RH.transfert(cube.right, RH.rotate(newRight))
        cube.down = RH.transfert(cube.down, RH.rotate(newDown))

        return cube
    end

    def moveFwPrime(cube, nbLayers=2)
        for i in 0..2 do
            cube = moveFw(cube, nbLayers)
        end
        return cube
    end

    def moveFw2(cube, nbLayers=2)
        for i in 0..1 do
            cube = moveFw(cube, nbLayers)
        end
        return cube
    end

end
