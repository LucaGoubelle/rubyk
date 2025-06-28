############################
# Rubik's Cube data models #
# @author: LucaGoubelle    #
############################

class Cube
    attr_accessor :back
    attr_accessor :up
    attr_accessor :left
    attr_accessor :front
    attr_accessor :right
    attr_accessor :down

    def initialize(b,u,l,f,r,d)
        @back = b
        @up = u
        @left = l
        @front = f
        @right = r
        @down = d
    end
end
