import QtQuick 2.5
import "."

// Image
Image {
    id: root
    width: 64
    height: 64
    signal buttonClicked()
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: buttonClicked()
    }
    states: State {
        name: "pressed"
        when: mouseArea.pressed
        PropertyChanges {
            target: root
            scale: .95
        }
    }
}
