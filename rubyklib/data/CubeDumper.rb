require 'json'

class CubeDumper

    # dump a JSON from cube object
    # @author: LucaGoubelle

    def dump(cube)
        result = JSON.generate(cube.toHash)
        return result
    end

end
