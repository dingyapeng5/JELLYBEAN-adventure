import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.12
import "../common"
import "../entities"

SceneBase {
  id: menuScene

  // 选关界面信号
  signal selectLevelPressed
  // 另一个模式
  signal settingPressed

  // background
  Rectangle {
    anchors.fill: parent.gameWindowAnchorItem
  }
    //背景音乐
  BackgroundMusic{
              id:palyMusic
              source: "../../assets/sounds/music.mp3"
              autoPlay: true
            }
    //主界面的布局
  Image {
      id: mainBackGrund
      source: "../../assets/background/bg1.png"
      anchors.horizontalCenter: parent.horizontalCenter
      width: 500
      height: 320
      Image {
        source: "../../assets/background/log1.png"
        width: 100
        height: 100
        x:385
        y:10
      }
      Image {
          source: "../../assets/background/log2.png"
          width: 100
          height: 50
          x:10
          y:10
      }
      Image {
          source: "../../assets/background/rainbow.png"
          anchors.centerIn: parent
          width: 460
          height: 260
      }
      Image {
          source: "../../assets/background/tree1.png"
          x:70
          y:200
      }
      Image {
          source: "../../assets/player/1.png"
          x:150
          y:267
      }
      Image {
          source: "../../assets/background/tree2.png"
          x:250
          y:200
      }
      Image {
          source: "../../assets/background/tree3.png"
          x:300
          y:200
      }
      //背景音乐开关控制
      MenuButton{
          id:musicSwitch
          width: 24
          height: 23
          x:150
          y:150
          lable.source: active ? "../../assets/setup/music1.png" : "../../assets/setup/music2.png"
          active: ! settings.musicEnabled
          onClicked: settings.musicEnabled ^= true
      }
      Image {

          source: "../../assets/ground/mid.png"
          height: 32
          width: 1000
          x:0
          y:289
      }
  }
  // menu
  Column {
    anchors.centerIn: parent
    spacing: 10
    ImageButton {
        imagesource: "../../assets/button/play.png"
        height: 30
        width: 100
        onClicked: selectLevelPressed()
    }
    ImageButton {
        imagesource: "../../assets/button/playMore.png"
        height: 30
        width: 100
        onClicked: settingPressed()
    }
  }
}
