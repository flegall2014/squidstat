import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."

Item {
    id: root
    width: 412
    implicitHeight: Math.max(label.implicitHeight, spinBox.implicitHeight, unitsCombo.implicitHeight)
    property int margin: 8
    property alias title: label.text
    property alias minimumValue: spinBox.minimumValue
    property alias maximumValue: spinBox.maximumValue
    property alias unitsModel: unitsCombo.model
    property alias value: spinBox.value

    // Label
    StandardLabel {
        id: label
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }

    // Spinbox:
    SpinBox {
        id: spinBox
        width: Theme.standardWidgetWidth
        height: Theme.standardWidgetHeight
        anchors.right: unitsCombo.left
        anchors.rightMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        font.family: Theme.mainFontFamily
        font.pixelSize: Theme.widgetFontSize
        horizontalAlignment: Text.AlignHCenter
        style: SpinBoxStyle {
            textColor: Theme.mainFontColor
            background: Rectangle {
                implicitWidth: Theme.standardWidgetWidth
                implicitHeight: Theme.standardWidgetHeight
                border.color: "gray"
            }
        }
    }

    // Units:
    StandardComboBox {
        id: unitsCombo
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
    }
}
