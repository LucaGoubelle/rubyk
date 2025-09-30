require 'json'

class CubeSaver
    
    # save a cube object to json file
    # @author: LucaGoubelle
    def save(filepath, cube)
        h = cube.toHash()
        raw = JSON.pretty_generate(h)
        File.write(filepath, raw)
    end
    
end