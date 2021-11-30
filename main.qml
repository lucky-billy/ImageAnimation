import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    width: 1200; height: 900
    title: qsTr("Image Processing Demo")
    visible: true

    // Module Bar
    ListView {
        x: 5
        width: 100; height: parent.height - 10
        anchors.verticalCenter: parent.verticalCenter
        boundsBehavior: Flickable.StopAtBounds
        spacing: 10
        clip: true

        ScrollBar.vertical: ScrollBar { policy: ScrollBar.AsNeeded }

        model: ListModel {
            // 基础
            ListElement { effectName: "百叶窗与棋盘" }
            ListElement { effectName: "劈裂" }
            ListElement { effectName: "溶解" }
            ListElement { effectName: "方盒与圆盒" }
            ListElement { effectName: "菱形扩展" }
            ListElement { effectName: "十字扩展" }
            ListElement { effectName: "轮辐与扇形" }
            ListElement { effectName: "对角线" }

            // 炫酷
            ListElement { effectName: "随机线条" }
            ListElement { effectName: "伸展" }
            ListElement { effectName: "渐变缩放" }
            ListElement { effectName: "渐变回旋" }
            ListElement { effectName: "上升" }
            ListElement { effectName: "压缩" }
            ListElement { effectName: "弹跳" }
            ListElement { effectName: "放大" }
            ListElement { effectName: "飞旋" }
            ListElement { effectName: "浮动" }
            ListElement { effectName: "光速" }
            ListElement { effectName: "螺旋飞入" }
            ListElement { effectName: "投掷" }
            ListElement { effectName: "风车" }
            ListElement { effectName: "线性" }
            ListElement { effectName: "飞机" }
        }

        delegate: Component {
            Button {
                text: effectName
                onClicked: changeIndex(model.index + 1)
            }
        }
    }

    // Separator line - portrait
    Rectangle {
        x: 110
        width: 4; height: parent.height - 10
        radius: 4
        anchors.verticalCenter: parent.verticalCenter
        color: "#707070"
    }

    // StackView
    StackView {
        id: stack
        x: 119
        width: 1200 - 119 - 5; height: parent.height - 10
        anchors.verticalCenter: parent.verticalCenter

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 10
            }
        }

        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 10
            }
        }

        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 10
            }
        }

        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 10
            }
        }
    }

    function changeIndex(pageID) {
        stack.clear()

        switch ( pageID )
        {
        case 1: stack.push("./Content/Blinds.qml"); break;
        case 2: stack.push("./Content/Splitting.qml"); break;
        case 3: stack.push("./Content/Dissolution.qml"); break;
        case 4: stack.push("./Content/Box.qml"); break;
        case 5: stack.push("./Content/Diamond.qml"); break;
        case 6: stack.push("./Content/CrossStars.qml"); break;
        case 7: stack.push("./Content/Spoke.qml"); break;
        case 8: stack.push("./Content/Ladder.qml"); break;

        case 9: stack.push("./Content/Line.qml"); break;
        case 10: stack.push("./Content/Stretch.qml"); break;
        case 11: stack.push("./Content/GradientScaling.qml"); break;
        case 12: stack.push("./Content/GradientGyration.qml"); break;
        case 13: stack.push("./Content/Rise.qml"); break;
        case 14: stack.push("./Content/Compress.qml"); break;
        case 15: stack.push("./Content/Bounce.qml"); break;
        case 16: stack.push("./Content/Enlarge.qml"); break;
        case 17: stack.push("./Content/Whirling.qml"); break;
        case 18: stack.push("./Content/Float.qml"); break;
        case 19: stack.push("./Content/LightSpeed.qml"); break;
        case 20: stack.push("./Content/SpiralFlight.qml"); break;
        case 21: stack.push("./Content/Throw.qml"); break;
        case 22: stack.push("./Content/Windmill.qml"); break;
        case 23: stack.push("./Content/Linear.qml"); break;
        case 24: stack.push("./Content/Aircraft.qml"); break;
        }

        // Keep the sub interface the same width and height as stackview
        stack.currentItem.width = stack.width
        stack.currentItem.height = stack.height
    }
}
