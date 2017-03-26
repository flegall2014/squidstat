#-------------------------------------------------
#
# Project created by QtCreator 2016-01-18T09:04:28
#
#-------------------------------------------------

QT += core gui qml quick quickwidgets
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TEMPLATE = app

CONFIG(debug, debug|release) {
    TARGET = squidstatd
} else {
    TARGET = squidstat
}

unix {
    DESTDIR = ./bin
    MOC_DIR = ./moc
    OBJECTS_DIR = ./obj
}

win32 {
    DESTDIR = .\\bin
    MOC_DIR = .\\moc
    OBJECTS_DIR = .\\obj
}

unix {
    QMAKE_CLEAN *= $$DESTDIR/*$$TARGET*
    QMAKE_CLEAN *= $$MOC_DIR/*moc_*
    QMAKE_CLEAN *= $$OBJECTS_DIR/*.o*
}

win32 {
    QMAKE_CLEAN *= $$DESTDIR\\*$$TARGET*
    QMAKE_CLEAN *= $$MOC_DIR\\*moc_*
    QMAKE_CLEAN *= $$OBJECTS_DIR\\*.o*
}

FORMS += \
    mainwindow.ui

HEADERS += \
    mainwindow.h \
    csingleton.h \
    controller.h \
    squidstat.h \
    iservice.h \
    cockpitcontroller.h \
    defs.h \
    cockpitview.h \
    baseview.h

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    controller.cpp \
    squidstat.cpp \
    cockpitcontroller.cpp \
    cockpitview.cpp \
    baseview.cpp

DISTFILES +=

RESOURCES += \
    resources.qrc
