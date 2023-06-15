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

    function changeState(stateName)
    {
        if(stateName === "screen1" && player.playbackState != MediaPlayer.PlayingState)
        {
            mainScreen.focus = true
            player.play()
            controller.reset()
            game.reset()
        }
        else if(stateName === "screen3")
        {
            gameScreen.focus = true
            player.stop()
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
            val0 = value
        else if(x === 1)
            val1 = value
        else if(x === 2)
            val2 = value
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
    }


    Screen01_Main{
        id: mainScreen
        visible: true
        anchors.fill: parent
    }
    Screen02_Settings{
        id: settingsScreen
        visible:false
        anchors.fill: parent
    }
    Screen03_Game{
        id: gameScreen
        visible:false
        anchors.fill: parent
        Keys.onPressed: (event)=> { controller.keyPressEvent(event.key)}
    }
    Screen04_Controls {
        id: controls
        visible: false
        anchors.fill: parent
    }
    MediaPlayer {
        id: player
        source: "sounds/familiada_intro.mp3"
        loops: MediaPLayer.Infinite
        audioOutput: AudioOutput {
            volume: 1
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
    Component.onCompleted: player.play()

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
    }
}

