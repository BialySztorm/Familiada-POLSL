

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import Familiada

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    Column {
        id: column1
        width: 400
        height: 400
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: text1
            text: qsTr("Tittle")
            font.pixelSize: 30
        }
        Text {
            id: text2
            text: qsTr("Joke")
            font.pixelSize: 30
        }
        Text {
            id: text3
            text: qsTr("Author")
            anchors.right: parent.right
            font.pixelSize: 30
            anchors.rightMargin: parent.width / 50
        }
    }
}
