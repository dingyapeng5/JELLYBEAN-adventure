import Felgo 3.0
import QtQuick 2.0
import "../entities"
import "../common"
//import "." as Levels

/*Levels.*/LevelBase {
  id: level
  levelName:"Level3"
  // we need to specify the width to get correct debug draw for our physics
  // the PhysicsWorld component fills it's parent by default, which is the viewPort Item of the gameScene and this item uses the size of the level
  // NOTE: thy physics will also work without defining the width here, so no worries, you can ignore it untill you want to do some physics debugging
  width: 42 * gameScene.gridSize // 42 because our last tile is a size 30 Ground at row 12

  // you could draw your level on a graph paper and then add the tiles here only by defining their row, column and size

  Ground{
      row:0
      width_m: 5
      height_m: 1
  }
  Ground{
      row:6
      width_m: 5
      height_m: 2
  }
  Ground{
      row:12
      width_m: 5
      height_m: 3
  }
  Mushroom{
      x: gameScene.gridSize*14
      x2: gameScene.gridSize*16
      y:gameScene.gridSize*3
      width: gameScene.gridSize
      height: width
  }

  Spikes{
      x: gameScene.gridSize*9
      y:gameScene.gridSize*7
      width: gameScene.gridSize
      height: width
  }
  Platform{
      row:14
      column: 5
      width_m: 3
  }
  Ground{
      row:19
      width_m: 5
      height_m: 3
  }
  Mushroom{
      x: gameScene.gridSize*19
      x2: gameScene.gridSize*23
      y:gameScene.gridSize*6
      width: gameScene.gridSize
      height: width
  }

  Platform{
      row:20
      row2: 26
      column: 6
      width_m: 3
  }
  Ground{
      row:33
      width_m: 5
      height_m: 8
  }
  Spikeball{
      x: gameScene.gridSize*35
      y:gameScene.gridSize*1
      width: gameScene.gridSize
      height: width
  }
  Ground{
      row:40
      width_m: 5
      height_m: 2
  }
  Mushroom{
      x: gameScene.gridSize*40
      x2: gameScene.gridSize*42
      y:gameScene.gridSize*7
      width: gameScene.gridSize
      height: width
  }
  Ground{
      row:43
      width_m: 5
      height_m: 5
  }
  Spikes{
      x: gameScene.gridSize*45
      y:gameScene.gridSize*4
      width: gameScene.gridSize
      height: width
  }

  Ground{
      row:46
      width_m: 5
      height_m: 7
  }
  Platform{
      row:53
      column: 6
      width_m: 1
  }
  Platform{
      row:56
      column: 6
      width_m: 1
  }
  Platform{
      row:59
      row2: 62
      column: 6
      width_m: 1
  }
  Ground{
      row:59
      width_m: 3
      height_m: 1
  }
  Platform{
      row:65
      column: 6
      width_m: 1
  }
  Platform{
      row:68
      column: 6
      width_m: 1
  }
  Platform{
      row:71
      column: 6
      width_m: 4
  }
  Ground{
      row:65
      width_m: 3
      height_m: 2
  }

  Mushroom{
      x: gameScene.gridSize*65
      x2: gameScene.gridSize*67
      y:gameScene.gridSize*7
      width: gameScene.gridSize
      height: width
  }
  Ground{
      row:71
      width_m: 5
      height_m: 3
  }

  Fly{
        x: gameScene.gridSize*76
        x2: gameScene.gridSize*80
        y:gameScene.gridSize*5
        width: gameScene.gridSize
        height: width
  }
  Ground{
      row:80
      width_m: 5
      height_m: 1
  }
  Ground{
      row:81
      width_m: 4
      height_m: 2
  }
  Ground{
      row:82
      width_m: 3
      height_m: 3
  }
  Ground{
      row:83
      width_m: 2
      height_m: 4
  }
  Ground{
      row:84
      width_m: 7
      height_m: 5
  }
  Ground{
      row:91
      id:fin
      width_m: 8
      height_m: 5
  }

  End {
    width: player.width
    height: 150
    x: fin.x
    y:0


    /*Rectangle {//可以去除
      anchors.fill: parent
      color: "yellow"
      opacity: 0.6//透明度
      Text {
        anchors.centerIn: parent
        text: "终点"
        color: "white"
        font.pixelSize: 9
      }
    }*/
  }


  /*Fly{
      x: gameScene.gridSize*9
      x2: gameScene.gridSize*11
      y:gameScene.gridSize*3
      width: gameScene.gridSize
      height: width
  }*/





}
