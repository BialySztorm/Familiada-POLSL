
#ifndef CONTROLLER_H
#define CONTROLLER_H


#include <QObject>
#include <QKeyEvent>

class Game;


class Controller : public QObject
{
    Q_OBJECT
public:
    explicit Controller(QObject *parent = nullptr);

    Q_INVOKABLE void keyPressEvent(qint32 key);
    Q_INVOKABLE void reset();

    void setGameRef(Game* game);
private:
    qint32 level;
    qint32 team;
    qint32 teamScored;
    qint32 teamMistakes[2];
    qint32 lastAnswer;
    qint32 lastQuestion;
    bool isPointsAdded;
    bool isAnswerRevealed[6];
    Game* gameRef;

    void processAnswer(qint32 x);
    void undoAnswer();
    void hideX();

    void callPlaySfxInQML(QString src);
    void callChangeXVisibility(qint32 x,qint32 y,bool value);
    void callChangeScore(qint32 x,qint32 value);
    void callToggleSelection(qint32 x);
    void callSetAnswer(qint32 nr, QString answer, qint32 points);
    void callSetAnswerVisibility(qint32 x, qint32 value);
    void callDrawJoke();


signals:
    void doPlaySfx(QString src);
    void doChangeXVisibility(int x,int y,bool value);
    void doChangeScore(int x,int value);
    void doToggleSelection(int x);
    void doSetAnswer(int nr, QString answer, int points);
    void doSetAnswerVisibility(int x,int value);
    void doOpenJoke();

};

#endif // CONTROLLER_H
