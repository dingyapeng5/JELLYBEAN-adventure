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
      width_m: 40
      height_m: 1
  }
  Ground{
      row:12
      width_m: 1
      height_m: 2
  }
  Ground{
      row:18
      width_m: 1
      height_m: 3
  }
  Ground{
      row:24
      width_m: 1
      height_m: 4
  }
  Ground{
      row:32
      width_m: 1
      height_m: 4
  }
  Platform{
      row:7
      column: 4
      width_m: 3
  }
  Mushroom{
      x: gameScene.gridSize*7
      x2: gameScene.gridSize*9
      y:gameScene.gridSize*8
      width: gameScene.gridSize
      height: width
  }
  Mushroom{
      x: gameScene.gridSize*19
      x2: gameScene.gridSize*23
      y:gameScene.gridSize*8
      width: gameScene.gridSize
      height: width
  }
  Mushroom{
      x: gameScene.gridSize*25
      x2: gameScene.gridSize*30
      y:gameScene.gridSize*8
      width: gameScene.gridSize
      height: width
  }
  Mushroom{
      x: gameScene.gridSize*26
      x2: gameScene.gridSize*31
      y:gameScene.gridSize*8
      width: gameScene.gridSize
      height: width
  }
  Fly{
        x: gameScene.gridSize*36
        x2: gameScene.gridSize*40
        y:gameScene.gridSize*6
        width: gameScene.gridSize
        height: width
  }


  Ground{
      row:44
      width_m: 13
      height_m: 1
  }
  Platform{
      row:48
      column: 4
      width_m: 4
  }
  Spikes{
      x: gameScene.gridSize*49
      y:gameScene.gridSize*4
      width: gameScene.gridSize
      height: width
  }
  Platform{
      row:52
      column: 7
      width_m: 7
  }




  Ground{
      row:61
      width_m: 16
      height_m: 1
  }
  Platform{
      row:63
      column: 7
      width_m: 4
  }
  Platform{
      row:67
      column: 4
      width_m: 1
  }
  Platform{
      row:71
      column: 4
      width_m: 2
  }
  Mushroom{
      x: gameScene.gridSize*67
      x2: gameScene.gridSize*72
      y:gameScene.gridSize*8
      width: gameScene.gridSize
      height: width
  }
  Ground{
      row:81
      width_m: 5
      height_m: 1
  }
  Ground{
      row:82
      width_m: 4
      height_m: 2
  }
  Ground{
      row:83
      width_m: 3
      height_m: 3
  }
  Ground{
      row:84
      width_m: 2
      height_m: 4
  }
  Ground{
      row:85
      width_m: 7
      height_m: 5
  }
  Ground{
      row:92
      id:fin
      width_m: 8
      height_m: 5
  }

  End {
    width: player.width
    height: 150
    x: fin.x
    y:0
  }
}

