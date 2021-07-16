import QtQuick 2.0
import Felgo 3.0

TileEntityBase {
  id: plat
  entityType: "platform"
  height_m: 1
  //size: 2 // must be >= 2, because we got a sprite for the start, one for the end and a repeatable center sprite


      Rectangle{
          width: gameScene.gridSize*width_m
          height: gameScene.gridSize
          //color: "grey"
          Image {
              width: parent.width
              height: parent.height
              //fillMode: Image.Tile
              fillMode: Image.TileHorizontally
              source: "../../assets/ground/grass.png"
          }
      }

      property int row2:row
      SequentialAnimation on x {
                id:loop
                loops: Animation.Infinite
                PropertyAnimation {
                    duration: 2000
                    to: row*gameScene.gridSize }
                PropertyAnimation {
                     duration: 2000
                    to: row2*gameScene.gridSize
                }

            }




  BoxCollider {
    anchors.fill: parent
    bodyType: Body.Static
    /*
    fixture.onContactChanged: {
        if(player.x==player.x)
                player.x=plat.x
    }
*/
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player")
      {
          player.contacts++
           // player.x=player.x+(plat.x-row*gameScene.gridSize)

      }
      }

    fixture.onEndContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") player.contacts--

    }
  }
}
