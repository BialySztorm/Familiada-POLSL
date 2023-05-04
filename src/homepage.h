
#ifndef HOMEPAGE_H
#define HOMEPAGE_H


#include <QObject>


class HomePage : public QObject
{
    Q_OBJECT
public:
    explicit HomePage(QObject *parent = nullptr);
public slots:
    void useBtn();

signals:

};

#endif // HOMEPAGE_H
