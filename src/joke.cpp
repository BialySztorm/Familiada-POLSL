
#include "joke.h"
#include <QFile>
#include <QTextStream>
#include <QRandomGenerator>

Joke::Joke(QObject *parent)
    : QObject{parent}
{
    Id  = 0;
    Content = "";
    Author = "";
    QFile inputFile(":/content/data/jokes-pl_PL.txt");
    if (inputFile.open(QIODevice::ReadOnly))
    {
        QTextStream in(&inputFile);
        if(!in.atEnd())
            QString line = in.readLine();

        while (!in.atEnd())
        {
            QString line = in.readLine();
            Jokes.append(line);
        }
        inputFile.close();
    }

}

void Joke::drawJoke()
{
    if(Jokes.length())
    {
        int x  = QRandomGenerator::global()->bounded(Jokes.length());



        QStringList tmp = Jokes[x].split(';');
        UsedJokes.append(Jokes[x]);
        Jokes.removeAt(x);
        Id = tmp[0].toInt();
        Content = tmp[1];
//        Author = tmp[2];

        if(Jokes.length()<=0)
        {
            Jokes = UsedJokes;
            UsedJokes.clear();
        }
    }
}

qint32 Joke::getId()
{
    return Id;
}

QString Joke::getContent()
{
    return Content;
}

QString Joke::getAuthor()
{
    return Author;
}

