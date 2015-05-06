#include <QMainWindow>
#include <QDesktopServices>
#include <QDebug>
#include <QUrl>
#include <QFile>
#include <QDir>
class MainWindow : public QObject {
    Q_OBJECT


public slots:
    bool launchClient(QString,QString,QString,bool);
};
