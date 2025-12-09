require "./solverHelpers/casters/centers/CentersCaster.rb"

class Centers4x4Caster < CentersCaster

    def initialize()
        @size = 4
    end

    protected def extractCenters(actualFace)
        return [
            [actualFace[1][1], actualFace[1][2]],
            [actualFace[2][1], actualFace[2][2]]
        ]
    end

end
