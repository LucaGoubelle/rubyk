
class CenterProcessor
    attr_reader :data

    def initialize()
        @data = {
            "white_blue" => "z2",
            "white_green" => "x2",
            "yellow_green" => "y2",
            "yellow_red" => "y'",
            "yellow_orange" => "y"
        }
    end

    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        return result     
    end

end