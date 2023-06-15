
#include "question.h"

Question::Question(qint32 id, QString question, qint32 multiplayer): id{id}, question{question}, multiplayer{multiplayer}
{

}



void Question::addAnswer(QString answer, qint32 value)
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

qint32 Question::getId()
{
    return id;
}

qint32 Question::getAnswersNum()
{
    return answers.count();
}

QString Question::getAnswer(qint32 i)
{
    if(answers.count()>=i && i>0)
        return answers[i-1];
    else
        return "";
}

qint32 Question::getAnswerValue(qint32 i)
{
    if(answers.count()>=i && i>0)
        return answersValue[i-1]*multiplayer;
    else
        return 0;
}

