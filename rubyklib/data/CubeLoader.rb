require 'json'
require "./rubyklib/data/cube.rb"

class CubeLoader

    # load a Cube object from a json file
    # @author: LucaGoubelle
    def load(filepath)
        raw_data = File.read(filepath)
        json_data = JSON.parse(raw_data)
        cube_data = Cube.new(json_data["back"], json_data["up"], json_data["left"], json_data["front"], json_data["right"], json_data["down"])
        return cube_data
    end

end
