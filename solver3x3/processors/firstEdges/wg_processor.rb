
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

            "down_left::white_green" => "L' D L D'",
            "down_left::green_white" => "y' F L y",
            "down_back::green_white" => "y2 F2 U Rw U' Rw' y2"
        }
    end
    
    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        return result
    end
end
