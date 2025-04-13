
#include "controller.h"
#include "game.h"

Controller::Controller(QObject *parent)
    : QObject{parent}
{
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
        undoAnswer();
    }
    else if( key == Qt::Key_X )
    {
        if(team && teamMistakes[team-1]<3 && level<5)
        {
            // hide X
            callChangeXVisibility(team,4,false);
            // show x
            callChangeXVisibility(team,++teamMistakes[team-1],true);
            // play sound
            callPlaySfxInQML("sounds/answer_wrong.mp3");
        }
        else if(level>=5)
        {
            callPlaySfxInQML("sounds/answer_repeat.mp3");
        }
//        qDebug()<<"x";
    }
    else if( key == Qt::Key_C )
    {
        if(team && level<5)
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
        else if(level>=5)
            callPlaySfxInQML("sounds/final_time.mp3");
    }
    else if( key == Qt::Key_S )
    {
        if(!isPointsAdded && team)
        {
            gameRef->addScore(team);
            callChangeScore(team,gameRef->getScore(team));
            isPointsAdded = true;
            teamScored = team;
        }
        else if(isPointsAdded && teamScored)
        {
            gameRef->undoScore(teamScored);
            callChangeScore(teamScored,gameRef->getScore(teamScored));
            isPointsAdded = false;
            teamScored = 0;
        }
    }
    else if( key == Qt::Key_A )
    {
        lastAnswer = -1;

        if(level>1 && level<5)
        {
            level--;
            if(!isPointsAdded && teamScored)
            {
                gameRef->undoScore(teamScored);
                callChangeScore(teamScored,gameRef->getScore(teamScored));
            }
            else
            {
                isPointsAdded = false;
            }
            gameRef->resetScore();
            // change question
            // get answer num, insert to answers
            qint32 tmp = gameRef->getAnswersNum(level-1);
            for(qint32 i = 1; i<= 6; i++)
            {
                if(i<=tmp)
                    callSetAnswerVisibility(i,true);
                else
                    callSetAnswerVisibility(i,false);
                callSetAnswer(i,"....................",0);
            }
            // hide X & x
            hideX();
            callPlaySfxInQML("sounds/familiada_between.mp3");
        }
        team = 0;
        callToggleSelection(0);
    }
    else if( key == Qt::Key_D )
    {
        lastAnswer = -1;
        if(level<5)
        {
            level ++;
            if(!isPointsAdded && team)
            {
                // Add points
                gameRef->addScore(team);
                callChangeScore(team,gameRef->getScore(team));
                teamScored = team;
            }
            else
            {
                isPointsAdded = false;
            }
            gameRef->resetScore();
            callChangeScore(0,gameRef->getScore(0));
            // change question
            // check if any team have score >300, than level = 5
            if(gameRef->getScore(1)>= 300 || gameRef->getScore(2)>=300)
                level = 5;
            // hide X & x
            hideX();
            callPlaySfxInQML("sounds/familiada_between.mp3");
            if(level<5)
            {
                // get answer num, insert to answers
                qint32 tmp = gameRef->getAnswersNum(level-1);
                for(qint32 i = 1; i<= 6; i++)
                {
                    if(i<=tmp)
                        callSetAnswerVisibility(i,true);
                    else
                        callSetAnswerVisibility(i,false);
                    callSetAnswer(i,"....................",0);
                }
                team = 0;
                callToggleSelection(0);
            }
            else
            {
                // show final UI, hide normal
                for(qint32 i = 1; i<=6; i++)
                {
                    callSetAnswerVisibility(i,false);
                }
                callSetAnswerVisibility(7,true);
            }
        }
        else{
            callPlaySfxInQML("sounds/final_time.mp3");
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
    else if( key == Qt::Key_0 )
    {
        processAnswer(0);
    }
}

void Controller::reset()
{
    level = 1;
    team = 0;
    teamMistakes[0] = 0;
    teamMistakes[1] = 0;
    lastAnswer = 0;
    lastQuestion = 0;
    isPointsAdded = false;

    hideX();

    callChangeScore(0,0);
    callChangeScore(1,0);
    callChangeScore(2,0);

    for(qint32 i = 1; i<=16; i++)
    {
        callSetAnswer(i,"....................",0);
    }

    callSetAnswerVisibility(7,false);
    qint32 tmp= gameRef->getAnswersNum(0);
//    qDebug()<<tmp;
//    qDebug()<< gameRef->getAnswer(0,1);
    for(qint32 i = 1; i<= 6; i++)
    {
        if(i<=tmp)
            callSetAnswerVisibility(i,true);
        else
            callSetAnswerVisibility(i,false);
    }
}

void Controller::setGameRef(Game *game)
{
    gameRef = game;
    reset();
}

void Controller::processAnswer(qint32 x)
{

    if(level<5)
    {
        if(x == 0)
            return;
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
        if(isAnswerRevealed[x-1])
        {
            tmp1 = "....................";
            tmp2 = 0;
            isAnswerRevealed[x-1] = false;
            gameRef->substractScore(level-1,x);
        }
        else
        {
            isAnswerRevealed[x-1] = true;
            gameRef->addScore(level-1,x);
            // play sfx
            callPlaySfxInQML("sounds/answer_good.mp3");
        }
        callSetAnswer(x,tmp1,tmp2);
    }
    else
    {
        // call answer function
        QString tmp1 = "";
        qint32 tmp2 = 0;
        if(x != 0)
        {
            tmp1 = gameRef->getAnswer(lastQuestion%5+4,x);
            tmp2 = gameRef->getPoints(lastQuestion++%5+4,x);
            // play sfx
            callPlaySfxInQML("sounds/answer_good_1.mp3");
        }
        else
        {
            lastQuestion++;
            // play sfx
            callPlaySfxInQML("sounds/answer_wrong.mp3");
        }
        callSetAnswer(lastQuestion+6,tmp1,tmp2);
        gameRef->addScore((lastQuestion-1)%5 + 4,x);


    }
    // add points

    callChangeScore(0,gameRef->getScore(0));

    lastAnswer = x;
}

void Controller::undoAnswer()
{
    if(level < 5)
    {
        if(lastAnswer > 0)
        {
            callSetAnswer(lastAnswer,"....................",0);
            gameRef->substractScore(level-1,lastAnswer);
            isAnswerRevealed[lastAnswer-1] = false;
            lastAnswer = 0;
        }
    }
    else
    {
        if(lastAnswer >=0)
        {
            callSetAnswer(lastQuestion+6,"....................",0);
            if(lastAnswer > 0)
                gameRef->substractScore((lastQuestion-1)%5 + 4,lastAnswer);
            lastQuestion--;
            lastAnswer = -1;
        }
    }
    callChangeScore(0,gameRef->getScore(0));
}

void Controller::hideX()
{
    for(qint32 i = 1;i<=2; i++ )
        for(qint32 j = 1; j<=4; j++)
            callChangeXVisibility(i,j,false);
    for(qint32 i = 0; i<6; i++)
        isAnswerRevealed[i] = false;
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

