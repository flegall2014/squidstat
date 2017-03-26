import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."

Item {
    id: root
    width: Theme.standardIntensityWidgetWidth
    height: Theme.standardWidgetHeight
    property int margin: 8
    property alias title: textField.title
    property alias unitsModel: unitsCombo.model
    property alias text: textField.text
    property alias validator: textField.validator
    property alias unit: unitsCombo.currentText

    // Text field
    StandardTextField {
        id: textField
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }

    // Units
    ComboBox {
        id: unitsCombo
        visible: false
        width: Theme.standardWidgetWidth
        height: Theme.standardWidgetHeight
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        style: ComboBoxStyle {
            label: Text {
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: Theme.mainFontFamily
                color: Theme.mainFontColor
                text: control.currentText
            }
        }
    }
}
