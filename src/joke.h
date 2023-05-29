
#ifndef JOKE_H
#define JOKE_H


#include <QObject>


class Joke : public QObject
{
    Q_OBJECT
public:
    explicit Joke(QObject *parent = nullptr);

    Q_INVOKABLE void drawJoke();
    Q_INVOKABLE qint32 getId();
    Q_INVOKABLE QString getContent();
    Q_INVOKABLE QString getAuthor();

private:
    qint32 Id;
    QString Content;
    QString Author;
    QList<QString> UsedJokes;
    QList<QString> Jokes;

signals:

};

#endif // JOKE_H
