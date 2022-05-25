from rubyk_lib.rubik.sticker import Sticker

class Rubik:
    
    def __init__(self, size: int=3) -> None:
        try:
            if not isinstance(size, int):
                raise TypeError
            if size <= 0:
                raise ValueError
            self.size = size
            self.back = [[Sticker("green") for _ in range(size)] for _ in range(size)]
            self.up = [[Sticker("yellow") for _ in range(size)] for _ in range(size)]
            self.front = [[Sticker("blue") for _ in range(size)] for _ in range(size)]
            self.left = [[Sticker("orange") for _ in range(size)] for _ in range(size)]
            self.right = [[Sticker("red") for _ in range(size)] for _ in range(size)]
            self.down = [[Sticker("white") for _ in range(size)] for _ in range(size)]
        except ValueError as verr:
            raise ValueError("A Rubik's Cube need a size > 0") from verr
        except TypeError as terr:
            raise TypeError("size attribute must be int") from terr
        
    def to_dict(self) -> dict:
        return {
            "back": [[self.back[i][j].to_dict() for j in range(self.size)] for i in range(self.size)],
            "up": [[self.up[i][j].to_dict() for j in range(self.size)] for i in range(self.size)],
            "front": [[self.front[i][j].to_dict() for j in range(self.size)] for i in range(self.size)],
            "left": [[self.left[i][j].to_dict() for j in range(self.size)] for i in range(self.size)],
            "right": [[self.right[i][j].to_dict() for j in range(self.size)] for i in range(self.size)],
            "down": [[self.down[i][j].to_dict() for j in range(self.size)] for i in range(self.size)]
        }