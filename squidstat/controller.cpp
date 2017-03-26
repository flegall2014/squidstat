// Qt
#include <QDebug>

// Application
#include "controller.h"
#include "cockpitcontroller.h"

// Constructor
Controller::Controller(QObject *parent) : QObject(parent)
{
    qDebug() << "BUILD MAIN CONTROLLER";

    // Build cockpit controller
    m_pCockpitController = CockpitControllerPtr(new CockpitController);
}

// Destructor
Controller::~Controller()
{
    qDebug() << "DESTROY MAIN CONTROLLER";
}

// Startup
bool Controller::startup()
{
    qDebug() << "STARTUP MAIN CONTROLLER";

    // Start cockpit controller
    if (!m_pCockpitController->startup())
        return false;

    return true;
}

// Shutdown:
void Controller::shutdown()
{
    qDebug() << "SHUTDOWN MAIN CONTROLLER";

    // Shutdown cockpit controller
    m_pCockpitController->shutdown();
}

// Return cockpit controller
CockpitControllerPtr Controller::cockpitController() const
{
    return m_pCockpitController;
}
