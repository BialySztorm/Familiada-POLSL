
#include "controller.h"
#include "game.h"

Controller::Controller(QObject *parent)
    : QObject{parent}
{
    reset();
}

void Controller::keyPressEvent(qint32 key)
{
    // qDebug()<<key;
    if( key == Qt::Key_Q )
    {
        team = 1;
        // highlight the selected team
        callToggleSelection(1);
    }
    else if( key == Qt::Key_W )
    {
        team = 0;
        // highlight the selected team
        callToggleSelection(0);
    }
    else if( key == Qt::Key_E )
    {
        team = 2;
        // highlight the selected team
        callToggleSelection(2);
    }
    else if( key == Qt::Key_Z )
    {
        // TODO undo final mistake
        // hide answer, substract points
    }
    else if( key == Qt::Key_X )
    {
        callChangeXVisibility(team,4,false);
        if(team && teamMistakes[team-1]<3)
        {
            // hide X
            callChangeXVisibility(team,3,false);
            // show x
            callChangeXVisibility(team,++teamMistakes[team-1],true);
            // play sound
            callPlaySfxInQML("sounds/answer_wrong.mp3");
        }
        qDebug()<<"x";
    }
    else if( key == Qt::Key_C )
    {
        if(team)
        {
            // hide x
            callChangeXVisibility(team,1,false);
            callChangeXVisibility(team,2,false);
            callChangeXVisibility(team,3,false);
            teamMistakes[team-1] = 0;
            // show X
            callChangeXVisibility(team,4,true);
            // play sound
            callPlaySfxInQML("sounds/answer_wrong.mp3");
        }
    }
    else if( key == Qt::Key_S )
    {
        if(!isPointsAdded && team)
        {
            gameRef->addScore(team);
            callChangeScore(team,gameRef->getScore(team));
            isPointsAdded = true;
        }
    }
    else if( key == Qt::Key_A )
    {
        if(level>1 && level<5)
        {
            level--;
            if(!isPointsAdded && team)
            {
                // Add points
                gameRef->addScore(team);
                callChangeScore(team,gameRef->getScore(team));
            }
            else
            {
                isPointsAdded = false;
            }
            // TODO change question
            // get answer num, insert to answers
            // hide X & x
            callChangeXVisibility(1,1,false);
            callChangeXVisibility(1,2,false);
            callChangeXVisibility(1,3,false);
            callChangeXVisibility(1,4,false);
            callChangeXVisibility(2,1,false);
            callChangeXVisibility(2,2,false);
            callChangeXVisibility(2,3,false);
            callChangeXVisibility(2,4,false);
        }
    }
    else if( key == Qt::Key_D )
    {
        if(level<5)
        {
            level ++;
            if(!isPointsAdded && team)
            {
                // Add points
                gameRef->addScore(team);
                callChangeScore(team,gameRef->getScore(team));
            }
            else
            {
                isPointsAdded = false;
            }
            // TODO change question
            // check if any team have score >300, than level = 5
            // get answer num, insert to answers
            // hide X & x
            callChangeXVisibility(1,1,false);
            callChangeXVisibility(1,2,false);
            callChangeXVisibility(1,3,false);
            callChangeXVisibility(1,4,false);
            callChangeXVisibility(2,1,false);
            callChangeXVisibility(2,2,false);
            callChangeXVisibility(2,3,false);
            callChangeXVisibility(2,4,false);
        }
    }
    else if( key == Qt::Key_J )
    {
        callDrawJoke();
    }
    else if( key == Qt::Key_1 )
    {
        processAnswer(1);
    }
    else if( key == Qt::Key_2 )
    {
        processAnswer(2);
    }
    else if( key == Qt::Key_3 )
    {
        processAnswer(3);
    }
    else if( key == Qt::Key_4 )
    {
        processAnswer(4);
    }
    else if( key == Qt::Key_5 )
    {
        processAnswer(5);
    }
    else if( key == Qt::Key_6 )
    {
        processAnswer(6);
    }
}

void Controller::reset()
{
    level = 1;
    team = 0;
    teamMistakes[0] = 0;
    teamMistakes[1] = 0;
    lastAnswer = 0;

    callChangeXVisibility(1,1,false);
    callChangeXVisibility(1,2,false);
    callChangeXVisibility(1,3,false);
    callChangeXVisibility(1,4,false);
    callChangeXVisibility(2,1,false);
    callChangeXVisibility(2,2,false);
    callChangeXVisibility(2,3,false);
    callChangeXVisibility(2,4,false);

    callChangeScore(0,0);
    callChangeScore(1,0);
    callChangeScore(2,0);

    callSetAnswer(1,"....................",0);
    callSetAnswer(2,"....................",0);
    callSetAnswer(3,"....................",0);
    callSetAnswer(4,"....................",0);
    callSetAnswer(5,"....................",0);
    callSetAnswer(6,"....................",0);
}

void Controller::setGameRef(Game *game)
{
    gameRef = game;
}

void Controller::processAnswer(qint32 x)
{

    if(level<5)
    {
        // call answer function
        QString tmp1 = gameRef->getAnswer(level-1,x);
        qint32 tmp2 = gameRef->getPoints(level-1,x);
        if(level == 3)
        {
            tmp2 /= 2;
        }
        else if(level == 4)
        {
            tmp2 /= 3;
        }
        callSetAnswer(x,tmp1,tmp2);
        gameRef->addScore(level-1,x);
    }
    else
    {
        // call answer function
        QString tmp1 = gameRef->getAnswer(lastAnswer,x);
        qint32 tmp2 = gameRef->getPoints(lastAnswer++,x);
        callSetAnswer(lastAnswer+6,tmp1,tmp2);
        gameRef->addScore(lastAnswer%5 + 3,x);
    }
    // add points

    callChangeScore(0,gameRef->getScore(0));


    // play sfx
    callPlaySfxInQML("sounds/answer_good.mp3");
}

void Controller::callPlaySfxInQML(QString src)
{
    emit doPlaySfx(src);
}

void Controller::callChangeXVisibility(qint32 x, qint32 y, bool value)
{
    emit doChangeXVisibility(x,y,value);
}

void Controller::callChangeScore(qint32 x, qint32 value)
{
    emit doChangeScore(x,value);
}

void Controller::callToggleSelection(qint32 x)
{
    emit doToggleSelection(x);
}

void Controller::callSetAnswer(qint32 nr, QString answer, qint32 points)
{
    emit doSetAnswer(nr,answer,points);
}

void Controller::callSetAnswerVisibility(qint32 x, qint32 value)
{
    emit doSetAnswerVisibility(x,value);
}

void Controller::callDrawJoke()
{
    emit doOpenJoke();
}

