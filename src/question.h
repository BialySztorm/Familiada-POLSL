
#ifndef QUESTION_H
#define QUESTION_H


#include <QObject>


class Question : public QObject
{
    Q_OBJECT
public:
    explicit Question(QObject *parent = nullptr,quint32 id = 0, QString question = "", quint32 multiplayer = 1);

    void addAnswer(QString answer, quint32 value);
    QString print(QString src);
    quint32 getAnswersNum();
    QString getAnswer(quint32 i);
    quint32 getAnswerValue(quint32 i);

private:
    quint32 id;
    QString question;
    QList<QString> answers;
    QList<quint32> answersValue;
    quint32 multiplayer;

};

#endif // QUESTION_H
