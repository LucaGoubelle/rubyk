
class PLLProcessor
    attr_reader :data

    def initialize()
        @data = {}
    end

    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        return result
    end
end
