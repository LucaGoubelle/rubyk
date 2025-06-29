require "./solver_helpers/scanners/Cube3x3Scanner.rb"

class Cube4x4Scanner < Cube3x3Scanner

    # scan a center piece on 4x4 and upper cube
    # @author: LucaGoubelle
    def scanCenterPiece(cube, orient, coord)
        hmap = {}

        hmap["back"] = cube.back[coord[0]][coord[1]]
        hmap["up"] = cube.up[coord[0]][coord[1]]
        hmap["front"] = cube.front[coord[0]][coord[1]]
        hmap["left"] = cube.left[coord[0]][coord[1]]
        hmap["right"] = cube.right[coord[0]][coord[1]]
        hmap["down"] = cube.down[coord[0]][coord[1]]

        return hmap
    end

    # todo: implement scanEdge(cube, orient)

end
