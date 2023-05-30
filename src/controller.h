
#ifndef CONTROLLER_H
#define CONTROLLER_H


#include <QObject>
#include <QKeyEvent>


class Controller : public QObject
{
    Q_OBJECT
public:
    explicit Controller(QObject *parent = nullptr);

    Q_INVOKABLE void keyPressEvent(qint32 key);
    Q_INVOKABLE void reset();
private:
    qint32 level;
    qint32 team;
    qint32 teamMistakes[2];

signals:

};

#endif // CONTROLLER_H
