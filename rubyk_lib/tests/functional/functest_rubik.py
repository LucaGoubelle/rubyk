import sys

sys.path.append("../../../")
from rubyk_lib import Rubik

cube = Rubik(3)
dico_cube = cube.to_dict()

print(dico_cube)