
class CentersCaster

    def initialize()
        @size = 0
    end

    protected def getActualFace(cube, face)
        case face
        when "up"
            return cube.up
        when "front"
            return cube.front
        when "left"
            return cube.left
        when "right"
            return cube.right
        when "down"
            return cube.down
        when "back"
            return cube.back
        else
            return cube.front
        end
    end

    protected def getStringCenters(colorToFilter, centers)
        content = ""
        centers.each do |row|
            row.each do |elem|
                content += if elem == colorToFilter then "1" else "0" end
            end
        end
        return content
    end

    protected def extractCenters(actualFace)
        return []
    end

    public def cast(cube, face, colorToFilter)
        if cube.front.length() != @size
            raise "Cube must be a #{@size}x#{@size} to use CenterCaster class"
        actualFace = getActualFace(cube, face)
        actualCenters = extractCenters(actualFace)
        return getStringCenters(colorToFilter, actualCenters)
    end

end
