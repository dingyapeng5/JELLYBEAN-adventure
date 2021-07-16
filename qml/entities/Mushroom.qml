import Felgo 3.0
import QtQuick 2.0

EntityBase {
    id:mush
  entityType: "monster"

  signal contact

  MultiResolutionImage {//人物图片
    source: "../../assets/monster/mushroom.png"
  }
  onContact: {//复活点
    player.x = 20
    player.y = 100
    gameOverPressed()
  }
  property int x2: x
  SequentialAnimation on x {
            id:loop
            loops: Animation.Infinite
            PropertyAnimation {
                duration: 2000
                to: x }
            PropertyAnimation {
                 duration: 2000
                to: x2 }

        }

  BoxCollider {
    anchors.fill: parent
    collisionTestingOnlyMode: true
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      // if the player hits the sensor, we emit a signal which will be used to reset the player
      if(otherEntity.entityType === "player") {
        // we could also directly modify the player position here, but the signal approach is a bit cleaner and helps separating the components
          if( otherEntity.y <=(mush.y-gameScene.gridSize*0.5))
          //if((otherEntity.y+gameScene.gridSize*1.5)<=mon.y )
          { mush.x=-1;
            mush.y=-1;
            loop.stop()
              mush.visible=false;
           }else mush.contact();
      }
    }
  }

}
