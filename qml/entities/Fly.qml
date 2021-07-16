import Felgo 3.0
import QtQuick 2.0

EntityBase {
    id:fly
  entityType: "monster"

  signal contact

  MultiResolutionImage {//人物图片
    source: "../../assets/monster/fly.png"
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
          if( otherEntity.y <=(fly.y-gameScene.gridSize*1))
          //if((otherEntity.y+gameScene.gridSize*1.5)<=mon.y )
          { fly.x=-1;
            fly.y=-1;
            fly.visible=false;
            loop.stop()
           }else fly.contact();
      }
    }
  }

}
