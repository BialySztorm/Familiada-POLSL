
#ifndef QUESTION_H
#define QUESTION_H


#include <QObject>


class Question
{

public:
    explicit Question(qint32 id = 0, QString question = "", qint32 multiplayer = 1);

    void addAnswer(QString answer, qint32 value);
    QString print(QString src);
    qint32 getAnswersNum();
    QString getAnswer(qint32 i);
    qint32 getAnswerValue(qint32 i);

private:
    qint32 id;
    QString question;
    QList<QString> answers;
    QList<qint32> answersValue;
    qint32 multiplayer;

};

#endif // QUESTION_H
