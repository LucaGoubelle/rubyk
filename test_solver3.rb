require "./rubyklib/all.rb"
require "./solver3x3/solver3x3.rb"

builder = CubeBuilder.new()
scrambler = CubeScrambler.new()
printer = CubePrinter.new()
solver = Solver3x3.new()

sizeCube = 3
cube = builder.build(sizeCube)

puts "\n\n--------------------------------------------\n\n"

cube = scrambler.scramble(cube)
printer.print(cube)

puts "\n\n--------------------------------------------\n\n"

cube = solver.solve(cube)
printer.print(cube)

