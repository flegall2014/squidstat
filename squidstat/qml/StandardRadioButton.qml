import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."

RadioButton {
    style: RadioButtonStyle {
        label: Label {
            font.family: Theme.mainFontFamily
            font.pixelSize: Theme.widgetFontSize
            color: Theme.mainFontColor
            text: control.text
        }
    }
}
