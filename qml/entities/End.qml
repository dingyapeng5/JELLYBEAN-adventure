import Felgo 3.0
import QtQuick 2.0

EntityBase {
  id: end
  entityType: "end"

  signal contact

  Text {
    anchors.centerIn: parent
    text: "END"
    color: "white"
    font.pixelSize: 90
  }

  onContact: {//到达终点的操作
    player.x = 20
    player.y = 100
    gameOverPressed()
  }
  BoxCollider {
    anchors.fill: parent
    collisionTestingOnlyMode: true
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      // if the player hits the sensor, we emit a signal which will be used to reset the player
      if(otherEntity.entityType === "player") {
        // we could also directly modify the player position here, but the signal approach is a bit cleaner and helps separating the components
        end.contact()
      }
    }
  }

}
