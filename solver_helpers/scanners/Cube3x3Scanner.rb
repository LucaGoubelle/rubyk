require "./solver_helpers/scanners/Cube2x2Scanner.rb"

class Cube3x3Scanner < Cube2x2Scanner

    # scan a center on 3x3 cube based on orient param
    # @author: LucaGoubelle
    def scanCenter(cube, orient)
        hmap = {
            "up" => cube.up[1][1],
            "down" => cube.down[1][1],
            "left" => cube.left[1][1],
            "right" => cube.right[1][1],
            "front" => cube.front[1][1],
            "back" => cube.back[1][1],
        }
        result = if hmap.key?(orient) then hmap[orient] else "???" end
        return result
    end

    # scan an edge based on orient param
    # @author: LucaGoubelle
    def scanEdge(cube, orient)
        hmap = {}
        hmap["up_front"] = cube.up[2][1]+"_"+cube.front[0][1]
        hmap["up_right"] = cube.up[1][2]+"_"+cube.right[0][1]
        hmap["up_left"] = cube.up[1][0]+"_"+cube.left[0][1]
        hmap["up_back"] = cube.up[0][1]+"_"+cube.back[0][1]
    
        hmap["front_left"] = cube.front[1][0]+"_"+cube.left[1][2]
        hmap["front_right"] = cube.front[1][2]+"_"+cube.right[1][0]
        hmap["back_left"] = cube.back[1][2]+"_"+cube.left[1][0]
        hmap["back_right"] = cube.back[1][0]+"_"+cube.right[1][2]

        hmap["down_front"] = cube.down[0][1]+"_"+cube.front[2][1]
        hmap["down_right"] = cube.down[1][2]+"_"+cube.right[2][1]
        hmap["down_left"] = cube.down[1][0]+"_"+cube.left[2][1]
        hmap["down_back"] = cube.down[2][1]+"_"+cube.back[2][1]

        result = if hmap.key?(orient) then hmap[orient] else "???" end
        return result
    end

    # return full information about all the edges
    # @author: LucaGoubelle
    def scanEdges(cube)
        hmap = {}
        
        hmap["up_front"] = scanEdge(cube, "up_front")
        hmap["up_left"] = scanEdge(cube, "up_left")
        hmap["up_right"] = scanEdge(cube, "up_right")
        hmap["up_back"] = scanEdge(cube, "up_back")

        hmap["front_left"] = scanEdge(cube, "front_left")
        hmap["front_right"] = scanEdge(cube, "front_right")
        hmap["back_left"] = scanEdge(cube, "back_left")
        hmap["back_right"] = scanEdge(cube, "back_right")
        
        hmap["down_front"] = scanEdge(cube, "down_front")
        hmap["down_left"] = scanEdge(cube, "down_left")
        hmap["down_right"] = scanEdge(cube, "down_right")
        hmap["down_back"] = scanEdge(cube, "down_back")
        
        return hmap
    end

end
