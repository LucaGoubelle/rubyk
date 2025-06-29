

class Cube2x2Scanner
    
    # scan a corner based on an orient param
    # @author: LucaGoubelle
    def scanCorner(cube, orient)
        size = cube.front.length
        hmap = {
            "up_front_right" => cube.up[size-1][size-1]+"_"+cube.front[0][size-1]+"_"+cube.right[0][0],
            "up_front_left" => cube.up[size-1][0]+"_"+cube.front[0][0]+"_"+cube.left[0][size-1],
            "up_back_left" => cube.up[0][0]+"_"+cube.back[0][size-1]+"_"+cube.left[0][0],
            "up_back_right" => cube.up[0][size-1]+"_"+cube.back[0][0]+"_"+cube.right[0][size-1],
            
            "down_front_left" => cube.down[0][0]+"_"+cube.front[size-1][0]+"_"+cube.left[size-1][size-1],
            "down_front_right" => cube.down[0][size-1]+"_"+cube.front[size-1][size-1]+"_"+cube.right[size-1][0],
            "down_back_left" => cube.down[size-1][0]+"_"+cube.back[size-1][size-1]+"_"+cube.left[size-1][0],
            "down_back_right" => cube.down[size-1][size-1]+"_"+cube.back[size-1][0]+"_"+cube.right[size-1][size-1]
        }
        result = if hmap.key?(orient) then hmap[orient] else "???" end
        return result
    end

    # return full information about all the corners
    # @author: LucaGoubelle
    def scanCorners(cube)
        hmap = {
            "up_front_right" => scanCorner(cube, "up_front_right"),
            "up_front_left" => scanCorner(cube, "up_front_left"),
            "up_back_left" => scanCorner(cube, "up_back_left"),
            "up_back_right" => scanCorner(cube, "up_back_right"),
            
            "down_front_left" => scanCorner(cube, "down_front_left"),
            "down_front_right" => scanCorner(cube, "down_front_right"),
            "down_back_left" => scanCorner(cube, "down_back_left"),
            "down_back_right" => scanCorner(cube, "down_back_right")
        }
        return hmap
    end

end