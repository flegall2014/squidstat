#ifndef COCKPITCONTROLLER_H
#define COCKPITCONTROLLER_H

// Qt
#include <QObject>

// Application
#include "iservice.h"
#include "defs.h"

class CockpitController : public QObject, public IService
{
    Q_OBJECT

    // Advanced settings
    Q_PROPERTY(bool discreteSampling READ discreteSampling WRITE setDiscreteSampling NOTIFY discreteSamplingChanged)
    Q_PROPERTY(bool irCompression READ irCompression WRITE setIRCompression NOTIFY irCompressionChanged)
    Q_PROPERTY(bool voltageErrorCorrection READ voltageErrorCorrection WRITE setVoltageErrorCorrection NOTIFY voltageErrorCorrectionChanged)

    // Run experiment
    Q_PROPERTY(bool techniqueBuilderState READ techniqueBuilderState WRITE setTechniqueBuilderState NOTIFY techniqueBuilderStateChanged)
    Q_PROPERTY(bool switchToOpenCircuitState READ switchToOpenCircuitState WRITE setSwitchToOpenCircuitState NOTIFY switchToOpenCircuitStateChanged)
    Q_PROPERTY(double samplingPeriod READ samplingPeriod WRITE setSamplingPeriod NOTIFY samplingPeriodChanged)
    Q_PROPERTY(int samplingPeriodUnit READ samplingPeriodUnit WRITE setSamplingPeriodUnit NOTIFY samplingPeriodUnitChanged)

    // Operating conditions
    Q_PROPERTY(int operatingConditionType READ operatingConditionType WRITE setOperatingConditionType NOTIFY operatingConditionTypeChanged)
    Q_PROPERTY(int operatingConditionRange READ operatingConditionRange WRITE setOperatingConditionRange NOTIFY operatingConditionRangeChanged)

    // Real time values
    Q_PROPERTY(double workingElectrodeValue READ workingElectrodeValue WRITE setWorkingElectrodeValue NOTIFY workingElectrodeValueChanged)
    Q_PROPERTY(double counterElectrodeValue READ counterElectrodeValue WRITE setCounterElectrodeValue NOTIFY counterElectrodeValueChanged)
    Q_PROPERTY(double currentValue READ currentValue WRITE setCurrentValue NOTIFY currentValueChanged)
    Q_PROPERTY(int currentValueUnit READ currentValueUnit WRITE setCurrentValueUnit NOTIFY currentValueUnitChanged)

    // Enums
    Q_ENUMS(SamplingPeriodUnit)
    Q_ENUMS(WESetPointUnit)
    Q_ENUMS(OperatingConditionType)
    Q_ENUMS(OperatingConditionRange)
    Q_ENUMS(CurrentValueUnit)

public:
    enum SamplingPeriodUnit { MICRO_SEC=0, MILLI_SEC, SEC, MINUTE };
    enum WESetPointUnit { MILLI_VOLT=0, VOLT };
    enum OperatingConditionType { POTENTIOSTAT=0, GALVANOSTAT };
    enum OperatingConditionRange { RANGE1=0, RANGE2, RANGE3, RANGE4, RANGE5, RANGE6, RANGE7, RANGE8, RANGE9 };
    enum CurrentValueUnit { MICRO_AMPERE=0, MILLI_AMPERE, AMPERE };

    friend class Controller;

    // Destructor
    virtual ~CockpitController();

    // Startup
    virtual bool startup();

    // Shutdown
    virtual void shutdown();

protected:
    // Constructor
    explicit CockpitController(QObject *parent = 0);

private:
    //
    // Advanced settings
    //

    // Return discrete sampling
    bool discreteSampling() const;

    // Set discrete sampling
    void setDiscreteSampling(bool bDiscreteSampling);

    // Return IR compression
    bool irCompression() const;

    // Set IR compression
    void setIRCompression(bool bIRCompression);

    // Return voltage error correction
    bool voltageErrorCorrection() const;

    // Set voltage error correction
    void setVoltageErrorCorrection(bool bVoltageErrorCorrection);

    //
    // Run experiment
    //

    // Return technique builder state
    bool techniqueBuilderState() const;

    // Set technique builder state
    void setTechniqueBuilderState(bool bTechniqueBuilderState);

    // Return switch to open circuit state
    bool switchToOpenCircuitState() const;

    // Set switch to open circuit state
    void setSwitchToOpenCircuitState(bool bSwitchToOpenCircuitState);

    // Return sampling period
    double samplingPeriod() const;

    // Set sampling period
    void setSamplingPeriod(double dSamplingPeriod);

    // Return sampling period unit:
    int samplingPeriodUnit() const;

    // Set sampling period unit:
    void setSamplingPeriodUnit(int iSamplingPeriodUnit);

    // Return WE set point:
    double weSetPoint() const;

    // Set WE set point:
    void setWESetPoint(double dWESetPoint);

    // Return WE set point unit:
    int weSetPointUnit() const;

    // Set WE set point unit:
    void setWESetPointUnit(int iWESetPointUnit);

    //
    // Operating conditions
    //

    // Return operating condition type
    int operatingConditionType() const;

    // Set operating condition type
    void setOperatingConditionType(int iOperatingConditionType);

    // Return operating condition range
    int operatingConditionRange() const;

    // Set operating condition range
    void setOperatingConditionRange(int iOperatingConditionRange);

    //
    // Real time values
    //

    // Return current value
    double currentValue() const;

    // Set current value
    void setCurrentValue(double dCurrentValue);

    // Return current value unit
    int currentValueUnit() const;

    // Set current value unit
    void setCurrentValueUnit(int iCurrentValueUnit);

    // Return working electrode value
    double workingElectrodeValue() const;

    // Set working electrode value
    void setWorkingElectrodeValue(double dWorkingElectrodeValue);

    // Return counter electrode value
    double counterElectrodeValue() const;

    // Set working electrode value
    void setCounterElectrodeValue(double dCounterElectrodeValue);

private:
    // Avanced settings
    bool m_bDiscreteSampling;
    bool m_bIRCompression;
    bool m_bVoltageErrorCorrection;

    // Run experiment
    bool m_bTechniqueBuilderState;
    bool m_bSwitchToOpenCircuitState;
    double m_dSamplingPeriod;
    int m_iSamplingPeriodUnit;
    double m_dWESetPoint;
    int m_iWESetPointUnit;

    // Operating conditions
    int m_iOperatingConditionType;
    int m_iOperatingConditionRange;

    //
    // Real-time values
    //

    // Working electrode value
    double m_dWorkingElectrodeValue;

    // Counter electrode value
    double m_dCounterElectrodeValue;

    // Current value:
    double m_dCurrentValue;

    // Current value unit:
    int m_iCurrentValueUnit;

signals:
    // Advanced settings:
    void discreteSamplingChanged();
    void irCompressionChanged();
    void voltageErrorCorrectionChanged();

    // Run experiment
    void techniqueBuilderStateChanged();
    void switchToOpenCircuitStateChanged();
    void samplingPeriodChanged();
    void samplingPeriodUnitChanged();
    void weSetPointChanged();
    void weSetPointUnitChanged();

    // Operating conditions
    void operatingConditionTypeChanged();
    void operatingConditionRangeChanged();

    // Real time values
    void currentValueChanged();
    void currentValueUnitChanged();
    void workingElectrodeValueChanged();
    void counterElectrodeValueChanged();

public slots:
};

#endif // COCKPITCONTROLLER_H
