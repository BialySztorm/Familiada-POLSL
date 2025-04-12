/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: item1

    property var translations

    Rectangle {
        width: parent.width * 0.4
        height: parent.height * 0.75
        color: "#968b8b8b"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        Column {
            id: column
            width: parent.width
            height: parent.height
            padding: 10

            Text {
                id: text1
                text: translations ? (translations["controlsTitle"] || qsTr("Controls:")) : qsTr("Controls:")
                font.pixelSize: parent.width / 12
                font.family: "Verdana"
            }

            Text {
                id: text2
                text: translations ? (translations["controlLeftTeam"] || qsTr("q - choose left team")) : qsTr("q - choose left team")
                font.pixelSize: parent.width / 18
                font.family: "Verdana"
            }
            Text {
                id: text3
                text: translations ? (translations["controlNoTeam"] || qsTr("w - choose no team")) : qsTr("w - choose no team")
                font.pixelSize: parent.width / 18
                font.family: "Verdana"
            }
            Text {
                id: text4
                text: translations ? (translations["controlRightTeam"] || qsTr("e - choose right team")) : qsTr("e - choose right team")
                font.pixelSize: parent.width / 18
                font.family: "Verdana"
            }
            Text {
                id: text5
                text: translations ? (translations["controlRevealAnswer"] || qsTr("1-6 - reveal answer")) : qsTr("1-6 - reveal answer")
                font.pixelSize: parent.width / 18
                font.family: "Verdana"
            }
            Text {
                id: text6
                text: translations ? (translations["controlWrongAnswer"] || qsTr("x - wrong answer")) : qsTr("x - wrong answer")
                font.pixelSize: parent.width / 18
                font.family: "Verdana"
            }
            Text {
                id: text7
                text: translations ? (translations["controlFullyWrongAnswer"] || qsTr("c - fully wrong answer")) : qsTr("c - fully wrong answer")
                font.pixelSize: parent.width / 18
                font.family: "Verdana"
            }
            Text {
                id: text8
                text: translations ? (translations["controlAwardPoints"] || qsTr("s - award points")) : qsTr("s - award points")
                font.pixelSize: parent.width / 18
                font.family: "Verdana"
            }
            Text {
                id: text9
                text: translations ? (translations["controlPreviousQuestion"] || qsTr("a - previous question")) : qsTr("a - previous question")
                font.pixelSize: parent.width / 18
                font.family: "Verdana"
            }
            Text {
                id: text10
                text: translations ? (translations["controlNextQuestion"] || qsTr("d - next question")) : qsTr("d - next question")
                font.pixelSize: parent.width / 18
                font.family: "Verdana"
            }
//            Text {
//                id: text11
//                text: translations ? (translations["controlCancelLastAnswer"] || qsTr("z - undo last answer (final)")) : qsTr("z - undo last answer (final)")
//                font.pixelSize: parent.width / 18
//            }
            Text {
                id: text12
                text: translations ? (translations["controlShowJoke"] || qsTr("j - show joke")) : qsTr("j - show joke")
                font.pixelSize: parent.width / 18
                font.family: "Verdana"
            }
        }
        Connections {
            target: root
            onTranslationsUpdated: {
                translations = root.translations;
            }
        }
    }
}
