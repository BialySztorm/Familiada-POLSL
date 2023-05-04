
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import Familiada

Item {
    id: screen02
    Rectangle {
        id: rectangle
        width: parent.width
        height: parent.height

        color: Constants.backgroundColor

        GridLayout {
            id: grid
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 2
            Text {
                id: screenTitleText
                Layout.columnSpan: 2
                text: qsTr("Settings")
                font.pixelSize: 40
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
            Text {
                id: musicVolumeText
                text: qsTr("Music Volume")
                font.pixelSize: 12
            }
            Slider {
                id: musicVolumeSlider
                value: 0.5
            }
            Text {
                id: sfxVolumeText
                text: qsTr("Effects Volume")
                font.pixelSize: 12
            }
            Slider {
                id: sfxVolumeSlider
                value: 0.5
            }
            Text {
                id: languageText
                text: qsTr("Language")
                font.pixelSize: 12
            }
            ComboBox {
                id: languageComboBox
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
        }

        Button {
            id: button
            x: 0
            y: 0
            text: qsTr("Return to menu")
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.width / 20
            anchors.rightMargin: parent.width / 20
            Connections {
                target: button
                onClicked: root.changeState("screen1")
            }
        }
    }
}
