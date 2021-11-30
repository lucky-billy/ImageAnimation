import QtQuick 2.12
import "./function.js" as JSFunction

// 菱形扩展
Rectangle {
    color: "#858585"

    Column {
        x: 20; y: 20
        spacing: 20

        ShaderEffect {
            width: 640; height: 360

            property int dir: 0         // 左右往中间
            property int percent: 0     // 百分比

            // 图像
            property ShaderEffectSource effectSource: ShaderEffectSource {
                hideSource: true
                sourceItem: Image {
                    sourceSize: Qt.size(480, 270)
                    source: "file:///D:/Qt/ImageAnimation/Image/17.jpg"
                    fillMode: Image.Tile
                }
            }

            // 动画 - 通过控制百分比实现特效
            NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

            // 片段着色器
            fragmentShader: JSFunction.getShader("Diamond_fragmentShader")
        }

        ShaderEffect {
            width: 640; height: 360

            property int dir: 1         // 中间往左右
            property int percent: 0     // 百分比

            // 图像
            property ShaderEffectSource effectSource: ShaderEffectSource {
                hideSource: true
                sourceItem: Image {
                    sourceSize: Qt.size(480, 270)
                    source: "file:///D:/Qt/ImageAnimation/Image/18.jpg"
                    fillMode: Image.Tile
                }
            }

            // 动画 - 通过控制百分比实现特效
            NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

            // 片段着色器
            fragmentShader: JSFunction.getShader("Diamond_fragmentShader")
        }
    }
}
