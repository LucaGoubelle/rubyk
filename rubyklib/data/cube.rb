
class Cube
    attr_accessor :back
    attr_accessor :up
    attr_accessor :left
    attr_accessor :front
    attr_accessor :right
    attr_accessor :down

    ############################
    # Rubik's Cube data models #
    # @author: LucaGoubelle    #
    ############################

    def initialize(b,u,l,f,r,d)
        @back = b
        @up = u
        @left = l
        @front = f
        @right = r
        @down = d
    end

    # return an Hash of cube object
    # @author: LucaGoubelle
    def toHash()
        result = {
            "back" => @back,
            "up" => @up,
            "front" => @front,
            "left" => @left,
            "right" => @right,
            "down" => @down
        }
        return result
    end
    
end
