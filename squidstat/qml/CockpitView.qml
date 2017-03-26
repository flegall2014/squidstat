import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import Components 1.0
import "."

Rectangle {
    id: root
    color: Theme.mainBackgroundColor
    property int margin: 8

    // Top left area
    Item {
        id: topLeftArea
        width: parent.width/4
        height: parent.height/2
        anchors.top: parent.top
        anchors.left: parent.left

        Group {
            groupTitle: Theme.operatingConditionLabel

            contents: Item {
                anchors.fill: parent

                // Radio button exclusive group
                ExclusiveGroup {
                    id: exclusive
                }

                Component.onCompleted: console.log("ICI : ", controller.operatingConditionType, CockpitController.POTENTIOSTAT)

                // Potentiostat radio
                Item {
                    width: parent.width
                    height: parent.height/2
                    anchors.top: parent.top
                    anchors.left: parent.left
                    StandardRadioButton {
                        anchors.left: parent.left
                        anchors.leftMargin: root.margin
                        anchors.verticalCenter: parent.verticalCenter
                        text: Theme.potentiostatLabel
                        exclusiveGroup: exclusive
                        checked: controller.operatingConditionType === CockpitController.POTENTIOSTAT
                    }
                }

                // Galvanostat radio
                Item {
                    width: parent.width
                    height: parent.height/2
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    StandardRadioButton {
                        anchors.left: parent.left
                        anchors.leftMargin: root.margin
                        anchors.verticalCenter: parent.verticalCenter
                        text: Theme.galvanostatLabel
                        exclusiveGroup: exclusive
                    }
                }

                Item {
                    id: titleArea
                    width: 128
                    height: 24
                    anchors.bottom: tumbler.top
                    anchors.bottomMargin: root.margin
                    anchors.right: parent.right
                    anchors.rightMargin: root.margin
                    StandardLabel {
                        id: title
                        anchors.centerIn: parent
                        text: Theme.currentRangeLabel
                    }
                }

                // Sampling period tumbler
                Tumbler {
                    id: tumbler
                    width: 128
                    height: 128
                    anchors.right: parent.right
                    anchors.rightMargin: 16
                    anchors.verticalCenter: parent.verticalCenter
                    TumblerColumn {
                        width: tumbler.width
                        model: Theme.samplingPeriodModel
                    }
                    Component.onCompleted: {
                        tumbler.setCurrentIndexAt(0, controller.operatingConditionRange)
                    }
                }
            }
        }
    }

    // Bottom left area:
    Item {
        id: bottomLeftArea
        width: parent.width/4
        height: parent.height/2
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        Group {
            groupTitle: Theme.advancedSettingLabel

            contents: Item {
                anchors.fill: parent

                // Discrete sampling toggle
                StandardToggleButton {
                    id: topButton
                    title: Theme.discreteSamplingLabel
                    onText: Theme.onLabel
                    offText: Theme.offLabel
                    anchors.bottom: centralButton.top
                    anchors.bottomMargin: 16
                    anchors.horizontalCenter: centralButton.horizontalCenter
                    active: controller.discreteSampling
                    onToggled: controller.discreteSampling = !controller.discreteSampling
                }

                // IR compression toggle
                StandardToggleButton {
                    id: centralButton
                    title: Theme.irCompressionLabel
                    onText: Theme.onLabel
                    offText: Theme.offLabel
                    anchors.centerIn: parent
                    active: controller.irCompression
                    onToggled: controller.irCompression = !controller.irCompression
                }

                // Voltage error correction toggle
                StandardToggleButton {
                    id: bottomButton
                    title: Theme.voltageErrorCorrectionLabel
                    onText: Theme.onLabel
                    offText: Theme.offLabel
                    anchors.top: centralButton.bottom
                    anchors.topMargin: 16
                    anchors.horizontalCenter: centralButton.horizontalCenter
                    active: controller.voltageErrorCorrection
                    onToggled: controller.voltageErrorCorrection = !controller.voltageErrorCorrection
                }
            }
        }
    }

    // Bottom right area:
    Item {
        id: bottomRightArea
        width: parent.width*3/4
        height: parent.height/2
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        Group {
            groupTitle: Theme.runExperimentLabel

            contents: Item {
                anchors.fill: parent

                // Graph button
                StandardTextImageButton {
                    id: graphMostRecentDataButton
                    source: "qrc:/assets/ico-graph.png"
                    iconWidth: 64
                    iconHeight: 64
                    anchors.top: parent.top
                    anchors.topMargin: root.margin
                    anchors.right: parent.right
                    anchors.rightMargin: root.margin
                    title: Theme.graphMostRecentDataLabel
                }

                // Graph button
                StandardTextImageButton {
                    id: graphPreviouslySavedCSVFile
                    source: "qrc:/assets/ico-graph.png"
                    iconWidth: 64
                    iconHeight: 64
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: root.margin
                    title: Theme.graphPreviouslySavedCSVFileLabel
                }

                // Run button
                StandardTextImageButton {
                    id: runButton
                    source: "qrc:/assets/ico-run.png"
                    iconWidth: 64
                    iconHeight: 64
                    anchors.right: parent.right
                    anchors.rightMargin: root.margin
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: root.margin
                    title: Theme.clickToStartRunLabel
                }

                // Technique builder toggle
                StandardToggleButton {
                    id: techniqueBuilderToggle
                    anchors.left: parent.left
                    anchors.leftMargin: root.margin
                    anchors.bottom: switchToOpenCircuitToggle.top
                    anchors.bottomMargin: root.margin
                    onText: Theme.onLabel
                    offText: Theme.offLabel
                    title: Theme.techniqueBuilderLabel
                    active: controller.techniqueBuilderState
                    onToggled: controller.techniqueBuilderState = !controller.techniqueBuilderState
                }

                // Switch to open circuit toggle
                StandardToggleButton {
                    id: switchToOpenCircuitToggle
                    anchors.left: parent.left
                    anchors.leftMargin: root.margin
                    anchors.bottom: samplingPeriodSpinBox.top
                    anchors.bottomMargin: root.margin
                    onText: Theme.yesLabel
                    offText: Theme.noLabel
                    title: Theme.switchToOpenCircuitLabel
                    active: controller.switchToOpenCircuitState
                    onToggled: controller.switchToOpenCircuitState = !controller.switchToOpenCircuitState
                }

                // Sampling period spinbox
                StandardSpinBox {
                    id: samplingPeriodSpinBox
                    title: Theme.samplingPeriodLabel
                    unitsModel: Theme.samplingPeriodUnitModel
                    anchors.left: parent.left
                    anchors.leftMargin: root.margin
                    anchors.verticalCenter: parent.verticalCenter
                    value: controller.samplingPeriod
                    onValueChanged: controller.samplingPeriod = value
                }

                // WE SetPoint spinbox
                StandardSpinBox {
                    id: weSetPointSpinBox
                    title: Theme.weSetPointLabel
                    unitsModel: Theme.voltageUnitModel
                    anchors.left: parent.left
                    anchors.leftMargin: root.margin
                    anchors.top: samplingPeriodSpinBox.bottom
                    anchors.topMargin: root.margin
                }

                // File picker
                StandardFilePicker {
                    id: filePicker
                    anchors.left: parent.left
                    anchors.leftMargin: root.margin
                    anchors.top: weSetPointSpinBox.bottom
                    anchors.topMargin: root.margin
                    title: Theme.fileSaveLocationLabel
                }
            }
        }
    }

    // Top right area:
    Item {
        id: topRightArea
        width: parent.width*3/4
        height: parent.height/2
        anchors.top: parent.top
        anchors.right: parent.right

        Group {
            groupTitle: Theme.realTimeValueLabel + ": Channel 1"
            contents: Item {
                anchors.fill: parent

                // Working electrode field
                StandardTextField {
                    id: workingElectrodeField
                    anchors.left: parent.left
                    anchors.leftMargin: root.margin
                    anchors.bottom: counterElectrodeField.top
                    anchors.bottomMargin: root.margin
                    title: "<b>E</b><sub>" + Theme.workingElectrodeLabel + "</sub>"
                    text: controller.workingElectrodeValue
                    onTextChanged: eWEeCEField.updateValue()
                }

                // Unit
                StandardLabel {
                    anchors.left: workingElectrodeField.right
                    anchors.leftMargin: root.margin
                    anchors.verticalCenter: workingElectrodeField.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    text: Theme.voltageUnit
                }

                // Counter electrode field
                StandardTextField {
                    id: counterElectrodeField
                    anchors.left: parent.left
                    anchors.leftMargin: root.margin
                    anchors.bottom: eWEeCEField.top
                    anchors.bottomMargin: root.margin
                    title: "<b>E</b><sub>" + Theme.counterElectrodeLabel + "</sub>"
                    text: controller.counterElectrodeValue
                    onTextChanged: eWEeCEField.updateValue()
                }

                // Unit
                StandardLabel {
                    anchors.left: counterElectrodeField.right
                    anchors.leftMargin: root.margin
                    anchors.verticalCenter: counterElectrodeField.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    text: Theme.voltageUnit
                }

                // EWE-ECE widget
                StandardTextField {
                    id: eWEeCEField
                    anchors.left: parent.left
                    anchors.leftMargin: root.margin
                    anchors.verticalCenter: parent.verticalCenter
                    title: "<b>E</b><sub>WE</sub> - <b>E</b><sub>CE</sub>"
                    function updateValue() {
                        text = Math.round((parseFloat(workingElectrodeField.text) - parseFloat(counterElectrodeField.text))*1000)/1000
                    }
                    Component.onCompleted: updateValue()
                }

                // Unit
                StandardLabel {
                    anchors.left: eWEeCEField.right
                    anchors.leftMargin: root.margin
                    anchors.verticalCenter: eWEeCEField.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    text: Theme.voltageUnit
                }

                // Current
                StandardTextField {
                    id: currentField
                    anchors.left: parent.left
                    anchors.leftMargin: root.margin
                    anchors.top: eWEeCEField.bottom
                    anchors.topMargin: root.margin
                    title: Theme.currentLabel
                    text: controller.currentValue
                    onTextChanged: controller.currentValue = parseFloat(text)
                }

                // Intensity unit
                StandardComboBox {
                    anchors.left: currentField.right
                    anchors.leftMargin: root.margin
                    anchors.verticalCenter: currentField.verticalCenter
                    model: Theme.intensityUnitModel
                    currentIndex: controller.currentValueUnit
                    onCurrentIndexChanged: controller.currentValueUnit = currentIndex
                }

                // Redox state
                StandardLabel {
                    id: redoxStateLabel
                    anchors.left: parent.left
                    anchors.leftMargin: root.margin
                    anchors.top: currentField.bottom
                    anchors.topMargin: 2*root.margin
                    text: Theme.redoxStateLabel
                }

                // Open circuit button
                StandardButton {
                    text: Theme.openCircuitLabel
                    anchors.left: redoxStateLabel.right
                    anchors.leftMargin: 104
                    anchors.verticalCenter: redoxStateLabel.verticalCenter
                }
            }
        }
    }
}
