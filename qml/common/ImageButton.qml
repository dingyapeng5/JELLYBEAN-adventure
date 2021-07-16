import QtQuick 2.0

Image {
    property alias imagesource: imageButton.source
    signal clicked

    id: imageButton
    height: 30
    width: 100
    MouseArea {
      id: mouseArea
      anchors.fill: parent
      hoverEnabled: true
      onClicked: imageButton.clicked()

      onPressed: /*button.opacity = 0.5*/
                 parent.y += 5
      onReleased: /*button.opacity = 1*/
                  parent.y -= 5
    }
}
