// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtMultimedia
import QtQuick.Controls
import QtQuick.Dialogs
import Familiada


Window {
    id:root

    minimumWidth: Constants.width
    minimumHeight: Constants.height

    visible: true
    title: "Familiada"

    property var translations: ({})

    signal translationsUpdated()

    function loadTranslations() {
        var fileUrl = Qt.resolvedUrl("data/ui.txt");
        var xhr = new XMLHttpRequest();
        xhr.open("GET", fileUrl, false); // Synchronous request
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                var lines = xhr.responseText.split("\n");
                for (var i = 1; i < lines.length; i++) {
                    var line = lines[i].trim();
                    if (line && line.indexOf(",") > -1) {
                        var parts = line.split(",");
                        var id = parts[0].trim();
                        var text = parts[1].trim();
                        if (id && text) {
                            translations[id] = text;
                        }
                    }
                }
                translationsUpdated();
            }
        };
        xhr.send();
    }


    function changeState(stateName)
    {
        if(stateName === "screen1" && player.playbackState != MediaPlayer.PlayingState)
        {
            mainScreen.focus = true
            player.play()
            game.reset()
            controller.reset()
        }
        else if(stateName === "screen3")
        {
            gameScreen.focus = true
            player.stop()
            player1.source = "sounds/familiada_between.mp3"
            player1.play()
        }
        if(controls.visible)
            controls.visible = false
        screens.state = stateName
        //        console.log(stateName)
    }
    function toggleControls()
    {
        if(controls.visible)
        {
            controls.visible = false
            gameScreen.focus = true
        }
        else
        {
            controls.visible = true
            controls.focus = true
        }
    }

    function playSfx(src)
    {
        player1.source = src
        player1.play()
    }

    function changeXVisibility(x,y,value)
    {
        if(x === 1)
        {
            if(y === 1)
            {
                gameScreen.x11.visible = value
            }
            else if(y === 2)
            {
                gameScreen.x12.visible = value
            }
            else if(y === 3)
            {
                gameScreen.x13.visible = value
            }
            else if(y === 4)
            {
                gameScreen.x14.visible = value
            }
        }
        else if (x === 2)
        {
            if(y === 1)
            {
                gameScreen.x21.visible = value
            }
            else if(y === 2)
            {
                gameScreen.x22.visible = value
            }
            else if(y === 3)
            {
                gameScreen.x23.visible = value
            }
            else if(y === 4)
            {
                gameScreen.x24.visible = value
            }
        }

    }

    function changeScore(x,value)
    {
        if(x === 0)
            gameScreen.val0 = value
        else if(x === 1)
            gameScreen.val1 = value
        else if(x === 2)
            gameScreen.val2 = value
    }

    function toggleSelection(x)
    {
        if(x === 0)
        {
            gameScreen.rect0 = 3
            gameScreen.rect1 = 0
            gameScreen.rect2 = 0
        }
        else if(x === 1)
        {
            gameScreen.rect0 = 0
            gameScreen.rect1 = 3
            gameScreen.rect2 = 0
        }
        else if(x === 2)
        {
            gameScreen.rect0 = 0
            gameScreen.rect1 = 0
            gameScreen.rect2 = 3
        }
    }

    MessageDialog {
        id: joke1
        buttons: MessageDialog.Ok
        text: "Content"
        onAccepted: gameScreen.focus = true
        onRejected: gameScreen.focus = true
    }
    function openJoke()
    {
        joke.drawJoke();
        joke1.text = joke.getContent()
        joke1.open();
    }

    function setAnswer(nr, ans, pt)
    {
        if(nr === 1)
        {
            gameScreen.ans1 = ans
            gameScreen.pt1 = pt
        }
        else if(nr === 2)
        {
            gameScreen.ans2 = ans
            gameScreen.pt2 = pt
        }
        else if(nr === 3)
        {
            gameScreen.ans3 = ans
            gameScreen.pt3 = pt
        }
        else if(nr === 4)
        {
            gameScreen.ans4 = ans
            gameScreen.pt4 = pt
        }
        else if(nr === 5)
        {
            gameScreen.ans5 = ans
            gameScreen.pt5 = pt
        }
        else if(nr === 6)
        {
            gameScreen.ans6 = ans
            gameScreen.pt6 = pt
        }
        else if(nr === 7)
        {
            gameScreen.ans7 = ans
            gameScreen.pt7 = pt
        }
        else if(nr === 8)
        {
            gameScreen.ans8 = ans
            gameScreen.pt8 = pt
        }
        else if(nr === 9)
        {
            gameScreen.ans9 = ans
            gameScreen.pt9 = pt
        }
        else if(nr === 10)
        {
            gameScreen.ans10 = ans
            gameScreen.pt10 = pt
        }
        else if(nr === 11)
        {
            gameScreen.ans11 = ans
            gameScreen.pt11 = pt
        }
        else if(nr === 12)
        {
            gameScreen.ans12 = ans
            gameScreen.pt12 = pt
        }
        else if(nr === 13)
        {
            gameScreen.ans13 = ans
            gameScreen.pt13 = pt
        }
        else if(nr === 14)
        {
            gameScreen.ans14 = ans
            gameScreen.pt14 = pt
        }
        else if(nr === 15)
        {
            gameScreen.ans15 = ans
            gameScreen.pt15 = pt
        }
        else if(nr === 16)
        {
            gameScreen.ans16 = ans
            gameScreen.pt16 = pt
        }

    }

    function setAnswerVisibility(x,value)
    {
        if(x === 1)
        {
            gameScreen.row1.visible = value
        }
        else if(x === 2)
        {
            gameScreen.row2.visible = value
        }
        else if(x === 3)
        {
            gameScreen.row3.visible = value
        }
        else if(x === 4)
        {
            gameScreen.row4.visible = value
        }
        else if(x === 5)
        {
            gameScreen.row5.visible = value
        }
        else if(x === 6)
        {
            gameScreen.row6.visible = value
        }
        else if(x === 7)
        {
            gameScreen.row7.visible = value
        }
    }

    Component.onCompleted: {
        loadTranslations()
        player.play()
    }


    Screen01_Main{
        id: mainScreen
        visible: true
        anchors.fill: parent
        translations: root.translations
    }
    Screen02_Settings{
        id: settingsScreen
        visible:false
        anchors.fill: parent
        translations: root.translations
    }
    Screen03_Game{
        id: gameScreen
        visible:false
        anchors.fill: parent
        Keys.onPressed: (event)=> { controller.keyPressEvent(event.key)}
        translations: root.translations
    }
    Screen04_Controls {
        id: controls
        visible: false
        anchors.fill: parent
        translations: root.translations
    }
    MediaPlayer {
        id: player
        source: "sounds/familiada_intro.mp3"
        loops: MediaPLayer.Infinite
        audioOutput: AudioOutput {
            volume: 0.5
        }
    }
    MediaPlayer {
        id: player1
        source: "sounds/familiada_sound.mp3"
        audioOutput: AudioOutput{
            volume: 1
        }
    }


    StateGroup {
        id: screens
        state: "screen1"
        states: [
            State {
                name: "screen1"
                PropertyChanges {
                    target: mainScreen
                    visible:true
                }
                PropertyChanges {
                    target: settingsScreen
                    visible:false
                }
                PropertyChanges {
                    target: gameScreen
                    visible:false
                }
            },
            State {
                name: "screen2"
                PropertyChanges {
                    target: mainScreen
                    visible:false
                }
                PropertyChanges {
                    target: settingsScreen
                    visible:true
                }
                PropertyChanges {
                    target: gameScreen
                    visible:false
                }

            },
            State {
                name: "screen3"
                PropertyChanges {
                    target: mainScreen
                    visible:false
                }
                PropertyChanges {
                    target: settingsScreen
                    visible:false
                }
                PropertyChanges {
                    target: gameScreen
                    visible:true
                }

            }
        ]
    }

    Connections {
        target: controller
        onDoPlaySfx: {
            playSfx(src)
        }
        onDoChangeXVisibility:{
            changeXVisibility(x,y,value)
        }
        onDoChangeScore:{
            changeScore(x,value)
        }
        onDoOpenJoke:{
            openJoke()
        }
        onDoSetAnswer:{
            setAnswer(nr, answer, points)
        }
        onDoSetAnswerVisibility:{
            setAnswerVisibility(x,value)
        }
        onDoToggleSelection:{
            toggleSelection(x)
        }
    }
}

