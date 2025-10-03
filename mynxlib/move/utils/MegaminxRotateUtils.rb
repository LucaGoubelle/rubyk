
class MegaminxRotateUtils

    def self.genEmptyFace()
        return Array.new(2){Array.new(10,""), Array.new(1,"")}
    end

    def self.copyFace(face)
        return Marshal.load(Marshal.dump(face))
    end

    def self.rotate(face)
        newFace = self.genEmptyFace()
        
        newFace[0][0] = face[0][8]
        newFace[0][1] = face[0][9]
        newFace[0][2] = face[0][0]
        newFace[0][3] = face[0][1]
        newFace[0][4] = face[0][2]
        newFace[0][5] = face[0][3]
        newFace[0][6] = face[0][4]
        newFace[0][7] = face[0][5]
        newFace[0][8] = face[0][6]
        newFace[0][9] = face[0][7]

        newFace[1][0] = face[1][0]
        
        return newFace
    end

    def self.rotateAsync(face)
        newFace = self.genEmptyFace()
        
        newFace[0][0] = face[0][2]
        newFace[0][1] = face[0][3]
        newFace[0][2] = face[0][4]
        newFace[0][3] = face[0][5]
        newFace[0][4] = face[0][6]
        newFace[0][5] = face[0][7]
        newFace[0][6] = face[0][8]
        newFace[0][7] = face[0][9]
        newFace[0][8] = face[0][0]
        newFace[0][9] = face[0][1]

        newFace[1][0] = face[1][0]
        
        return newFace
    end

    def self.transfert(face, newFace)
        for i in 0..9
            face[0][i] = (newFace[0][i] != "") ? newFace[0][i] : face[0][i]
        end
        face[1][0] = (newFace[1][0] != "") ? newFace[1][0] : face[1][0]
        return face
    end

end
