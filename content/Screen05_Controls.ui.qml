

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
                text: qsTr("Sterowanie:")
                font.pixelSize: parent.width / 10
            }

            Text {
                id: text2
                text: qsTr("q - wybierz lewą drużynę")
                font.pixelSize: parent.width / 15
            }
            Text {
                id: text3
                text: qsTr("w - wybierz brak drużyny")
                font.pixelSize: parent.width / 15
            }
            Text {
                id: text4
                text: qsTr("e - wybierz prawą drużynę")
                font.pixelSize: parent.width / 15
            }
            Text {
                id: text5
                text: qsTr("1-5 - odsłoń odpowiedź")
                font.pixelSize: parent.width / 15
            }
            Text {
                id: text6
                text: qsTr("x - błędna odpowiedź")
                font.pixelSize: parent.width / 15
            }
            Text {
                id: text7
                text: qsTr("a - poprzednie pytanie")
                font.pixelSize: parent.width / 15
            }
            Text {
                id: text8
                text: qsTr("d - następne pytanie")
                font.pixelSize: parent.width / 15
            }
        }
    }
}
