import QtQuick 2.0
import QtQuick.Window 2.1
import QtWebKit 3.0

Window
{
	id: root
	width: 800
	height: 600

	/* Without this line, we won't ever see the window... */
	Component.onCompleted: root.visible = true;

	Connections {
		target: application // this is luna-qml-launcher C++ object instance
		onRelaunched: console.log("The browser has been relaunched with parameters: " + parameters);
	}

	MenuButton {
		id: mainMenuButton
		anchors.top: parent.top
		anchors.left: parent.left
		width: 30
		height: 30
	}
	TabBar {
		id: mainTabBar
		anchors.top: parent.top
		anchors.left: mainMenuButton.right
		width: parent.width - mainMenuButton.width
		height: 30
	}

	WebView {
		id: webViewItem
		anchors.top: parent.top
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		anchors.right: parent.right

		url: "http://www.openmobl.com/"
	}
}
