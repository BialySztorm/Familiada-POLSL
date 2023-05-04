// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import Familiada



Window {

    id:root
    width: parent.width
    height: parent.height
    minimumWidth: Constants.width
    minimumHeight: Constants.height

    visible: true
    title: "Familiada"

    function changeState(stateName)
    {
        screens.state = stateName
//        console.log(stateName)
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

}

