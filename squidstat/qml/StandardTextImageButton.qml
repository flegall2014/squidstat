import QtQuick 2.5
import "."

Item {
    id: root
    property string title
    property string source
    property int margin: 16
    property int iconWidth: 64
    property int iconHeight: 64
    implicitWidth: iconWidth + label.implicitWidth + root.margin
    implicitHeight: iconHeight
    signal buttonClicked()

    // Label
    Text {
        id: label
        font.family: Theme.mainFontFamily
        font.pixelSize: Theme.widgetFontSize
        color: Theme.mainFontColor
        textFormat: Text.RichText
        height: Theme.standardWidgetHeight
        text: root.title
        anchors.verticalCenter: parent.verticalCenter
    }

    // Image
    Image {
        id: image
        width: root.iconWidth
        height: root.iconHeight
        source: root.source
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: buttonClicked()
        }
        states: State {
            name: "pressed"
            when: mouseArea.pressed
            PropertyChanges {
                target: image
                scale: .95
            }
        }
    }
}
