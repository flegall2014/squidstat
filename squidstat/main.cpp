// Qt
#include <QApplication>

// Application
#include "mainwindow.h"

// Application
#include "squidstat.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    // Launch application
    SquidStat *pApplication = CSingleton<SquidStat>::getInstance();

    // Start
    pApplication->startup();

    // Event loop
    int res = a.exec();

    // Shutdown
    pApplication->shutdown();
    delete pApplication;

    return res;
}
