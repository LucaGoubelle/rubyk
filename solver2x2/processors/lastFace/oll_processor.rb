require "./solver_helpers/CubeAlgorithms.rb"

class OLLProcessor
    attr_reader :data

    def initialize()
        @data = {
            # antisunes cases
            "00_1010_0001_10_" => CubeAlgorithms::ANTISUNE_ORIENT,
            "01_0100_0001_10_" => "U "+CubeAlgorithms::ANTISUNE_ORIENT,
            "01_1000_0010_10_" => "U' "+CubeAlgorithms::ANTISUNE_ORIENT,
            "01_1000_0101_00_" => "U2 "+CubeAlgorithms::ANTISUNE_ORIENT,

            # sunes cases
            "10_0001_0100_01_" => CubeAlgorithms::SUNE_ORIENT,

            # U cases
            "00_1010_1010_00_" => "F R U R' U' F'",
            "00_0110_0000_11_" => "U F R U R' U' F'",

            # Pi cases
            "01_1000_1000_01_" => CubeAlgorithms::PI_ORIENT,
            "00_1001_0000_11_" => "U "+CubeAlgorithms::PI_ORIENT,
            "10_0001_0001_10_" => "U2 "+CubeAlgorithms::PI_ORIENT,
            "11_0000_1001_00_" => "U' "+CubeAlgorithms::PI_ORIENT
        }
    end
    
    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        puts inputData
        return result
    end

end
