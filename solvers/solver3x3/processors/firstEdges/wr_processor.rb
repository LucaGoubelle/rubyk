
class WRProcessor
    
    def initialize()
        @data = {
            "up_front::white_red" => "U' R2",
            "up_front::red_white" => "F R' F'",
            "up_left::white_red" => "U2 R2",
            "up_left::red_white" => "U' F R' F'",
            "up_right::white_red" => "R2",
            "up_right::red_white" => "U F R' F'",
            "up_back::white_red" => "U R2",
            "up_back::red_white" => "U2 F R' F'",

            "down_left::white_red" => "L' D2 L D2",
            "down_left::red_white" => "L2 U' F R' F'",
            "down_back::white_red" => "F D' F'",
            "down_back::red_white" => "y R F y'",
            "down_right::red_white" => "y F2 U Rw U' Rw' y'"
        }
    end
    
    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        return result
    end
end
