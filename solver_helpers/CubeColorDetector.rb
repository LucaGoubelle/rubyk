
class CubeColorDetector
    
    def detectColorOnFace(face, color)
        size = face.length
        last = size - 1
        result = Array.new(size){ Array.new(size) }
        for i in 0..last do
            for j in 0..last do
                result[i][j] = if face[i][j] == color then 1 else 0 end
            end
        end
        return result
    end

    def detectColorOnEdge(edge, colors)
        results = edge.split("_")
        cond1 = results.include?(colors[0])
        cond2 = results.include?(colors[1])
        return cond1 && cond2
    end

    def detectColorOnCorner(corner, colors)
        results = corner.split("_")
        cond1 = results.include?(colors[0])
        cond2 = results.include?(colors[1])
        cond3 = results.include?(colors[2])
        return cond1 && cond2 && cond3
    end

end
