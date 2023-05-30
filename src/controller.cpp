
#include "controller.h"
#include "game.h"

Controller::Controller(QObject *parent)
    : QObject{parent}
{
    level = 1;
    team = 0;
    teamMistakes[0] = 0;
    teamMistakes[1] = 0;
}

void Controller::keyPressEvent(qint32 key)
{
    // qDebug()<<key;
    if( key == Qt::Key_Q )
    {
        team = 1;
        // TODO highlight the selected team
    }
    else if( key == Qt::Key_W )
    {
        team = 0;
        // TODO highlight the selected team
    }
    else if( key == Qt::Key_E )
    {
        team = 2;
        // TODO highlight the selected team
    }
    else if( key == Qt::Key_Z )
    {
        // TODO undo final mistake
    }
    else if( key == Qt::Key_X )
    {
        if(team && teamMistakes[team-1]<3)
        {
            teamMistakes[team-1]++;
            // TODO hide X
            // TODO show x
            // TODO play sound
        }
    }
    else if( key == Qt::Key_C )
    {
        if(team)
        {
            // TODO hide x
            // TODO show X
            // TODO play sound
        }
    }
    else if( key == Qt::Key_A )
    {
        if(level>1)
        {
            level--;
            if(level == 4)
            {
                // TODO change question with no points
            }
            // TODO change question (parse team for adding points)
            // TODO hide X & x
        }
    }
    else if( key == Qt::Key_D )
    {
        if(level<4)
        {
            level ++;
            // TODO change question (parse team for adding points)
            // TODO hide X & x
        }
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
}

