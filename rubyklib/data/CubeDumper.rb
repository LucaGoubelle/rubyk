require 'json'

class CubeDumper

    # dump a JSON cube

    def dump(cube)
        result = JSON.generate(cube.toHash)
        return result
    end

end
