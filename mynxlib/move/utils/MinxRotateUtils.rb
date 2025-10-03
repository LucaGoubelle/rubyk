
class MinxRotateUtils

    def self.copyFace(face)
        return Marshal.load(Marshal.dump(face))
    end

end