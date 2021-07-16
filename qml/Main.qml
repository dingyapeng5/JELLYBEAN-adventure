import Felgo 3.0
import QtQuick 2.0
import "scenes"
import "levels"

GameWindow {
  id: window
  screenWidth: 960
  screenHeight: 640

  EntityManager {
    id: entityManager
  }

  // menu scene
  MenuScene {
    id: menuScene
    onSelectLevelPressed: window.state = "selectLevel"
    onSettingPressed: window.state = "setting"
    Connections {
      target: nativeUtils
      onMessageBoxFinished: {

        if(accepted && window.activeScene === menuScene)
          Qt.quit()
      }
    }
  }

  // scene for selecting levels
  SelectLevelScene {
    id: selectLevelScene
    onLevelPressed:{
        window.state = "game"
        gameScene.setLevel(selectedLevel)
}
    onBackButtonPressed: window.state = "menu"
}

  GameScene {
    id: gameScene
    onBackButtonPressed: window.state = "selectLevel"
    onGameOverPressed: window.state = "gameOver"
  }

  OverScene{
    id:overScene
    onBackButtonPressed: window.state = "menu"
  }

  SettingScene{
    id:settingScene
    onBackButtonPressed: window.state = "menu"
  }
  // menu是主界面，这里设置其为最初的界面
  state: "menu"
  activeScene: menuScene

  states: [
    State {
      name: "menu"
      PropertyChanges {target: menuScene; opacity: 1}
      PropertyChanges {target: window; activeScene: menuScene}
    },
    State {
      name: "selectLevel"
      PropertyChanges {target: selectLevelScene; opacity: 1}
      PropertyChanges {target: window; activeScene: selectLevelScene}
    },
    State {
      name: "game"
      PropertyChanges {target: gameScene; opacity: 1}
      PropertyChanges {target: window; activeScene: gameScene}
    },
    State {
      name: "gameOver"
      PropertyChanges { target: overScene; opacity: 1}
      PropertyChanges {target: window; activeScene:overScene}
    },
    State {
      name: "setting"
      PropertyChanges {target: settingScene; opacity: 1}
      PropertyChanges {target: window; activeScene: settingScene}
      }
  ]
}
