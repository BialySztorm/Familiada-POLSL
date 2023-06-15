
#include "controller.h"
#include "game.h"

Controller::Controller(QObject *parent)
    : QObject{parent}
{
    level = 1;
    team = 0;
    teamMistakes[0] = 0;
    teamMistakes[1] = 0;
    lastAnswer = 0;
}

void Controller::keyPressEvent(qint32 key)
{
    // qDebug()<<key;
    if( key == Qt::Key_Q )
    {
        team = 1;
        // TODO highlight the selected team
        callToggleSelection(1);
    }
    else if( key == Qt::Key_W )
    {
        team = 0;
        // TODO highlight the selected team
        callToggleSelection(0);
    }
    else if( key == Qt::Key_E )
    {
        team = 2;
        // TODO highlight the selected team
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
            // TODO hide X
            callChangeXVisibility(team,3,false);
            // TODO show x
            callChangeXVisibility(team,++teamMistakes[team-1],true);
            // TODO play sound
            callPlaySfxInQML("sounds/answer_wrong.mp3");
        }
        qDebug()<<"x";
    }
    else if( key == Qt::Key_C )
    {
        if(team)
        {
            // TODO hide x
            callChangeXVisibility(team,1,false);
            callChangeXVisibility(team,2,false);
            callChangeXVisibility(team,3,false);
            teamMistakes[team-1] = 0;
            // TODO show X
            callChangeXVisibility(team,4,true);
            // TODO play sound
            callPlaySfxInQML("sounds/answer_wrong.mp3");
        }
    }
    else if( key == Qt::Key_A )
    {
        if(level>1)
        {
            level--;
            if(!isPointsAdded && level <5)
            {
                // Add points
            }
            else
            {
                isPointsAdded = false;
            }
            // TODO change question
            // get answer num, insert to answers
            // TODO hide X & x
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
            if(!isPointsAdded)
            {
                // Add points
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
        // call answer function
    }
    else if( key == Qt::Key_2 )
    {
        // call answer function
    }
    else if( key == Qt::Key_3 )
    {
        // call answer function
    }
    else if( key == Qt::Key_4 )
    {
        // call answer function
    }
    else if( key == Qt::Key_5 )
    {
        // call answer function
    }
    else if( key == Qt::Key_6 )
    {
        // call answer function
    }
}

void Controller::reset()
{
    level = 1;
    team = 0;
    teamMistakes[0] = 0;
    teamMistakes[1] = 0;

    callChangeXVisibility(1,1,false);
    callChangeXVisibility(1,2,false);
    callChangeXVisibility(1,3,false);
    callChangeXVisibility(1,4,false);
    callChangeXVisibility(2,1,false);
    callChangeXVisibility(2,2,false);
    callChangeXVisibility(2,3,false);
    callChangeXVisibility(2,4,false);

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

void Controller::callDrawJoke()
{
    emit doOpenJoke();
}

