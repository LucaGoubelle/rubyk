require "./mynxlib/data/minx.rb"

class GigaminxBuilder

    private def buildFace(elem)
        return Array.new(3){
            Array.new(20,elem), 
            Array.new(10, elem), 
            Array.new(1, elem)
        }
    end

    # build an instance of full minx (complete)
    # @author: LucaGoubelle
    def build()
        u = buildFace("grey")
        f = buildFace("magenta")
        l = buildFace("lime")
        r = buildFace("beige")
        dl = buildFace("blue")
        dr = buildFace("red")
        al = buildFace("yellow")
        ar = buildFace("green")
        bl = buildFace("orange")
        br = buildFace("cyan")
        b = buildFace("purple")
        d = buildFace("white")

        return Minx.new(u, f, l, r, dl, dr, al, ar, bl, br, b, d)
    end
end
