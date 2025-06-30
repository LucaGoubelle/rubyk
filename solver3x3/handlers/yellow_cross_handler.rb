require "./rubyklib/move/mover.rb"

class YellowCrossHandler
    attr_reader :mover
    
    def initialize()
        @mover = Mover.new()
    end

    # make a yellow cross on top face
    # limit number of OLL to search
    # @author: LucaGoubelle

    def handle(cube)
        cube = create(cube)
        cube = correct(cube)
        return cube
    end



    private def create(cube)
        config = ""
        upSticker = cube.up[0][1]
        leftSticker = cube.up[1][0]
        rightSticker = cube.up[1][2]
        downSticker = cube.up[2][1]
        config += if upSticker == "yellow" then "1" else "0" end
        config += if leftSticker == "yellow" then "1" else "0" end
        config += if rightSticker == "yellow" then "1" else "0" end
        config += if downSticker == "yellow" then "1" else "0" end

        hmap = {
            "1100" => "F R U R' U' R U R' U' F'",
            "0101" => "U F R U R' U' R U R' U' F'",
            "0011" => "U2 F R U R' U' R U R' U' F'",
            "1010" => "U' F R U R' U' R U R' U' F'",
            "1001" => "U F R U R' U' F'",
            "0110" => "F R U R' U' F'",
            "0000" => "F R U R' U' F' U2 F R U R' U' R U R' U' F'"
        }
        cube = if hmap.key?(config) then @mover.multiMoves(cube, hmap[config]) else cube end
        return cube
    end

    private def correct(cube)
        result = ""
        result += cube.front[0][1]+"_"
        result += cube.right[0][1]+"_"
        result += cube.back[0][1]+"_"
        result += cube.left[0][1]

        chair = "R U2 R' U' R U' R'"
        hmap = {}
        
        hmap["green_red_blue_orange"] = chair+" U2 y' "+chair+" y U2"
        hmap["blue_orange_red_green"] = chair + " U'"
        hmap["blue_orange_green_red"] = chair + " U " + chair + " U2"

        hmap["orange_red_green_blue"] = "y' "+chair+" U' y"
        hmap["orange_green_blue_red"] = chair
        hmap["orange_blue_green_red"] = "U2 "+chair+" U"

        hmap["red_blue_green_orange"] = chair+" U'"
        hmap["red_blue_orange_green"] = chair+" U "+chair+" U"

        cube = if hmap.key?(result) then @mover.multiMoves(cube, hmap[result]) else cube end
        return cube
    end

end
