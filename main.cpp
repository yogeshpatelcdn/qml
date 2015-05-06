#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlEngine>
#include <mainwindow.h>
#include <QQmlContext>
#include <QScreen>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);

    MainWindow m;
    view.rootContext()->setContextProperty("mainwindow", &m); //so we can call slot of mainwindow class

    // Qt.quit() called in embedded .qml by default only emits
    // quit() signal, so do this (optionally use Qt.exit()).
    QObject::connect(view.engine(), SIGNAL(quit()), qApp, SLOT(quit()));
    view.setSource(QUrl("qrc:///res/main.qml"));

    QScreen *screen = qApp->screens().at(0);
    view.resize(screen->geometry().width(), screen->geometry().height());
    view.show();

    return app.exec();
}
