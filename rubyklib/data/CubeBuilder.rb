require "./rubyklib/data/cube.rb"

class CubeBuilder

    private def buildFace(size, color)
        return Array.new(size){Array.new(size,color)}
    end

    # build an instance of full cube (complete)
    # @author: LucaGoubelle

    def build(size)
        begin
            b = buildFace(size, "green")
            u = buildFace(size, "yellow")
            l = buildFace(size, "orange")
            f = buildFace(size, "blue")
            r = buildFace(size, "red")
            d = buildFace(size, "white")
            return Cube.new(b,u,l,f,r,d)
        rescue Exception => e
            raise "ERR: invalid size argument..."
        end
    end
end
