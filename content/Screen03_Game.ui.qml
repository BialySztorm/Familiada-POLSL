

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

        Text {
            id: text1
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            width: 228
            height: 146
            text: qsTr("Game")
            font.pixelSize: 60
        }
    }
}
