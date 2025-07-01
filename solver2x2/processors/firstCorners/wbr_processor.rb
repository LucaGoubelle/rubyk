

class WBRProcessor
    attr_reader :data

    def initialize()
        @data = {
            "up_front_right::white_red_blue" => "U' R2",
            "up_front_right::blue_white_red" => "R'",
            "up_front_right::red_blue_white" => "F",

            "up_front_left::white_blue_red" => "F2",
            "up_front_left::red_white_blue" => "U' F",
            "up_front_left::blue_red_white" => "U' R'",

            "up_back_right::white_blue_red" => "R2",
            "up_back_right::red_white_blue" => "U F",
            "up_back_right::blue_red_white" => "U R'",

            "up_back_left::white_red_blue" => "U R2",
            "up_back_left::blue_white_red" => "U2 R'",
            "up_back_left::red_blue_white" => "U2 F",


            "down_front_left::white_red_blue" => "D",
            "down_front_left::blue_white_red" => "L D2",
            "down_front_left::red_blue_white" => "F'",

            "down_back_left::white_blue_red" => "D2",
            "down_back_left::red_white_blue" => "L' D",
            "down_back_left::blue_red_white" => "L' F'",

            "down_back_right::white_red_blue" => "D'",
            "down_back_right::blue_white_red" => "R",
            "down_back_right::red_blue_white" => "R2 F",
            
            "down_front_right::red_white_blue" => "R' D'",
            "down_front_right::blue_red_white" => "F D"
        }
    end

    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        return result
    end

end
