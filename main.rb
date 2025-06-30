require "./rubyklib/all.rb"

builder = CubeBuilder.new()
dumper = CubeDumper.new()
mover = Mover.new()
scrambler = CubeScrambler.new()
printer = CubePrinter.new()

sizeCube = 3
cube = builder.build(sizeCube)

while true
    # Printing the cube
    printer.print(cube)

    # User Input
    puts "\nENTER A MOVE OR CMD :"
    mv = gets.chomp

    # Move Handle
    cube = mover.simpleMove(cube, mv)

    # CMD Handle
    if mv == "scramble"
        cube = scrambler.scramble(cube)
    elsif mv == "init"
        cube = builder.build(sizeCube)
    elsif mv == "dump"
        puts dumper.dump(cube)
    elsif mv == "exit"
        break
    end

    # IHM jump
    puts "\n\n-------------------------------------\n\n"
end
