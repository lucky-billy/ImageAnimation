import QtQuick 2.12
import "./function.js" as JSFunction

// 溶解
Rectangle {
    color: "#858585"

    ShaderEffect {
        x: 20; y: 20
        width: 480; height: 300

        property int percent: 0     // 百分比

        // 图像
        property ShaderEffectSource effectSource: ShaderEffectSource {
            hideSource: true
            sourceItem: Image {
                sourceSize: Qt.size(430, 300)
                source: "file:///D:/Qt/ImageAnimation/Image/4.jpg"
                fillMode: Image.Tile
            }
        }

        // 迷雾
        property ShaderEffectSource dissolutionSource: ShaderEffectSource {
            hideSource: true
            sourceItem: Image {
                sourceSize: Qt.size(480, 270)
                source: "file:///D:/Qt/ImageAnimation/Image/Dissolution.jpg"
                fillMode: Image.Tile
            }
        }

        // 动画 - 通过控制百分比实现特效
        NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

        // 片段着色器
        fragmentShader: JSFunction.getShader("Dissolution_fragmentShader")
    }
}
