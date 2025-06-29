
class PLLScanner
    attr_reader :hmap

    def initialize()
        @hmap = {
            "blue" => "B",
            "red" => "R",
            "orange" => "O",
            "green" => "G"
        }
    end

    # scan a PLL config, return a string of char colors
    # @author: LucaGoubelle
    def scanPLL(cube)
        result = ""
        for elem in cube.front[0] do
            result += @hmap[elem]
        end
        result += "_"
        for elem in cube.right[0] do
            result += @hmap[elem]
        end
        result += "_"
        for elem in cube.back[0] do
            result += @hmap[elem]
        end
        result += "_"
        for elem in cube.left[0] do
            result += @hmap[elem]
        end
        return result
    end
end
