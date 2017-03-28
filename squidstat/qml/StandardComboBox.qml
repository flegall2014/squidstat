import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."

// Units:
ComboBox {
    id: unitsCombo
    width: Theme.standardWidgetWidth
    height: Theme.standardWidgetHeight
    style: ComboBoxStyle {
        label: Text {
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: Theme.mainFontFamily
            color: Theme.mainFontColor
            text: control.currentText
            font.pixelSize: Theme.comboFontSize
        }
    }
}
