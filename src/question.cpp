
#include "question.h"

Question::Question(QObject *parent,quint32 id, QString question, quint32 multiplayer)
    : QObject{parent}
{
    this->id = id;
    this->question = question;
    this->multiplayer = multiplayer;
}

void Question::addAnswer(QString answer, quint32 value)
{
    answers.append(answer);
    answersValue.append(value);
}

QString Question::print(QString src)
{
    QString tmp = "";
    tmp += question+"\n";
    for(int i = 0; i< answers.count(); i++)
        tmp+= answers[i]+"\n";

    return tmp;
}

quint32 Question::getAnswersNum()
{
    return answers.count();
}

QString Question::getAnswer(quint32 i)
{
    if(answers.count()>=i && i>0)
        return answers[i-1];
    else
        return "";
}

quint32 Question::getAnswerValue(quint32 i)
{
    if(answers.count()>=i && i>0)
        return answersValue[i-1]*multiplayer;
    else
        return 0;
}

