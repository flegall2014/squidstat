// Qt
#include <QQmlEngine>
#include <QQmlContext>

// Application
#include "baseview.h"

// Constructor
BaseView::BaseView(QWidget *pParent) : QQuickWidget(pParent)
{

}

// Destructor
BaseView::~BaseView()
{

}

// Set context property
void BaseView::setContextProperty(const QString &sName, QObject *pValue)
{
    engine()->rootContext()->setContextProperty(sName, pValue);
}
