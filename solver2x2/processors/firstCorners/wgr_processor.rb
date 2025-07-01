require "./solver_helpers/CubeAlgorithms.rb"

class WGRProcessor
    attr_reader :data

    def initialize()
        @data = {
            "up_front_right::white_green_red" => "U' y "+CubeAlgorithms::ELEVATOR+" y'",
            "up_front_right::red_white_green" => "U' R' U' R",
            "up_front_right::green_red_white" => "U2 R' U R",

            "up_front_left::white_red_green" => "U2 y "+CubeAlgorithms::ELEVATOR+" y'",
            "up_front_left::green_white_red" => "R' U2 R",
            "up_front_left::red_green_white" => "U2 R' U' R",

            "up_back_right::white_red_green" => "y "+CubeAlgorithms::ELEVATOR+" y'",
            "up_back_right::green_white_red" => "U' R' U R",
            "up_back_right::red_green_white" => "R' U' R",
            
            "up_back_left::white_green_red" => "U y "+CubeAlgorithms::ELEVATOR+" y'",
            "up_back_left::red_white_green" => "U R' U' R",
            "up_back_left::green_red_white" => "R' U R",

            "down_front_left::white_green_red" => "L2 y R2 y'",
            "down_front_left::green_red_white" => "R D R'",
            "down_front_left::red_white_green" => "L2 U R' U' R",

            "down_back_left::white_red_green" => "L D L' D'",
            "down_back_left::green_white_red" => "L y' L2 y",
            "down_back_left::red_green_white" => "y' L y",
            
            "down_back_right::red_white_green" => "R' U R U' R' U R",
            "down_back_right::green_red_white" => "R' U' R U R' U' R"

        }
    end

    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        return result
    end

end