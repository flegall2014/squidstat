// Qt
#include <QDebug>
#include <qqml.h>

// Application
#include "cockpitcontroller.h"

// Constructor
CockpitController::CockpitController(QObject *parent) : QObject(parent),
    // Avanced settings
    m_bDiscreteSampling(true),
    m_bIRCompression(false),
    m_bVoltageErrorCorrection(true),

    // Run experiment
    m_bTechniqueBuilderState(false),
    m_bSwitchToOpenCircuitState(true),
    m_dSamplingPeriod(10),
    m_iSamplingPeriodUnit(SamplingPeriodUnit::SEC),
    m_dWESetPoint(10),
    m_iWESetPointUnit(WESetPointUnit::VOLT),

    // Operating conditions
    m_iOperatingConditionType(OperatingConditionType::POTENTIOSTAT),
    m_iOperatingConditionRange(OperatingConditionRange::RANGE1),

    //
    // Real-time values
    //

    // Working electrode value
    m_dWorkingElectrodeValue(-1.345),

    // Counter electrode value
    m_dCounterElectrodeValue(-2.255),

    // Current value:
    m_dCurrentValue(1),

    // Current value unit:
    m_iCurrentValueUnit(CurrentValueUnit::MILLI_AMPERE)
{
    qDebug() << "BUILD COCKPIT CONTROLLER";

    // Register
    qmlRegisterType<CockpitController>("Components", 1, 0, "CockpitController");
}

// Destructor
CockpitController::~CockpitController()
{
    qDebug() << "DESTROY COCKPIT CONTROLLER";
}

// Startup
bool CockpitController::startup()
{
    qDebug() << "STARTUP COCKPIT CONTROLLER";
    return true;
}

// Shutdown:
void CockpitController::shutdown()
{
    qDebug() << "SHUTDOWN COCKPIT CONTROLLER";
}

// Return discrete sampling
bool CockpitController::discreteSampling() const
{
    return m_bDiscreteSampling;
}

// Set discrete sampling
void CockpitController::setDiscreteSampling(bool bDiscreteSampling)
{
    m_bDiscreteSampling = bDiscreteSampling;
    emit discreteSamplingChanged();
}

// Return IR compression
bool CockpitController::irCompression() const
{
    return m_bIRCompression;
}

// Set IR compression
void CockpitController::setIRCompression(bool bIRCompression)
{
    m_bIRCompression = bIRCompression;
    emit irCompressionChanged();
}

// Return voltage error correction
bool CockpitController::voltageErrorCorrection() const
{
    return m_bVoltageErrorCorrection;
}

// Set voltage error correction
void CockpitController::setVoltageErrorCorrection(bool bVoltageErrorCorrection)
{
    m_bVoltageErrorCorrection = bVoltageErrorCorrection;
    emit voltageErrorCorrectionChanged();
}

// Return technique builder state
bool CockpitController::techniqueBuilderState() const
{
    return m_bTechniqueBuilderState;
}

// Set technique builder state
void CockpitController::setTechniqueBuilderState(bool bTechniqueBuilderState)
{
    m_bTechniqueBuilderState = bTechniqueBuilderState;
    emit techniqueBuilderStateChanged();
}

// Return switch to open circuit state
bool CockpitController::switchToOpenCircuitState() const
{
    return m_bSwitchToOpenCircuitState;
}

// Set switch to open circuit state
void CockpitController::setSwitchToOpenCircuitState(bool bSwitchToOpenCircuitState)
{
    m_bSwitchToOpenCircuitState = bSwitchToOpenCircuitState;
    emit switchToOpenCircuitStateChanged();
}

// Return sampling period
double CockpitController::samplingPeriod() const
{
    return m_dSamplingPeriod;
}

// Set sampling period
void CockpitController::setSamplingPeriod(double dSamplingPeriod)
{
    m_dSamplingPeriod = dSamplingPeriod;
    emit samplingPeriodChanged();
}

// Return sampling period unit:
int CockpitController::samplingPeriodUnit() const
{
    return m_iSamplingPeriodUnit;
}

// Set sampling period unit:
void CockpitController::setSamplingPeriodUnit(int iSamplingPeriodUnit)
{
    m_iSamplingPeriodUnit = iSamplingPeriodUnit;
    emit samplingPeriodUnitChanged();
}

// Return WE set point:
double CockpitController::weSetPoint() const
{
    return m_dWESetPoint;
}

// Set WE set point:
void CockpitController::setWESetPoint(double dWESetPoint)
{
    m_dWESetPoint = dWESetPoint;
    emit weSetPointChanged();
}

// Return WE set point unit:
int CockpitController::weSetPointUnit() const
{
    return m_iWESetPointUnit;
}

// Set WE set point unit:
void CockpitController::setWESetPointUnit(int iWESetPointUnit)
{
    m_iWESetPointUnit = iWESetPointUnit;
    emit weSetPointUnitChanged();
}

// Return operating condition type
int CockpitController::operatingConditionType() const
{
    return m_iOperatingConditionType;
}

// Set operating condition type
void CockpitController::setOperatingConditionType(int iOperatingConditionType)
{
    m_iOperatingConditionType = iOperatingConditionType;
    emit operatingConditionTypeChanged();
}

// Return operating condition range
int CockpitController::operatingConditionRange() const
{
    return m_iOperatingConditionRange;
}

// Set operating condition range
void CockpitController::setOperatingConditionRange(int iOperatingConditionRange)
{
    m_iOperatingConditionRange = iOperatingConditionRange;
}

// Return current value
double CockpitController::currentValue() const
{
    return m_dCurrentValue;
}

// Set current value
void CockpitController::setCurrentValue(double dCurrentValue)
{
    m_dCurrentValue = dCurrentValue;
    emit currentValueChanged();
}

// Return current value unit
int CockpitController::currentValueUnit() const
{
    return m_iCurrentValueUnit;
}

// Set current value unit
void CockpitController::setCurrentValueUnit(int iCurrentValueUnit)
{
    m_iCurrentValueUnit = iCurrentValueUnit;
    emit currentValueUnitChanged();
}

// Return working electrode value
double CockpitController::workingElectrodeValue() const
{
    return m_dWorkingElectrodeValue;
}

// Set working electrode value
void CockpitController::setWorkingElectrodeValue(double dWorkingElectrodeValue)
{
    m_dWorkingElectrodeValue = dWorkingElectrodeValue;
    emit workingElectrodeValueChanged();
}

// Return counter electrode value
double CockpitController::counterElectrodeValue() const
{
    return m_dCounterElectrodeValue;
}

// Set working electrode value
void CockpitController::setCounterElectrodeValue(double dCounterElectrodeValue)
{
    m_dCounterElectrodeValue = dCounterElectrodeValue;
    emit counterElectrodeValueChanged();
}

