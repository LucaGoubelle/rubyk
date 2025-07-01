require "./solver_helpers/CubeAlgorithms.rb"

class WGRProcessor
    attr_reader :data

    def initialize()
        @data = {
            "up_front_right::white_green_red" => "U' y "+CubeAlgorithms::ELEVATOR+" y'",
            "up_front_left::white_red_green" => "U2 y "+CubeAlgorithms::ELEVATOR+" y'",
            "up_back_right::white_red_green" => "y "+CubeAlgorithms::ELEVATOR+" y'",
            "up_back_left::white_green_red" => "U y "+CubeAlgorithms::ELEVATOR+" y'",

            "down_front_left::white_green_red" => "L2 y R2 y'",
            "down_back_left::white_red_green" => "L D L' D'"
        }
    end

    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        return result
    end

end