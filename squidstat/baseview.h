#ifndef BASEVIEW_H
#define BASEVIEW_H

// Qt
#include <QQuickWidget>

class BaseView : public QQuickWidget
{
public:
    // Constructor
    BaseView(QWidget *parent=NULL);

    // Destructor
    virtual ~BaseView();

    // Set context property
    void setContextProperty(const QString &sName, QObject *pValue);
};

#endif // BASEVIEW_H
