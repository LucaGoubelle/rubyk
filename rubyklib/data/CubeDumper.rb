
class CubeDumper

    # dump a JSON cube

    def dump(cube)
        result = Marshal.dump(cube)
        return result
    end

end
