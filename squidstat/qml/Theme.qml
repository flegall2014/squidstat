pragma Singleton
import QtQuick 2.5

Item {
    // Labels
    readonly property string operatingConditionLabel: qsTr("Operating Conditions")
    readonly property string advancedSettingLabel: qsTr("Advanced Settings")
    readonly property string runExperimentLabel: qsTr("Run Experiment")
    readonly property string realTimeValueLabel: qsTr("Real-time values")
    readonly property string currentRangeLabel: qsTr("Current Range")
    readonly property string samplingPeriodLabel: qsTr("Sampling Period")
    readonly property string galvanostatLabel: qsTr("Galvanostat")
    readonly property string potentiostatLabel: qsTr("Potentiostat")
    readonly property string discreteSamplingLabel: qsTr("Discrete sampling")
    readonly property string irCompressionLabel: qsTr("IR compression")
    readonly property string voltageErrorCorrectionLabel: qsTr("Voltage error correction")
    readonly property string notEnabledLabel: qsTr("(not enabled)")
    readonly property string techniqueBuilderLabel: qsTr("Technique Builder")
    readonly property string switchToOpenCircuitLabel: qsTr("Switch to open circuit")
    readonly property string weSetPointLabel: qsTr("W.E. Setpoint")
    readonly property string onLabel: qsTr("ON")
    readonly property string offLabel: qsTr("OFF")
    readonly property string yesLabel: qsTr("YES")
    readonly property string noLabel: qsTr("NO")
    readonly property string clickToStartRunLabel: qsTr("Click to start run")
    readonly property string graphMostRecentDataLabel: qsTr("Graph Most Recent Data")
    readonly property string graphPreviouslySavedCSVFileLabel: qsTr("Graph Previously Saved .cvs File")
    readonly property string workingElectrodeLabel: qsTr("Working electrode (WE)")
    readonly property string counterElectrodeLabel: qsTr("Counter electrode (CE)")
    readonly property string fileSaveLocationLabel: qsTr("File save location")
    readonly property string currentLabel: qsTr("Current")
    readonly property string redoxStateLabel: qsTr("Redox state")
    readonly property string openCircuitLabel: qsTr("Open circuit")
    readonly property string voltageUnit: qsTr("(V)")

    // Colors
    readonly property color mainBackgroundColor: "#333"
    readonly property color mainFontColor: "#777777"
    readonly property color groupBorderColor: "#666666"
    readonly property color groupTitleColor: "#AAAAAA"

    // Font
    readonly property string mainFontFamily: "Comic Sans MS"
    readonly property int groupTitleFontSize: 24
    readonly property int widgetFontSize: 16

    // Sizes
    readonly property int standardWidgetWidth: 100
    readonly property int standardWidgetHeight: 32
    readonly property int standardTextFieldWidth: 304
    readonly property int standardFilePickerWidth: 650
    readonly property int standardToggleButtonWidth: 304

    // Model
    property variant samplingPeriodModel: [
        "autorange", "100mA - 1A",
        "10mA - 100mA", "1mA - 10mA",
        "100µA - 1mA", "10uA - 100µA",
        "1µA - 10µA", "100nA - 1µA",
        "10nA - 100nA"]

    // Model
    property variant samplingPeriodUnitModel: ["µSeconds", "mSeconds", "Seconds", "Minutes"]

    // Model:
    property variant voltageUnitModel: ["mV", "V"]

    // Model
    property variant intensityUnitModel: ["µA", "mA", "A"]
}
