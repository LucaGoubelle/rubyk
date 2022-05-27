import pytest
from unittest.mock import MagicMock, patch
import sys
from typing import List, Dict

sys.path.append("../../")

import rubyk_lib
from rubyk_lib import Rubik


@patch("rubyk_lib.Sticker")
@patch("rubyk_lib.Rubik")
def test_rubik_mock(MockRubik, MockSticker):
    rubyk_lib.Rubik(3)
    assert MockRubik is rubyk_lib.Rubik
    assert MockRubik.called
    for row in MockRubik.back:
        for sticker in row:
            assert MockSticker is rubyk_lib.Sticker
            assert MockSticker.called
    for row in MockRubik.up:
        for sticker in row:
            assert MockSticker is rubyk_lib.Sticker
            assert MockSticker.called
    for row in MockRubik.front:
        for sticker in row:
            assert MockSticker is rubyk_lib.Sticker
            assert MockSticker.called
    for row in MockRubik.left:
        for sticker in row:
            assert MockSticker is rubyk_lib.Sticker
            assert MockSticker.called
    for row in MockRubik.right:
        for sticker in row:
            assert MockSticker is rubyk_lib.Sticker
            assert MockSticker.called
    for row in MockRubik.down:
        for sticker in row:
            assert MockSticker is rubyk_lib.Sticker
            assert MockSticker.called

@patch("rubyk_lib.rubik.Rubik")
def test_rubik_mock_method(MockRubik):
    cube = Rubik(3)
    cube.to_dict = MagicMock()
    cube.to_dict()
    cube.to_dict.assert_called()
    

def test_rubik():
    cube = Rubik(3)
    assert isinstance(cube, Rubik)
    assert cube.size == 3
    assert isinstance(cube.size, int)
    
    assert isinstance(cube.back, List)
    assert isinstance(cube.up, List)
    assert isinstance(cube.front, List)
    assert isinstance(cube.left, List)
    assert isinstance(cube.right, List)
    assert isinstance(cube.down, List)
    
    for row in cube.back:
        assert isinstance(row, List)
        for sticker in row:
            assert isinstance(sticker, rubyk_lib.Sticker)
            assert sticker.color == "green"
            assert isinstance(sticker.color, str)
            assert sticker.sprite == (0,255,0)
            assert isinstance(sticker.sprite, tuple)
    for row in cube.up:
        assert isinstance(row, List)
        for sticker in row:
            assert isinstance(sticker, rubyk_lib.Sticker)
            assert sticker.color == "yellow"
            assert isinstance(sticker.color, str)
            assert sticker.sprite == (255,255,0)
            assert isinstance(sticker.sprite, tuple)
    for row in cube.front:
        assert isinstance(row, List)
        for sticker in row:
            assert isinstance(sticker, rubyk_lib.Sticker)
            assert sticker.color == "blue"
            assert isinstance(sticker.color, str)
            assert sticker.sprite == (0,0,255)
            assert isinstance(sticker.sprite, tuple)
    for row in cube.left:
        assert isinstance(row, List)
        for sticker in row:
            assert isinstance(sticker, rubyk_lib.Sticker)
            assert sticker.color == "orange"
            assert isinstance(sticker.color, str)
            assert sticker.sprite == (255,150,0)
            assert isinstance(sticker.sprite, tuple)
    for row in cube.right:
        assert isinstance(row, List)
        for sticker in row:
            assert isinstance(sticker, rubyk_lib.Sticker)
            assert sticker.color == "red"
            assert isinstance(sticker.color, str)
            assert sticker.sprite == (255,0,0)
            assert isinstance(sticker.sprite, tuple)
    for row in cube.down:
        assert isinstance(row, List)
        for sticker in row:
            assert isinstance(sticker, rubyk_lib.Sticker)
            assert sticker.color == "white"
            assert isinstance(sticker.color, str)
            assert sticker.sprite == (255,255,255)
            assert isinstance(sticker.sprite, tuple)


@pytest.mark.parametrize(
    "size",
    [2,3,4,5,10]
)
def test_rubik_size_multiple(size):
    cube = Rubik(size)
    assert cube.size == size
    assert len(cube.back) == size
    assert len(cube.up) == size
    assert len(cube.front) == size
    assert len(cube.left) == size
    assert len(cube.right) == size
    assert len(cube.down) == size
    
