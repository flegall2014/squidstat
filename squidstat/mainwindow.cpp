// Qt
#include <QDebug>
#include <QFile>
#include <QQmlEngine>
#include <QQmlContext>

// Application
#include "mainwindow.h"
#include "ui_mainwindow.h"

// Constructor
MainWindow::MainWindow(QWidget *parent) : QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    // Setup UI
    ui->setupUi(this);
    ui->mainToolBar->hide();

    // Set theme
    setTheme("Theme_Default");

    // Set title
    setWindowTitle("SQUIDSTAT / COCKPIT VIEW");
}

// Destructor
MainWindow::~MainWindow()
{
    delete ui;
}

// Set controller
void MainWindow::setController(ControllerPtr pController)
{
    // Set main controller
    m_pController = pController;

    // Initialize cockpit view
    CockpitView *pCockpitView = dynamic_cast<CockpitView *>(getView("cockpitView"));
    if (pCockpitView) {
        pCockpitView->setContextProperty("controller", m_pController->cockpitController().data());
        pCockpitView->setSource(QUrl("qrc:/qml/CockpitView.qml"));
    }
}

// Set theme
void MainWindow::setTheme(const QString &sTheme)
{
    QString sStyle = QString(":/theme/%1.css").arg(sTheme);
    qDebug() << "SETTING THEME TO: " << sStyle;

    // Set style sheet
    QFile file(sStyle);

    if (file.open(QFile::ReadOnly | QFile::Text))
    {
        QTextStream stream(&file);
        QString sStyle = stream.readAll();

        qApp->setStyleSheet(sStyle);
        file.close();
    }
}

// Get view
QQuickWidget *MainWindow::getView(const QString &sName) const
{
    return findChild<QQuickWidget *>(sName);
}
