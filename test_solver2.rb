require "./rubyklib/all.rb"
require "./solver2x2/solver2x2.rb"

builder = CubeBuilder.new()
scrambler = CubeScrambler.new()
printer = CubePrinter.new()
solver = Solver2x2.new()

sizeCube = 2
cube = builder.build(sizeCube)

puts "\n\n--------------------------------------------\n\n"

cube = scrambler.scramble(cube)
printer.print(cube)

puts "\n\n--------------------------------------------\n\n"

cube = solver.solve(cube)
printer.print(cube)
