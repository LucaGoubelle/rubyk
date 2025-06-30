require "./solver2x2/handlers/start_handler.rb"
require "./solver2x2/handlers/first_face_handler.rb"
require "./solver2x2/handlers/last_face_handler.rb"

class Solver2x2
    attr_reader :startHandler
    attr_reader :firstFaceHandler
    attr_reader :lastFaceHandler

    def initialize()
        @startHandler = StartHandler.new()
        @firstFaceHandler = FirstFaceHandler.new()
        @lastFaceHandler = LastFaceHandler.new()
    end

    # solve a 2x2 cube, return altered cube
    # @author: LucaGoubelle

    def solve(cube)
        cube = @startHandler.handle(cube)
        cube = @firstFaceHandler.handle(cube)
        cube = @lastFaceHandler.handle(cube)
        return cube
    end
    
end
