import QtQuick 2.5

Rectangle {
    id: root
    color: "transparent"
    property alias model: view.model
    property alias delegate: view.delegate
    property alias currentIndex: view.currentIndex
    property real itemHeight: 30

    PathView {
        id: view
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        width: parent.width
        clip: true
        pathItemCount: height/itemHeight
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlight: Rectangle { x: 8; width: view.width-16; height: itemHeight+4; color: "orange" }
        dragMargin: view.width/2

        path: Path {
            startX: view.width/2; startY: -itemHeight/2
            PathLine { x: view.width/2; y: view.pathItemCount*itemHeight + itemHeight }
        }
    }

    Keys.onDownPressed: view.incrementCurrentIndex()
    Keys.onUpPressed: view.decrementCurrentIndex()
}