def test_rubik_square_matrix():
    cube = Rubik(3)
    for row in cube.back:
        assert len(row) == len(cube.back)
    for row in cube.up:
        assert len(row) == len(cube.up)
    for row in cube.front:
        assert len(row) == len(cube.front)
    for row in cube.left:
        assert len(row) == len(cube.left)
    for row in cube.right:
        assert len(row) == len(cube.right)
    for row in cube.down:
        assert len(row) == len(cube.down)
    

def test_rubik_size_failed():
    with pytest.raises(ValueError):
        Rubik(0)
        Rubik(-1)

def test_rubik_size_type_failed():
    with pytest.raises(TypeError):
        Rubik("tyty")
        Rubik(None)
        Rubik(True)
        Rubik(0.5)
        Rubik('c')
        Rubik(1+2j)
         
def test_rubik_failed():
    cube = Rubik(3)
    with pytest.raises(AssertionError):
        assert cube.size == 0
        assert cube.back == []
        assert cube.up == []
        assert cube.front == []
        assert cube.left == []
        assert cube.right == []
        assert cube.down == []
        for row in cube.back:
            assert row == []
            for sticker in row:
                assert sticker.color == "black"
                assert sticker.sprite == (32,32,32)
        for row in cube.up:
            assert row == []
            for sticker in row:
                assert sticker.color == "black"
                assert sticker.sprite == (32,32,32)
        for row in cube.front:
            assert row == []
            for sticker in row:
                assert sticker.color == "black"
                assert sticker.sprite == (32,32,32)
        for row in cube.left:
            assert row == []
            for sticker in row:
                assert sticker.color == "black"
                assert sticker.sprite == (32,32,32)
        for row in cube.back:
            assert row == []
            for sticker in row:
                assert sticker.color == "black"
                assert sticker.sprite == (32,32,32)
        for row in cube.back:
            assert row == []
            for sticker in row:
                assert sticker.color == "black"
                assert sticker.sprite == (32,32,32)

def test_rubik_to_dict():
    cube_dico = Rubik(3).to_dict()
    assert isinstance(cube_dico, Dict)
    for k,v in cube_dico.items():
        assert isinstance(k, str)
        assert isinstance(v, List)
        assert len(v) == 3
        for row in v:
            assert isinstance(row, List)
            assert len(row) == 3
            for dic in row:
                assert isinstance(dic, Dict)

def test_rubik_to_dict_content():
    cube_dico = Rubik(3).to_dict()
    dico = {
        "back": [[{"color":"green","sprite":(0,255,0)} for _ in range(3)] for _ in range(3)],
        "up": [[{"color":"yellow","sprite":(255,255,0)} for _ in range(3)] for _ in range(3)],
        "front": [[{"color":"blue","sprite":(0,0,255)} for _ in range(3)] for _ in range(3)],
        "left": [[{"color":"orange","sprite":(255,150,0)} for _ in range(3)] for _ in range(3)],
        "right": [[{"color":"red","sprite":(255,0,0)} for _ in range(3)] for _ in range(3)],
        "down": [[{"color":"white","sprite":(255,255,255)} for _ in range(3)] for _ in range(3)]   
    }
    assert cube_dico == dico

def test_rubik_to_dict_keys():
    cube_dico = Rubik(3).to_dict()
    keys = [key for key in cube_dico.keys()]
    assert keys == ["back","up","front","left","right","down"]

@pytest.mark.parametrize(
    "size",
    [2,3,4,5,10]
)
def test_rubik_to_dict_size_multiple(size):
    cube_dico = Rubik(size).to_dict()
    for _,v in cube_dico.items():
        assert len(v) == size
        for row in v:
            assert len(row) == size
            
def test_rubik_to_dict_size_failed():
    with pytest.raises(ValueError):
        Rubik(0).to_dict()
        Rubik(-1).to_dict()

def test_rubik_to_dict_type_size_failed():
    with pytest.raises(TypeError):
        Rubik("tyty").to_dict()
        Rubik(None).to_dict()
        Rubik(True).to_dict()
        Rubik(0.5).to_dict()
        Rubik('c').to_dict()
        Rubik(1+2j).to_dict()

def test_rubik_to_dict_failed():
    cube_dico = Rubik(3).to_dict()
    with pytest.raises(AssertionError):
        assert cube_dico == {}
        for k,v in cube_dico.items():
            assert k == "banana"
            assert v == []
            for row in v:
                assert row == []
                for dic in row:
                    assert dic == {}
                    assert dic["color"] == "black"
                    assert dic["sprite"] == (32,32,32)