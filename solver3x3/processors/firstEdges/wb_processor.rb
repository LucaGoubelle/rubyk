
class WBProcessor
    
    def initialize()
        @data = {
            "up_front::white_blue" => "F2",
            "up_front::blue_white" => "U Rw U' Rw'",
            "up_right::white_blue" => "U F2",
            "up_right::blue_white" => "U2 Rw U' Rw'",
            "up_left::white_blue" => "U' F2",
            "up_left::blue_white" => "Rw U' Rw'",
            "up_back::white_blue" => "U2 F2",
            "up_back::blue_white" => "U' Rw U' Rw'",

            "front_right::white_blue" => "R' D'",
            "front_right::blue_white" => "F",
            "front_left::white_blue" => "L D",
            "front_left::blue_white" => "F'",

            "back_right::white_blue" => "R D'",
            "back_right::blue_white" => "R2 F",
            "back_left::white_blue" => "L' D",
            "back_left::blue_white" => "L2 F'",

            "down_right::white_blue" => "D'",
            "down_right::blue_white" => "R F",
            "down_left::white_blue" => "D",
            "down_left::blue_white" => "L' F'",
            "down_back::white_blue" => "D2",
            "down_back::blue_white" => "D L' F'",
            "down_front::blue_white" => "F2 U Rw U' Rw'"
        }
    end
    
    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        return result
    end
end
