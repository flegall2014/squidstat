import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."

Item {
    id: root
    property string title
    property int margin: 8
    property alias text: textField.text
    property alias validator: textField.validator
    property double minimum: -100
    property double maximum: 100
    width: Theme.standardTextFieldWidth
    height: Theme.standardWidgetHeight

    // Label
    StandardLabel {
        id: label
        text: root.title
        visible: root.title.length > 0
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }

    // Text field
    TextField {
        id: textField
        width: Theme.standardWidgetWidth
        height: Theme.standardWidgetHeight
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        font.family: Theme.mainFontFamily
        font.pixelSize: Theme.widgetFontSize
        horizontalAlignment: Text.AlignHCenter
        onTextChanged: {
            var value = parseFloat(text)
            if (!isNaN(value)) {
                if (value < root.minimum)
                    value = root.minimum
                if (value > root.maximum)
                    value = root.maximum
                text = value
                root.textChanged(value)
            }
        }
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
        validator: DoubleValidator {
            bottom: root.minimum
            top: root.maximum
        }
    }
}
