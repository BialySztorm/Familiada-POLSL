
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
        color: "#000000"

        GridLayout {
            id: grid
            anchors.verticalCenter: parent.verticalCenter
            rowSpacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 2
            Text {
                id: screenTitleText
                color: "#ffffff"
                Layout.columnSpan: 2
                text: qsTr("Settings")
                font.pixelSize: 40
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
            Text {
                id: musicVolumeText
                color: "#ffffff"
                text: qsTr("Music Volume")
                font.pointSize: parent.parent.width / 50
            }
            Slider {
                id: musicVolumeSlider
                value: 0.5
                onMoved: player.audioOutput.volume = this.value
            }
            Text {
                id: sfxVolumeText
                color: "#ffffff"
                text: qsTr("Effects Volume")
                font.pixelSize: parent.parent.width / 50
            }
            Slider {
                id: sfxVolumeSlider
                value: 1
                onMoved: player1.audioOutput.volume = this.value
            }
            Text {
                id: languageText
                visible: false
                color: "#ffffff"
                text: qsTr("Language")
                font.pixelSize: parent.parent.width / 50
            }
            ComboBox {
                id: languageComboBox
                visible: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
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
