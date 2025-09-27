require "./rubyklib/all.rb"

builder = CubeBuilder.new()
loader = CubeLoader.new()
saver = CubeSaver.new()
dumper = CubeDumper.new()
mover = Mover.new()
scrambler = CubeScrambler.new()
printer = CubePrinter.new()

sizeCube = 3
datafile = "res/rubiks_3.json"
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
    elsif mv == "load"
        cube = loader.load(datafile)
    elsif mv == "save"
        saver.save(datafile, cube)
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
