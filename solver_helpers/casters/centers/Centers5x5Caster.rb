require "./solverHelpers/casters/centers/CentersCaster.rb"

class Centers5x5Caster < CentersCaster

    def initialize()
        @size = 5
    end

    protected def extractCenters(actualFace)
        return [
            [actualFace[1][1], actualFace[1][2], actualFace[1][3]],
            [actualFace[2][1], actualFace[2][2], actualFace[2][3]],
            [actualFace[3][1], actualFace[3][2], actualFace[3][3]]
        ]
    end

end
