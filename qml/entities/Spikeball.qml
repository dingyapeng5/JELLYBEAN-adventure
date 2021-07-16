import Felgo 3.0
import QtQuick 2.0

EntityBase {
    id:spikeball
  entityType: "spikeball"

  signal contact


  onContact: {//复活点
    player.x = 20
    player.y = 100
    gameOverPressed()
  }

  MultiResolutionImage {//人物图片
    source: "../../assets/monster/spikeball.png"
  }

  BoxCollider {
    anchors.fill: parent
    collisionTestingOnlyMode: true
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      // if the player hits the sensor, we emit a signal which will be used to reset the player
      if(otherEntity.entityType === "player") {
        // we could also directly modify the player position here, but the signal approach is a bit cleaner and helps separating the components
         spikeball.contact();
      }
    }
  }

}
