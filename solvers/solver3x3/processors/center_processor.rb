
class CenterProcessor
    attr_reader :data

    def initialize()
        @data = {
            "white_blue" => "z2",
            "white_green" => "x2",
            "white_red" => "y z2",
            "white_orange" => "y' z2",

            "blue_white" => "x'",
            "blue_yellow" => "x y2",
            "blue_red" => "z' y'",
            "blue_orange" => "z y",

            "green_yellow" => "x",
            "green_white" => "x' y2",
            "green_orange" => "z' y",
            "green_red" => "z y'",

            "red_white" => "x' y'",
            "red_yellow" => "x y",
            "red_blue" => "z",
            "red_green" => "z' y2",

            "orange_white" => "x' y",
            "orange_yellow" => "x y'",
            "orange_blue" => "z'",
            "orange_green" => "z y2",

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
