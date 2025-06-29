
class CrownCaster

    # cast color values of crown to string bits if yellow color or not
    # @author: LucaGoubelle
    def cast(crown)
        result = ""
        for row in crown do
            for elem in row do
                result += if elem == "yellow" then "1" else "0" end
            end
        end
        return result
    end

end
