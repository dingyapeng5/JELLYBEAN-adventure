import Felgo 3.0
import QtQuick 2.0
import "../common"
import "../entities"
import "../levels"

SceneBase {
  id: gameScene
  width: 480
  height: 320
  gridSize: 32

    //结束界面信号
  signal gameOverPressed
  // 加载关卡文件,e filename of the current level gets stored here, it is used for loading the
  property string activeLevelFileName

  property int offsetBeforeScrollingStarts: 240
  //property alias attrsc:attrs.counter

  function setLevel(fileName) {
    activeLevelFileName = fileName
  }

  // the whole screen is filled with an incredibly beautiful blue ...
    Rectangle {
      anchors.fill: gameScene.gameWindowAnchorItem
      color: "#74d6f7"
    }
    //返回按钮
  ImageButton {
      imagesource: "../../assets/button/Back.png"
    // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
    anchors.right: gameScene.gameWindowAnchorItem.right
    anchors.rightMargin: 10
    anchors.top: gameScene.gameWindowAnchorItem.top
    anchors.topMargin: 10
    z:2
    onClicked: {
        player.x = 20     //角色回到起点
        player.y = 100/*
        player.horizontalVelocity=0*/
        backButtonPressed()
      //activeLevel = undefined
      activeLevelFileName = ""
    }
  }

  // ... followed by 2 parallax layers with trees and grass
  ParallaxScrollingBackground {
    sourceImage: "../../assets/background/bg3.png"
    anchors.bottom: gameScene.gameWindowAnchorItem.bottom
    anchors.horizontalCenter: gameScene.gameWindowAnchorItem.horizontalCenter
    // we move the parallax layers at the same speed as the player
    movementVelocity: player.x > offsetBeforeScrollingStarts ? Qt.point(-player.horizontalVelocity,0) : Qt.point(0,0)
    // the speed then gets multiplied by this ratio to create the parallax effect
    ratio: Qt.point(0.3,0)
  }
  ParallaxScrollingBackground {
    sourceImage: "../../assets/background/bg2.png"
    height: 30
    anchors.bottom: gameScene.gameWindowAnchorItem.bottom
    anchors.horizontalCenter: gameScene.gameWindowAnchorItem.horizontalCenter
    movementVelocity: player.x > offsetBeforeScrollingStarts ? Qt.point(-player.horizontalVelocity,0) : Qt.point(0,0)
    ratio: Qt.point(0.6,0)
  }

  // this is the moving item containing the level and player
  Item {
    id: viewPort
    height: gameScene.gridSize * 10
    width: 42 * gameScene.gridSize
    anchors.bottom: gameScene.gameWindowAnchorItem.bottom
    x: player.x > offsetBeforeScrollingStarts ? offsetBeforeScrollingStarts-player.x : 0

    PhysicsWorld {
      id: physicsWorld
      gravity: Qt.point(0, 25)
      debugDrawVisible: false // enable this for physics debugging
      z: 1000

      onPreSolve: {
        //this is called before the Box2DWorld handles contact events
        var entityA = contact.fixtureA.getBody().target
        var entityB = contact.fixtureB.getBody().target
  //contact.enabled = true
        if(entityB.entityType === "platform" && entityA.entityType === "player" &&
            entityA.y + entityA.height > entityB.y) {
          //by setting enabled to false, they can be filtered out completely
          //-> disable cloud platform collisions when the player is below the platform
          contact.enabled = false
        }
        if(entityB.entityType === "ground" && entityA.entityType === "player") {
          //by setting enabled to false, they can be filtered out completely
          //-> disable cloud platform collisions when the player is below the platform
          contact.enabled = true
        }

      }
    }

    //加载关卡内容
    Loader {
      id: loader
      source: activeLevelFileName != "" ? "../levels/" + activeLevelFileName : ""
      onLoaded: {
        // since we did not define a width and height in the level item itself, we are doing it here
        item.width = gameScene.width
        item.height = gameScene.height
      }
    }
    Player {
      id: player
      x: 20
      y: 100
    }

    ResetSensor {
      width: player.width
      height: 10
      x: player.x
      anchors.bottom: viewPort.bottom
      // if the player collides with the reset sensor, he goes back to the start
      onContact: {
          player.x = 20
          player.y = 100
          gameOverPressed()
      }
    }
  }

  Rectangle {
    // you should hide those input controls on desktops, not only because they are really ugly in this demo, but because you can move the player with the arrow keys there
    //visible: !system.desktopPlatform
    //enabled: visible
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    height: 50
    width: 150
    //color: "blue"
    opacity: 0.4

    Rectangle {
      anchors.centerIn: parent
      width: 1
      height: parent.height
      //color: "white"
    }
    MultiPointTouchArea {
      anchors.fill: parent
      onPressed: {
        if(touchPoints[0].x < width/2)
          controller.xAxis = -1
        else
          controller.xAxis = 1
      }
      onUpdated: {
        if(touchPoints[0].x < width/2)
          controller.xAxis = -1
        else
          controller.xAxis = 1
      }
      onReleased: controller.xAxis = 0
    }
  }

  Rectangle {
    // same as the above input control
    //visible: !system.desktopPlatform
    //enabled: visible
    anchors.left: parent.left
    anchors.bottom: parent.bottom
    height: 100
    width: 100
    //color: "green"
    opacity: 0.4

    Text {
      anchors.centerIn: parent
      text: "jump"
      color: "white"
      font.pixelSize: 9
    }
    MouseArea {
      anchors.fill: parent
      onPressed: player.jump()
    }
  }

  // on desktops, you can move the player with the arrow keys, on mobiles we are using our custom inputs above to modify the controller axis values. With this approach, we only need one actual logic for the movement, always referring to the axis values of the controller
  Keys.forwardTo: controller
  TwoAxisController {
    id: controller
    onInputActionPressed: {
      console.debug("key pressed actionName " + actionName)
      if(actionName == "up") {
        player.jump()
      }
    }
  }
}
