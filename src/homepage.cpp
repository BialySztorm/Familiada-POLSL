
#include "homepage.h"
#include <QDebug>

HomePage::HomePage(QObject *parent)
    : QObject{parent}
{

}

void HomePage::useBtn()
{
    qDebug() << "Functions Use called";
}

