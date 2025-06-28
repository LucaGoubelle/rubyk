require "./rubyklib/data/Colors.rb"

class CubePrinter
    attr_accessor :hmap

    def initialize()
        @hmap = {
            "white" => Colors::WHITE,
            "yellow" => Colors::YELLOW,
            "blue" => Colors::BLUE,
            "green" => Colors::GREEN,
            "red" => Colors::RED,
            "orange" => Colors::PINK
        }
    end
    
    # print the cube in console
    def print(cube)
        begin
            content = ""
            size = cube.front.size
            for row in cube.up do
                content += printRowUpDown(row)
            end
            for i in 0..size-1 do
                rowL = cube.left[i]
                rowF = cube.front[i]
                rowR = cube.right[i]
                rowB = cube.back[i]
                content += printRowLFRB(rowL, rowF, rowR, rowB)
            end
            for row in cube.down do
                content += printRowUpDown(row)
            end
            puts content
        rescue Exception => e
            raise "ERR: invalid Cube object in arguments..."
        end
    end


    


    private def printRowUpDown(row)
        content = ""
        for i in 0..row.size-1 do
            content += " "
        end
        for elem in row do
            content += @hmap[elem]
        end
        content += "\n"
        return content
    end

    private def printRowLFRB(rowL, rowF, rowR, rowB)
        content = ""
        for elem in rowL do
            content += @hmap[elem]
        end
        for elem in rowF do
            content += @hmap[elem]
        end
        for elem in rowR do
            content += @hmap[elem]
        end
        for elem in rowB do
            content += @hmap[elem]
        end
        content += "\n"
        return content
    end


end
