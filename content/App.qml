// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtMultimedia
import QtQuick.Controls
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
            player.play()
        else if(stateName === "screen3")
            player.stop()
        if(controls.visible)
            controls.visible = false
        screens.state = stateName
//        console.log(stateName)
    }
    function toggleControls()
    {
        if(controls.visible)
            controls.visible = false
        else
            controls.visible = true
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
    }
    Screen05_Controls {
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
}

