 
import Felgo 3.0
import QtQuick 2.0
import "../entities"
import "." as Levels

LevelBase {
  id: level
  // we need to specify the width to get correct debug draw for our physics
  // the PhysicsWorld component fills it's parent by default, which is the viewPort Item of the gameScene and this item uses the size of the level
  // NOTE: thy physics will also work without defining the width here, so no worries, you can ignore it untill you want to do some physics debugging
  width: 42 * gameScene.gridSize // 42 because our last tile is a size 30 Ground at row 12

  // you could draw your level on a graph paper and then add the tiles here only by defining their row, column and size

  Ground{
      row:0
      width_m: 7
      height_m: 1
  }
  Spikes{
      x: gameScene.gridSize*4
      y:gameScene.gridSize*8
      width: gameScene.gridSize
      height: width
  }
  Platform{
      row:11
      column: 0
      width_m: 3
  }
  Platform{
      row:16
      column: 3
      width_m: 7
  }
  Platform{
      row:17
      column: 6
      width_m: 5
  }
  Mushroom{
      x: gameScene.gridSize*17
      x2: gameScene.gridSize*21
      y:gameScene.gridSize*2
      width: gameScene.gridSize
      height: width
  }
  Platform{
      row:23
      column: 0
      width_m: 2
  }
  Platform{
      row:25
      column: 4
      width_m: 4
  }
  Platform{
      row:29
      column: 7
      width_m: 6
  }
  Mushroom{
      x: gameScene.gridSize*29
      x2: gameScene.gridSize*33
      y:gameScene.gridSize*1
      width: gameScene.gridSize
      height: width
  }
  Mushroom{
      x: gameScene.gridSize*30
      x2: gameScene.gridSize*34
      y:gameScene.gridSize*1
      width: gameScene.gridSize
      height: width
  }
  Platform{
      row:38
      column: 0
      width_m: 2
  }
  Platform{
      row:40
      row2: 42
      column: 3
      width_m: 2
  }
  Platform{
      row:46
      column: 0
      width_m: 5
  }
  Platform{
      row:47
      column: 6
      width_m: 4
  }
  Fly{
        x: gameScene.gridSize*46
        x2: gameScene.gridSize*50
        y:gameScene.gridSize*6
        width: gameScene.gridSize
        height: width
  }
  Platform{
      row:54
      column: 0
      width_m: 5
  }
  Platform{
      row:59
      column: 3
      width_m: 2
  }
  Platform{
      row:64
      column: 6
      width_m: 5
  }
  Mushroom{
      x: gameScene.gridSize*64
      x2: gameScene.gridSize*68
      y:gameScene.gridSize*2
      width: gameScene.gridSize
      height: width
  }
  Fly{
        x: gameScene.gridSize*63
        x2: gameScene.gridSize*61
        y:gameScene.gridSize*1
        width: gameScene.gridSize
        height: width
  }
  Platform{
      row:69
      row2: 72
      column: 4
      width_m: 3
  }
  Platform{
      row:75
      row2: 78
      column: 3
      width_m: 3
  }
  Platform{
      row:81
      column: 2
      width_m: 3
  }
  Platform{
      row:86
      column: 5
      width_m: 7
  }
  Mushroom{
      x: gameScene.gridSize*86
      x2: gameScene.gridSize*92
      y:gameScene.gridSize*3
      width: gameScene.gridSize
      height: width
  }
  Platform{
      row:94
      column: 0
      width_m: 2
  }
  Fly{
        x: gameScene.gridSize*93
        x2: gameScene.gridSize*95
        y:gameScene.gridSize*3
        width: gameScene.gridSize
        height: width
  }

  Platform{
      row:96
      column: 3
      width_m: 3
  }
  Platform{
      row:101
      column: 3
      width_m: 3
  }
  Ground{
      row:106
      width_m: 6
      height_m: 1
  }
  Mushroom{
      x: gameScene.gridSize*106
      x2: gameScene.gridSize*111
      y:gameScene.gridSize*8
      width: gameScene.gridSize
      height: width
  }
  Ground{
      row:112
      width_m: 3
      height_m: 1
  }
  Ground{
      row:115
      id:fin
      width_m: 8
      height_m: 1
  }

  End {
    width: player.width
    height: 300
    x: fin.x
    y:0
  }


}
