import QtQuick 2.5
import "."

Item {
    id: root
    width: Theme.standardToggleButtonWidth
    height: Theme.standardWidgetHeight
    property int margin: 8
    property alias title: label.text
    property string onText: "ON"
    property string offText: "OFF"
    property bool active: false
    signal toggled()

    // Label
    StandardLabel {
        id: label
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }

    // Toggle:
    Rectangle {
        id: toggle
        width: Theme.standardWidgetWidth
        height: Theme.standardWidgetHeight
        anchors.right: parent.right
        anchors.leftMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        color: active ? "white" : "black"
        border.color: active ? "black" : "white"
        border.width: 1
        StandardLabel {
            id: text;
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: active ? onText : offText
            color: active ? "black" : "white"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: { active = !active; root.toggled() }
        }
        Behavior on color {
            ColorAnimation {
                duration: 200
            }
        }
    }
}
