import pytest
import sys

sys.path.append("../../../")
from rubyk_lib import Sticker

def test_sticker():
    stk = Sticker("white")
    assert stk.color == "white"
    assert stk.sprite == (255,255,255)
    
    stk2 = Sticker("tyty")
    assert stk2.color == "tyty"
    assert stk2.sprite == (32,32,32)
    
    assert isinstance(stk, Sticker)
    assert isinstance(stk.color, str)
    assert isinstance(stk.sprite, tuple)

def test_sticker_todict():
    dico_stk = Sticker("white").to_dict()
    keys = [key for key in dico_stk.keys()]
    assert keys == ["color","sprite"]
    assert dico_stk == {"color": "white", "sprite": (255,255,255)}
    assert isinstance(dico_stk, dict)
    assert isinstance(dico_stk["color"], str)
    assert isinstance(dico_stk["sprite"], tuple)
    
def test_sticker_format():
    dico = {"color": "white", "sprite": (255,255,255)}
    stk = Sticker.format(dico)
    assert isinstance(stk, Sticker)
    assert isinstance(stk.color, str)
    assert isinstance(stk.sprite, tuple)
    
    assert stk.color == "white"
    assert stk.sprite == (255,255,255)