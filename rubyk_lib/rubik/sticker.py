
RGB_DICT = {
    "white": (255,255,255),
    "yellow": (255,255,0),
    "blue": (0,0,255),
    "red": (255,0,0),
    "green": (0,255,0),
    "orange": (255,150,0)
}

class Sticker:
    
    def __init__(self, color: str) -> None:
        self.color = color
        try:
            self.sprite = RGB_DICT[color]
        except:
            self.sprite = (32,32,32)
            
    def to_dict(self) -> dict:
        return {
            "color": self.color,
            "sprite": self.sprite
        }
    
    @staticmethod
    def format(dico) -> object:
        return Sticker(dico["color"])
    
    