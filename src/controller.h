
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
    qint32 lastAnswer;
    bool isPointsAdded;

    void callPlaySfxInQML(QString src);
    void callChangeXVisibility(qint32 x,qint32 y,bool value);
    void callChangeScore(qint32 x,qint32 value);
    void callDrawJoke();

signals:
    void doPlaySfx(QString src);
    void doChangeXVisibility(int x,int y,bool value);
    void doChangeScore(int x,int value);
    void doOpenJoke();

};

#endif // CONTROLLER_H
