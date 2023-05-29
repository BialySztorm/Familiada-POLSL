
#ifndef GAME_H
#define GAME_H


#include <QObject>


class Game : public QObject
{
    Q_OBJECT
public:
    explicit Game(QObject *parent = nullptr);
    Q_INVOKABLE void reset();

signals:

};

#endif // GAME_H
