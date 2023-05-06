
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import Familiada

Item {
    id: screen03
    Rectangle {
        id: rectangle
        width: parent.width
        height: parent.height

        color: Constants.backgroundColor

        Rectangle {
            id: rectangle0
            width: parent.width * 0.6
            height: parent.height * 0.6
            color: Constants.boardColor
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: leftBigX
                source: "images/big_X.svg"
                anchors.leftMargin: parent.width * 0.01
                width: parent.width / 6
                height: parent.height * 0.75
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                visible: false
            }

            Column {
                id: leftColumn
                width: parent.width / 5
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 0
                spacing: parent.width / 120
                padding: parent.width / 80
                Image {
                    id: leftSmallX1
                    source: "images/small_X.svg"
                    width: parent.width - parent.width / 5
                    height: parent.height / 3 - parent.width / 10
                    visible: false
                }
                Image {
                    id: leftSmallX2
                    source: "images/small_X.svg"
                    width: parent.width - parent.width / 5
                    height: parent.height / 3 - parent.width / 10
                    visible: false
                }
                Image {
                    id: leftSmallX3
                    source: "images/small_X.svg"
                    width: parent.width - parent.width / 5
                    height: parent.height / 3 - parent.width / 10
                    visible: false
                }
            }

            Image {
                id: rightBigX
                source: "images/big_X.svg"
                anchors.rightMargin: 0
                width: parent.width / 6
                height: parent.height * 0.75
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                visible: false
            }

            Column {
                id: rightColumn
                width: parent.width / 5
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
                spacing: parent.width / 120
                padding: parent.width / 80
                Image {
                    id: rightSmallX1
                    source: "images/small_X.svg"
                    width: parent.width - parent.width / 5
                    height: parent.height / 3 - parent.width / 10
                    visible: false
                }
                Image {
                    id: rightSmallX2
                    source: "images/small_X.svg"
                    width: parent.width - parent.width / 5
                    height: parent.height / 3 - parent.width / 10
                    visible: false
                }
                Image {
                    id: rightSmallX3
                    source: "images/small_X.svg"
                    width: parent.width - parent.width / 5
                    height: parent.height / 3 - parent.width / 10
                    visible: false
                }
            }
        }

        Rectangle {
            id: rectangle1
            width: parent.width * 0.15
            height: parent.height * 0.15
            color: Constants.boardColor
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.005
        }

        Rectangle {
            id: rectangle2
            width: parent.width * 0.15
            height: parent.height * 0.15
            color: Constants.boardColor
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.heigth * 0.025
        }

        Rectangle {
            id: rectangle3
            width: parent.width * 0.15
            height: parent.height * 0.15
            color: Constants.boardColor
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.005
        }

        Button {
            id: controlsBtn
            text: qsTr("Show controls")
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            font.pointSize: parent.width / 50
            anchors.bottomMargin: parent.width / 50
            anchors.leftMargin: parent.width / 50
            Connections {
                target: controlsBtn
                onClicked: root.toggleControls()
            }
        }

        Button {
            id: returnBtn
            text: qsTr("Return to menu")
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            font.pointSize: parent.width / 50
            anchors.bottomMargin: parent.width / 50
            anchors.rightMargin: parent.width / 50
            Connections {
                target: returnBtn
                onClicked: root.changeState("screen1")
            }
        }
    }
}
