
#include "game.h"
#include "qdebug.h"
#include <QFile>
#include <QTextStream>
#include <QRandomGenerator>
#include <QDebug>

Game::Game(QObject *parent)
    : QObject{parent}
{
    currentQuestion = 0;
    reset();
}

void Game::reset()
{
    // wyzerowanie punktów
    score0 = 0;
    score1 = 0;
    score2 = 0;
    // wyczyszczenie pytań
    questions.clear();
    // odczytanie liczby pytań
    qint32 commonQuestionNum = 0, specialQuestionNum = 0;

    QFile numFile(":/content/data/questions_num-pl_PL.txt");
    if (numFile.open(QIODevice::ReadOnly))
    {
        QTextStream in(&numFile);
        if(!in.atEnd())
            QString line = in.readLine();

        if (!in.atEnd())
        {
            QString line = in.readLine();
            commonQuestionNum = line.toInt();
        }
        if (!in.atEnd())
        {
            QString line = in.readLine();
            specialQuestionNum = line.toInt();
        }
        numFile.close();
    }

    // losowanie pytań
    // pierwsze 2, kolejne 2 mnożnik 2 i 3, 5 finałowych
    QList<QList<QString>> tmp1;
    QFile questionFile(":/content/data/questions-pl_PL.txt");
    if (questionFile.open(QIODevice::ReadOnly))
    {
        QTextStream in(&questionFile);
        if(!in.atEnd())
            QString line = in.readLine();

        while (!in.atEnd())
        {
            QString tmp2 = in.readLine();

            tmp1.append(tmp2.split(';'));

        }
        questionFile.close();
    }
    do
    {
        if(commonQuestionNum-usedQuestions.count()<5)
            usedQuestions.clear();
        if(specialQuestionNum-usedSpecialQuestions.count()<5)
            usedSpecialQuestions.clear();
        if(questions.count()<2 || questions.count()>4)
        {
            qint32 x = QRandomGenerator::global()->bounded(commonQuestionNum-usedQuestions.count());

            while(x!=-1)
            {
                if(tmp1[x][2] == "1" && !usedQuestions.contains(tmp1[x][0]))
                {
                    usedQuestions.append(tmp1[x][0]);
                    questions.append(Question(tmp1[x][0].toInt(),tmp1[x][1]));
                    x = -1;
                }
                else
                {
                    x++;
                    if(x>tmp1.count())
                        break;
                }
            }
        }
        else
        {
            qint32 x = QRandomGenerator::global()->bounded(specialQuestionNum-usedSpecialQuestions.count());
            while(x!=-1)
            {
                if(tmp1[x][2] == "2" && !usedSpecialQuestions.contains(tmp1[x][0]))
                {
                    usedSpecialQuestions.append(tmp1[x][0]);
                    questions.append(Question(tmp1[x][0].toInt(),tmp1[x][1],questions.count()));
                    x = -1;
                }
                else
                {
                    x++;
                    if(x>tmp1.count())
                        break;
                }
            }
        }


    }while(questions.count()<9);
//    qDebug()<<questions.count();


}

void Game::addScore(qint32 team)
{
    if(team == 1)
    {
        score1 += score0;
    }
    else if(team == 2)
    {
        score2 += score0;
    }
    tmp = score0;
}

void Game::addScore( qint32 question, qint32 answer)
{
    score0 += questions[question].getAnswerValue(answer);
}

qint32 Game::getScore(qint32 team)
{
    if(team == 0)
        return score0;
    else if(team == 1)
        return score1;
    else if(team == 2)
        return score2;

    return 0;
}

qint32 Game::getAnswersNum(qint32 question)
{
    return questions[question].getAnswersNum();
}

void Game::undoScore(qint32 team)
{
    if(team == 1)
    {
        score1 -= tmp;
    }
    else if(team == 2)
    {
        score2 -= tmp;
    }
    tmp = 0;
}

void Game::undoScore(qint32 question, qint32 answer)
{
    score0 -= questions[question].getAnswerValue(answer);
}

