#ifndef CONTROLLER_H
#define CONTROLLER_H

// Qt
#include <QObject>

// Application
#include "iservice.h"
#include "cockpitcontroller.h"
#include "defs.h"

class Controller : public QObject, public IService
{
    Q_OBJECT

public:
    friend class SquidStat;

    // Destructor
    virtual ~Controller();

    // Startup
    virtual bool startup();

    // Shutdown
    virtual void shutdown();

    // Return cockpit controller:
    CockpitControllerPtr cockpitController() const;

protected:
    // Constructor
    explicit Controller(QObject *parent = 0);

private:
    // Controller
    CockpitControllerPtr m_pCockpitController;

signals:

public slots:
};

#endif // CONTROLLER_H
