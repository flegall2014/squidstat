#ifndef MAINWINDOW_H
#define MAINWINDOW_H

// Qt
#include <QMainWindow>

// Application
#include "controller.h"
class QQuickWidget;

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    // Constructor
    explicit MainWindow(QWidget *parent = 0);

    // Destructor
    ~MainWindow();

    // Set controller
    void setController(ControllerPtr pController);

    // Set theme
    void setTheme(const QString &sTheme);

private:
    // Get view
    QQuickWidget *getView(const QString &sName) const;

private:
    // Main UI
    Ui::MainWindow *ui;

    // Controller
    ControllerPtr m_pController;
};

#endif // MAINWINDOW_H
