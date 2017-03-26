// Qt
#include <QDebug>

// Application
#include "squidstat.h"
#include "controller.h"

// Constructor
SquidStat::SquidStat()
{
    qDebug() << "BUILD SQUIDSTAT";

    // Build controller
    m_pController = ControllerPtr(new Controller);

    // Set controller on main window
    m_wMainWindow.setController(m_pController);
}

// Destructor
SquidStat::~SquidStat()
{
    qDebug() << "EXIT SQUIDSTAT";
}

// Startup
bool SquidStat::startup()
{
    qDebug() << "START UP SquidStat";

    if (m_pController->startup()) {
        m_wMainWindow.showMaximized();
        return true;
    }
    return false;
}

// Shutdown
void SquidStat::shutdown()
{
    qDebug() << "SHUT DOWN SquidStat";

    m_pController->shutdown();
}

// Return controller
ControllerPtr SquidStat::controller() const
{
    return m_pController;
}
