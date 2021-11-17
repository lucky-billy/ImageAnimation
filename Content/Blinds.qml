import QtQuick 2.0

// 百叶窗
Rectangle {
    color: "#858585"

    Image {
        id: sourceImage1
        x: 20; y: 20
        sourceSize: Qt.size(480, 270)
        source: "file:///D:/Qt/ImageAnimation/Image/1.jpg"
        smooth: true
    }

    Image {
        id: sourceImage2
        x: 520; y: 20
        sourceSize: Qt.size(480, 270)
        source: "file:///D:/Qt/ImageAnimation/Image/1.jpg"
        smooth: true
    }

    Image {
        id: sourceImage3
        x: 20; y: 310
        sourceSize: Qt.size(480, 270)
        source: "file:///D:/Qt/ImageAnimation/Image/1.jpg"
        smooth: true
    }

    Image {
        id: sourceImage4
        x: 520; y: 310
        sourceSize: Qt.size(480, 270)
        source: "file:///D:/Qt/ImageAnimation/Image/1.jpg"
        smooth: true
    }
}
