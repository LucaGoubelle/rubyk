
class CubeStrDumper
    
    def initialize()
      @hmap = {
        "green" => "G",
        "blue" => "B",
        "red" => "R",
        "orange" => "O",
        "white" => "W",
        "yellow" => "Y"
      }
    end

    private def dump_face(face)
        content = ""
        face.each do |row|
            row.each do |elem|
                content += @hmap[elem] or "?"
            end
        end
        return content
    end 
    
    def dump(cube)
        content = ""
        content += dump_face(cube.back) + "_"
        content += dump_face(cube.up) + "_"
        content += dump_face(cube.front) + "_"
        content += dump_face(cube.left) + "_"
        content += dump_face(cube.right) + "_"
        content += dump_face(cube.down)
        return content
    end
end
