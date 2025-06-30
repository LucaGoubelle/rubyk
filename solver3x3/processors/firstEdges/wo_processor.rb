
class WOProcessor
    
    def initialize()
        @data = {
            "up_front::white_orange" => "U L2",
            "up_front::orange_white" => "F' L F",
            "up_left::white_orange" => "L2",
            "up_left::orange_white" => "y' U Rw U' Rw' y",
            "up_right::white_orange" => "U2 L2",
            "up_right::orange_white" => "U' y' Rw U' Rw' y",
            "up_back::white_orange" => "U' L2",
            "up_back::orange_white" => "y' Rw U' Rw' y",

            "down_left::orange_white" => "y' F2 U Rw U' Rw' y"
        }
    end
    
    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        return result
    end
end
