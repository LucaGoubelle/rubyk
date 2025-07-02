require "./solver_helpers/CubeAlgorithms.rb"

class PLLProcessor
    attr_reader :data

    def initialize()
        @data = {
            # T cases
            "BR_GB_RG_OO" => CubeAlgorithms::T_PERM,
            "RG_0R_GO_BB" => CubeAlgorithms::T_PERM,
            "GO_BG_OB_RR" => CubeAlgorithms::T_PERM,
            "OB_RO_BR_GG" => CubeAlgorithms::T_PERM
        }
    end
    
    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        puts inputData
        return result
    end

end
