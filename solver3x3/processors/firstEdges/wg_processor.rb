
class WGProcessor
    
    def initialize()
        @data = {
            "up_front::white_green" => "y U2 R2 y'",
            "up_front::green_white" => "U' y F R' F' y'",
            "up_left::white_green" => "y U R2 y'",
            "up_left::green_white" => "y2 Lw' U Lw y2",
            "up_right::white_green" => "y U' R2 y'",
            "up_right::green_white" => "y2 Rw U' Rw' y2",
            "up_back::white_green" => "y R2 y'",
            "up_back::green_white" => "y2 U Rw U' Rw' y2",

            "front_left::white_green" => "D L D'",
            "front_left::green_white" => "y' F2 L y",
            "front_right::white_green" => "D' R' D",
            "front_right::green_white" => "y F2 R' F2 y'",

            "back_left::white_green" => "D L' D'",
            "back_left::green_white" => "y' L y",
            "back_right::white_green" => "D' R D",
            "back_right::green_white" => "y R' y'",

            "down_left::white_green" => "L' D L D'",
            "down_left::green_white" => "y' F L y",
            "down_back::green_white" => "y2 F2 U Rw U' Rw' y2"
        }
    end
    
    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        puts result
        return result
    end
end
