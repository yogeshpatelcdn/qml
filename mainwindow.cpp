#include "mainwindow.h"


bool MainWindow:: launchClient(QString toText,QString subText,QString bodyText,bool isMailTo) {

    qDebug() << "\nTo:" <<toText << "\nSubject:" <<subText << "\nBody:" <<bodyText<< "\nisMailTo:" <<isMailTo;

    if(isMailTo){
        QString composeMail = "mailto:?subject=";
        composeMail.append(subText);
        composeMail.append("&body=");
        composeMail.append(bodyText);
        composeMail.append("&to=");
        composeMail.append(toText);
       //Not Working: composeMail.append("&attachment=c:\\test.txt");

        return  QDesktopServices::openUrl(QUrl(composeMail,QUrl::TolerantMode));
    }
    else{
        QFile attImage(":res/Qt_1.jpg"); // Read image attachment from resource file.
        attImage.open(QIODevice::ReadOnly);

        QFile ef(":res/monty.eml"); // Read eml file from resource file.
        if(ef.open(QIODevice::ReadOnly)){

            QString rawEml = ef.readAll();
            rawEml = rawEml.replace("SENDTOADDRESS",toText);
            rawEml = rawEml.replace("SUBJECTTOSEND",subText);
            rawEml = rawEml.replace("BODYTOSEND",bodyText);
            rawEml = rawEml.replace("ATTACHMENTBASE",attImage.readAll().toBase64());

            QString tmpFilePath = QDir::currentPath().append(QDir::separator()).append(QString("ComposedEmail.eml"));
            QFile tmpFile(tmpFilePath);
            if (tmpFile.open(QIODevice::WriteOnly) == false) {
                qCritical() << "Failed opening temp file for email composing:" << tmpFilePath;
                return false;
            }

            tmpFile.write(rawEml.toLatin1()); // Write to temp file on disk
            tmpFile.close();
            return QDesktopServices::openUrl(
                        QUrl(QDir::fromNativeSeparators(tmpFilePath),
                             QUrl::TolerantMode)); // Open temp eml file using QDesktopServices
        }
        else{
            return false;
        }
    }

}
