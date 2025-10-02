
class Minx
    attr_accessor :up
    attr_accessor :front
    attr_accessor :left
    attr_accessor :right
    attr_accessor :downleft
    attr_accessor :downright
    attr_accessor :absleft
    attr_accessor :absright
    attr_accessor :backleft
    attr_accessor :backright
    attr_accessor :back
    attr_accessor :down

    #############################
    # Minx's puzzle data models #
    # @author: LucaGoubelle     #
    #############################

    def initialize(u, f, l, r, dl, dr, al, ar, bl, br, b, d)
        @up = u
        @front = f
        @left = l
        @right = r
        @downleft = dl
        @downright = dr
        @absleft = al
        @absright = ar
        @backleft = bl
        @backright = br
        @back = b
        @down = d
    end

    # return an Hash of minx object
    # @author: LucaGoubelle
    def toHash()
        result = {
            "up" => @up,
            "front" => @front,
            "left" => @left,
            "right" => @right,
            "downleft" => @downleft,
            "downright" => @downright,
            "absleft" => @absleft,
            "absright" => @absright,
            "backleft" => @backleft,
            "backright" => @backright,
            "back" => @back,
            "down" => @down
        }
        return result
    end

end