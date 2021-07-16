import Felgo 3.0
import QtQuick 2.0
import "../common"
import "../entities"

SceneBase {
    id: overSence

    Rectangle {
      anchors.fill: parent.gameWindowAnchorItem
      color: "#ece468"
    }

    Text {
        id: overText
        text: qsTr("Game Over!")
        anchors.centerIn: parent
    }

    MenuButton{
        text: "Back"
        anchors.rightMargin: 10
        anchors.topMargin: 10
        x:210
        y:200
        onClicked: {
            backButtonPressed()

        }
    }
}
