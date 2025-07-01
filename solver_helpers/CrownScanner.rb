
# todo: test it when needed (almost sure that there's a bug)
class CrownScanner

    
    # scan top crown of cube 
    def scanCrown(cube)
        crown = []
        crown = crown.push(scanBackOfCrown(cube))
        for i in 0..cube.up.length-1 do
            crown = crown.push(scanUpOfCrown(cube, i))
        end
        crown = crown.push(scanFrontOfCrown(cube))
        return crown
    end

    ####################
    # private methods ##
    ####################

    private def scanBackOfCrown(cube)
        len = cube.up.length
        last = len-1
        row = []
        last.downto(0) do |i|
            row = row.push(cube.back[0][i])
        end
        return row
    end

    private def scanFrontOfCrown(cube)
        len = cube.up.length
        row = []
        for i in 0..len-1 do
            row = row.push(cube.front[0][i])
        end
        return row
    end

    private def scanUpOfCrown(cube, index)
        last = cube.up.length - 1
        row = []
        row = row.push(cube.left[0][index])
        for i in 0..last do
            row = row.push(cube.up[index][i])
        end
        row = row.push(cube.right[0][last-index])
        return row
    end

end
