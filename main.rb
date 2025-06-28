require "./rubyklib/all.rb"

builder = CubeBuilder.new()
mover = Mover.new()
scrambler = CubeScrambler.new()
printer = CubePrinter.new()

cube = builder.build(3)

while true
    
    printer.print(cube)

    mv = gets.chomp

    cube = mover.simpleMove(cube, mv)

    if mv == "scramble"
        cube = scrambler.scramble(cube)
    elsif mv == "exit"
        break
    end

    puts "-------------------------------------\n"
end
