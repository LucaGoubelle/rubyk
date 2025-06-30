
class GRProcessor
    
    def initialize()
        @data = {}
    end
    
    def process(inpuData)
        result = if @data.key?(inpuData) then @data[inpuData] else "???" end
    end
end
