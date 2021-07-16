import Felgo 3.0
import QtQuick 2.0
import "../common"
import "../entities"

SceneBase {
    id:settingScene

    Rectangle{
        anchors.fill: parent.gameWindowAnchorItem
        color: "blue"
    }

    ImageButton{
        imagesource: "../../assets/setup/about.png"
        anchors.centerIn: parent

    }
    MenuButton{
        text:"Back"
        x:190
        y:200
        onClicked: backButtonPressed()
    }
}
