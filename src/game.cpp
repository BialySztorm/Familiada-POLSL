
#include "game.h"
#include "qdebug.h"
#include <QFile>
#include <QTextStream>
#include <QRandomGenerator>
#include <QDebug>
#include <QLocale>

Game::Game(QObject *parent)
    : QObject{parent}
{
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
        in.setLocale(QLocale::Polish);
        if(!in.atEnd())
            QString line = in.readLine().toLocal8Bit();

        while (!in.atEnd())
        {
            QString tmp2 = in.readLine();
//            qDebug()<<tmp2;

            tmp1.append(tmp2.split(';'));

        }
        questionFile.close();
    }
    do
    {
        if(commonQuestionNum-usedQuestions.count()<=0)
            usedQuestions.clear();
        if(specialQuestionNum-usedSpecialQuestions.count()<=0)
            usedSpecialQuestions.clear();
        if(questions.count()<2 || questions.count()>=4)
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

    for(qint32 i = 0; i< questions.count(); i++)
    {
        QFile answerFile(":/content/data/answers-pl_PL.txt");
        if (answerFile.open(QIODevice::ReadOnly))
        {
            QTextStream in;
            in.setDevice(&answerFile);

            if(!in.atEnd())
            {
                QString line = in.readLine();
//                qDebug() << line;
//                qDebug() << line[0];
            }

            while (!in.atEnd())
            {
                QString tmp2 = in.readLine().toLocal8Bit();
                QList<QString> tmp3 = tmp2.split(';');
//                qDebug()<<tmp2;

                if(tmp3[1].toInt() == questions[i].getId())
                {
                    questions[i].addAnswer(tmp3[2],tmp3[3].toInt());
                }

            }

            answerFile.close();
        }
    }

    // wypisanie pytań do pliku
    QString filename="Data.txt";
    QFile file( filename );
    if ( file.open(QIODevice::ReadWrite) )
    {
        QTextStream stream( &file );
        for(qint32 i = 0; i< questions.count(); i++)
        {
            stream<<"Pytanie nr "<< i+1<<" " << questions[i].print();
        }
    }
    file.close();


//    qDebug()<<questions.count();
//    qDebug()<<questions[1].getAnswersNum();


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

QString Game::getAnswer(qint32 level, qint32 question)
{
    return questions[level].getAnswer(question);
}

qint32 Game::getPoints(qint32 level, qint32 question)
{
    return questions[level].getAnswerValue(question);
}

void Game::resetScore()
{
    score0 = 0;
}

//QString Game::fixString(QString tmp)
//{
//    QString tmp1 = "";
//    for(qint32 i = 0; i< tmp.length(); i++)
//    {
//        if(tmp[i]=='\ufffd')
//        {

//        }
//    }
//}

//void Game::undoScore(qint32 team)
//{
//    if(team == 1)
//    {
//        score1 -= tmp;
//    }
//    else if(team == 2)
//    {
//        score2 -= tmp;
//    }
//    tmp = 0;
//}

//void Game::undoScore(qint32 question, qint32 answer)
//{
//    score0 -= questions[question].getAnswerValue(answer);
//}

