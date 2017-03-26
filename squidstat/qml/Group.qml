import QtQuick 2.5
import QtQuick.Controls 1.4
import "."

Rectangle {
    id: root
    property int margin: 8
    anchors.fill: parent
    anchors.margins: margin
    color: "transparent"
    border.color: Theme.groupBorderColor
    border.width: 3
    property alias groupTitle: groupTitle.text
    property alias contents: contents.children

    // Group title
    GroupLabel {
        id: groupTitle
        text: Theme.runExperimentLabel
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
    }

    // Contents
    Rectangle {
        id: contents
        color: "transparent"
        border.color: Theme.groupBorderColor
        anchors.left: parent.left
        anchors.leftMargin: root.margin
        anchors.right: parent.right
        anchors.rightMargin: root.margin
        height: (4.5/6)*root.height
        anchors.verticalCenter: parent.verticalCenter
    }

    // Information
    Button {
        anchors.right: parent.right
        anchors.rightMargin: root.margin
        anchors.bottom: parent.bottom
        anchors.bottomMargin: root.margin
        width: 32
        height: 32
        tooltip: qsTr("Display information about this group")
        Image {
            anchors.fill: parent
            source: "qrc:/assets/ico-information.png"
        }
    }
}
