require "./solver_helpers/CrownScanner.rb"
require "./solver_helpers/CrownCaster.rb"


class OLLScanner
    attr_reader :scanner
    attr_reader :caster

    def initialize()
        @scanner = CrownScanner.new()
        @caster = CrownCaster.new()
    end

    # scan OLL config, return a string bits if yellow color or not
    # @author: LucaGoubelle
    def scanOLL(cube)
        crown = @scanner.scanCrown(cube)
        result = @caster.cast(crown)
        return result
    end

end
