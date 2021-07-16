import QtQuick 2.0
import QtQuick 2.0
import Felgo 3.0

TileEntityBase {
  id: ground
  entityType: "ground"

  //size: 2 // must be >= 2, because we got a sprite for the start, one for the end and a repeatable center sprite
  column: height_m-1

  Column{
      Rectangle{
          width: gameScene.gridSize*width_m
          height: gameScene.gridSize
          color: "grey"
          Image {
              width: parent.width
              height: parent.height
              //fillMode: Image.Tile
              fillMode: Image.TileHorizontally
              source: "../../assets/ground/grass.png"
          }
      }
      Rectangle{
          width: gameScene.gridSize*width_m
          height: gameScene.gridSize*height_m
          color: "grey"
          Image {
              width: parent.width
              height: parent.height
              fillMode: Image.Tile
              source: "../../assets/ground/dirt.png"
          }
      }
  }


  BoxCollider {
    anchors.fill: parent
    bodyType: Body.Static
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") player.contacts++
    }
    fixture.onEndContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") player.contacts--
    }
  }

}






