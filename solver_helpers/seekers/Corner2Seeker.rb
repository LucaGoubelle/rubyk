require "./solver_helpers/scanners/Cube2x2Scanner.rb"

class Corner2Seeker
    attr_reader :scanner

    def initialize()
        @scanner = Cube2x2Scanner.new()
    end

    def seekCorner(cube, possibilities)
        targetedOrients = ""
        targetedColors = ""
        corners = @scanner.scanCorners(cube)
        corners.each do |key, value|
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
