#-------------------------------------------------
#
# Project created by QtCreator 2015-05-06T18:09:08
#
#-------------------------------------------------

QT       += qml quick widgets declarative qml quick

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Email
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h

RESOURCES += \
    res.qrc


android{
 message("* Using settings for Android.")
ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android-src
INCLUDEPATH += $$PWD/android-src/
OTHER_FILES += \
      android-src/AndroidManifest.xml
  }

