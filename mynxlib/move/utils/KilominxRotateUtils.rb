
class KilominxRotateUtils

    def self.genEmptyFace()
        return Array.new(5, "")
    end

    def self.copyFace(face)
        return Marshal.load(Marshal.dump(face))
    end

    def self.rotate(face)
        newFace = self.genEmptyFace()
        
        newFace[0] = face[4]
        newFace[1] = face[0]
        newFace[2] = face[1]
        newFace[3] = face[2]
        newFace[4] = face[3]

        return newFace
    end

    def self.rotateAsync(face)
        newFace = self.genEmptyFace()
        
        newFace[0] = face[1]
        newFace[1] = face[2]
        newFace[2] = face[3]
        newFace[3] = face[4]
        newFace[4] = face[0]

        return newFace
    end

    def self.transfert(face, newFace)
        size = face.size
        for i in 0..size-1
            face[i] = (newFace[i] != "") ? newFace[i] : face[i]
        end
        return face
    end
    
end
