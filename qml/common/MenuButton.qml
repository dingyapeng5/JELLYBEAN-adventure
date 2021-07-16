//将整个程序的框定义在一起，使用时调用改值便可
import QtQuick 2.0

Rectangle{
    id: button
    width: buttonText.width + paddingHorizontal*2
    height: buttonText.height + paddingVertical*2

    color: "#e9e9e9"
    radius: 10
    property int paddingHorizontal: 10
    property int paddingVertical: 5
    property alias text: buttonText.text
    property alias lable: lable
    property bool active: false
    //信号
    signal clicked

    Text {
      id: buttonText
      anchors.centerIn: parent
      font.pixelSize: 20
      color: "red"
    }

    Image {
        id: lable

    }
    MouseArea {
      id: mouseArea
      anchors.fill: parent
      hoverEnabled: true
      onClicked: button.clicked()
      //点击按钮文字的效果
      onPressed: button.opacity = 0.5
//                 parent.y += 5
      onReleased: button.opacity = 1
//                  parent.y -= 5
    }
}
