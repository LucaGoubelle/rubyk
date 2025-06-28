
class RotateHelpers 
    
    def self.genEmptyFace(size)
        return Array.new(size) { Array.new(size, "") }
    end

    def self.copyFace(face)
        return Marshal.load(Marshal.dump(face))
    end

    def self.rotate(face)
        size = face.size
        newFace = self.genEmptyFace(size)
        for i in 0..size-1
            cnt = size-1
            for j in 0..size-1
                newFace[i][j] = face[cnt][i]
                cnt -= 1
            end
        end
        return newFace
    end

    def self.rotateAsync(face)
        size = face.size
        newFace = self.genEmptyFace(size)
        cnt = size-1
        for i in 0..size-1
            for j in 0..size-1
                newFace[i][j] = face[j][cnt]
            end
            cnt -= 1
        end
        return newFace
    end

    def self.rotateTwice(face)
        newFace = self.rotate(face)
        rotatedFace = self.rotate(newFace)
        return rotatedFace
    end

    def self.transfert(face, newFace)
        size = face.size
        for i in 0..size-1
            for j in 0..size-1
                face[i][j] = (newFace[i][j] != "") ? newFace[i][j] : face[i][j]
            end
        end
        return face
    end
    
end
