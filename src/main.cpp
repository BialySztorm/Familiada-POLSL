// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "app_environment.h"
#include "import_qml_components_plugins.h"
#include "import_qml_plugins.h"

#include "game.h"
#include "joke.h"
#include "controller.h"
#include <QQmlContext>
#include <QIcon>

int main(int argc, char *argv[])
{
    set_qt_environment();

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    app.setWindowIcon(QIcon(":/content/images/StrasburgerIco.ico"));

    const QUrl url(u"qrc:Main/main.qml"_qs);

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");

    engine.load(url);

    // add global c++ object to the QML context as a property
    Game* game = new Game();
    engine.rootContext()->setContextProperty("game", game);
    Joke* joke = new Joke();
    engine.rootContext()->setContextProperty("joke", joke);

    // add controller
    Controller* controller = new Controller();
    engine.rootContext()->setContextProperty("controller", controller);

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
