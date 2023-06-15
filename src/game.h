
#ifndef GAME_H
#define GAME_H


#include <QObject>
#include "question.h"


class Game : public QObject
{
    Q_OBJECT
public:
    explicit Game(QObject *parent = nullptr);
    Q_INVOKABLE void reset();

    void addScore(qint32 team);
    void addScore(qint32 question, qint32 answer);
    qint32 getScore(qint32 team);
    qint32 getAnswersNum(qint32 question);

    void undoScore(qint32 team);
    void undoScore(qint32 question,qint32 answer);


private:
    qint32 score0;
    qint32 score1;
    qint32 score2;
    qint32 tmp;
    QList<Question> questions;
    QList<QString> usedQuestions;
    QList<QString> usedSpecialQuestions;
    qint32 currentQuestion;

    qint32 drawQuestion(qint32 type);
};

#endif // GAME_H
