
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
    property alias x11: leftSmallX1
    property alias x12: leftSmallX2
    property alias x13: leftSmallX3
    property alias x14: leftBigX
    property alias x21: rightSmallX1
    property alias x22: rightSmallX2
    property alias x23: rightSmallX3
    property alias x24: rightBigX
    property alias val0: score0.text
    property alias val1: score1.text
    property alias val2: score2.text
    property alias ans1: answer1.text
    property alias ans2: answer2.text
    property alias ans3: answer3.text
    property alias ans4: answer4.text
    property alias ans5: answer5.text
    property alias ans6: answer6.text
    property alias pt1: points1.text
    property alias pt2: points2.text
    property alias pt3: points3.text
    property alias pt4: points4.text
    property alias pt5: points5.text
    property alias pt6: points6.text
    property alias row1: row1
    property alias row2: row2
    property alias row3: row3
    property alias row4: row4
    property alias row5: row5
    property alias row6: row6
    property alias rect0: rectangle1.border.width
    property alias rect1: rectangle2.border.width
    property alias rect2: rectangle3.border.width

    Rectangle {
        id: rectangle
        width: parent.width
        height: parent.height
        Image {
            id: background
            anchors.fill: parent
            source: "images/background.svg"
            fillMode: Image.Stretch
        }
        color: Constants.backgroundColor

        Rectangle {
            id: rectangle0
            width: parent.width * 0.6
            height: parent.height * 0.6
            color: "#000000"
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
            Column {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.6
                height: parent.height
                topPadding: parent.height / 10
                Row {
                    id: row1
                    width: parent.width
                    height: parent.height / 10
                    Text {
                        id: nr1
                        color: "#fff300"
                        text: qsTr("1")
                        font.pixelSize: parent.height / 2
                        padding: 5
                    }
                    Text {
                        id: answer1
                        color: "#fff300"
                        text: qsTr("..........................")
                        font.pixelSize: parent.height / 2
                        padding: 5
                        width: parent.width * 0.8
                    }
                    Text {
                        id: points1
                        color: "#fff300"
                        text: qsTr("0")
                        font.pixelSize: parent.height / 2
                        padding: 5
                    }
                }
                Row {
                    id: row2
                    width: parent.width
                    height: parent.height / 10
                    Text {
                        id: nr2
                        color: "#fff300"
                        text: qsTr("2")
                        font.pixelSize: parent.height / 2
                        padding: 5
                    }
                    Text {
                        id: answer2
                        color: "#fff300"
                        text: qsTr("..........................")
                        font.pixelSize: parent.height / 2
                        padding: 5
                        width: parent.width * 0.8
                    }
                    Text {
                        id: points2
                        color: "#fff300"
                        text: qsTr("0")
                        font.pixelSize: parent.height / 2
                        padding: 5
                    }
                }
                Row {
                    id: row3
                    width: parent.width
                    height: parent.height / 10
                    Text {
                        id: nr3
                        color: "#fff300"
                        text: qsTr("3")
                        font.pixelSize: parent.height / 2
                        padding: 5
                    }
                    Text {
                        id: answer3
                        color: "#fff300"
                        text: qsTr("..........................")
                        font.pixelSize: parent.height / 2
                        padding: 5
                        width: parent.width * 0.8
                    }
                    Text {
                        id: points3
                        color: "#fff300"
                        text: qsTr("0")
                        font.pixelSize: parent.height / 2
                        padding: 5
                    }
                }
                Row {
                    id: row4
                    width: parent.width
                    height: parent.height / 10
                    Text {
                        id: nr4
                        color: "#fff300"
                        text: qsTr("4")
                        font.pixelSize: parent.height / 2
                        padding: 5
                    }
                    Text {
                        id: answer4
                        color: "#fff300"
                        text: qsTr("..........................")
                        font.pixelSize: parent.height / 2
                        padding: 5
                        width: parent.width * 0.8
                    }
                    Text {
                        id: points4
                        color: "#fff300"
                        text: qsTr("0")
                        font.pixelSize: parent.height / 2
                        padding: 5
                    }
                }
                Row {
                    id: row5
                    width: parent.width
                    height: parent.height / 10
                    Text {
                        id: nr5
                        color: "#fff300"
                        text: qsTr("5")
                        font.pixelSize: parent.height / 2
                        padding: 5
                    }
                    Text {
                        id: answer5
                        color: "#fff300"
                        text: qsTr("..........................")
                        font.pixelSize: parent.height / 2
                        padding: 5
                        width: parent.width * 0.8
                    }
                    Text {
                        id: points5
                        color: "#fff300"
                        text: qsTr("0")
                        font.pixelSize: parent.height / 2
                        padding: 5
                    }
                }
                Row {
                    id: row6
                    width: parent.width
                    height: parent.height / 10
                    Text {
                        id: nr6
                        color: "#fff300"
                        text: qsTr("6")
                        font.pixelSize: parent.height / 2
                        padding: 5
                    }
                    Text {
                        id: answer6
                        color: "#fff300"
                        text: qsTr("..........................")
                        font.pixelSize: parent.height / 2
                        padding: 5
                        width: parent.width * 0.8
                    }
                    Text {
                        id: points6
                        color: "#fff300"
                        text: qsTr("0")
                        font.pixelSize: parent.height / 2
                        padding: 5
                    }
                }
                Row {
                    width: parent.width
                    height: parent.height / 10
                }
                Row {
                    width: parent.width
                    height: parent.height / 10
                }
            }
        }
        Rectangle {
            id: rectangle1
            width: parent.width * 0.15
            height: parent.height * 0.15
            color: Constants.boardColor
            border.color: "#80227f"
            border.width: 3
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.heigth * 0.025
            Text {
                id: score0
                color: "#fff300"
                text: "000"
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: parent.height / 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle2
            width: parent.width * 0.15
            height: parent.height * 0.15
            color: Constants.boardColor
            border.color: "#1340ec"
            border.width: 0
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.005
            Text {
                id: score1
                color: "#fff300"
                text: "000"
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: parent.height / 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle3
            width: parent.width * 0.15
            height: parent.height * 0.15
            color: Constants.boardColor
            border.color: "#f2030d"
            border.width: 0
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.005
            Text {
                id: score2
                color: "#fff300"
                text: "000"
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: parent.height / 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
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
