import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import "."

Item {
    id: root
    width: Theme.standardFilePickerWidth
    height: Theme.standardWidgetHeight
    property alias title: label.text
    property int margin: 8

    // Label
    StandardLabel {
        id: label
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }

    // Text field
    TextField {
        id: textField
        height: Theme.standardWidgetHeight
        anchors.right: openButton.left
        anchors.rightMargin: root.margin
        anchors.left: label.right
        anchors.leftMargin: 103
        anchors.verticalCenter: parent.verticalCenter
        font.family: Theme.mainFontFamily
        font.pixelSize: Theme.widgetFontSize
        horizontalAlignment: Text.AlignHCenter
        onTextChanged: root.textChanged(text)
        style: TextFieldStyle {
            textColor: Theme.mainFontColor
            font.family: Theme.mainFontFamily
            background: Rectangle {
                radius: 2
                implicitWidth: 100
                implicitHeight: 24
                border.color: "#333"
                border.width: 1
            }
        }
    }

    // Open button
    StandardImageButton {
        id: openButton
        anchors.right: parent.right
        anchors.verticalCenter: filePicker.verticalCenter
        source: "qrc:/assets/ico-open.png"
        width: 32
        height: 32
        onButtonClicked: filePickerDialog.open()
    }
}
