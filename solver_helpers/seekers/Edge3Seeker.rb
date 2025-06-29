require "./solver_helpers/scanners/Cube3x3Scanner.rb"

class Edge3Seeker
    attr_reader :scanner

    def initialize()
        @scanner = Cube3x3Scanner.new()
    end

    def seekEdge(cube, possibilities)
        targetedOrients = ""
        targetedColors = ""
        edges = @scanner.scanEdges(cube)
        edges.each do |key, value|
            if possibilities.include?(value)
                targetedOrients = key
                targetedColors = value
                break
            end
        end
        result = targetedOrients+"::"+targetedColors
        return result
    end

end
