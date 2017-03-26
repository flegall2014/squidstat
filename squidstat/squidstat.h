#ifndef SQUIDSTAT_H
#define SQUIDSTAT_H

// Application:
#include "csingleton.h"
#include "mainwindow.h"
#include "iservice.h"
#include "defs.h"

class SquidStat : public CSingleton<SquidStat>, public IService
{
    friend class CSingleton<SquidStat>;

public:
    // Constructor
    SquidStat();

    // Destructor
    virtual ~SquidStat();

    // Startup
    virtual bool startup();

    // Shutdown
    virtual void shutdown();

    // Return controller
    ControllerPtr controller() const;

private:
    // Controller
    ControllerPtr m_pController;

    // Main window
    MainWindow m_wMainWindow;
};

#endif // SQUIDSTAT_H
