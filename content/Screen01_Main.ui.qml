
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts 1.3
import Familiada

Item {
    id: screen1



    Rectangle {
        id: rectangle
        width: parent.width
        height: parent.height
        color: Constants.backgroundColor

        Button {
            id: startBtn
            text: qsTr("Start Game")
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: parent.width / 50
            anchors.bottomMargin: parent.width / 50
            font.pointSize: parent.width / 50

            Connections {
                target: startBtn
                onClicked: root.changeState("screen3")
            }
        }
        Button {
            id: optionsBtn
            text: qsTr("Options")
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.width / 50
            anchors.rightMargin: parent.width / 50
            font.pointSize: parent.width / 50

            Connections {
                target: optionsBtn
                onClicked: root.changeState("screen2")
            }
        }
    }
}
