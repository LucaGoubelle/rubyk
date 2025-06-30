
class WBRProcessor
    attr_reader :data

    def initialize()
        #todo: add cases to process
        @data = {}
    end

    def process(inputData)
        result = if @data.key?(inputData) then @data[inputData] else "???" end
        return result
    end

end
