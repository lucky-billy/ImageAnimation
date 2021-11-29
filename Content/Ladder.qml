import QtQuick 2.12
import "./function.js" as JSFunction

// 对角线
Rectangle {
    color: "#858585"

    Column {
        x: 20; y: 20
        spacing: 20

        Row {
            spacing: 20

            ShaderEffect {
                width: 480; height: 270

                property int dir: 0         // 左上角
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/10.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Ladder_fragmentShader")
            }

            ShaderEffect {
                width: 480; height: 270

                property int dir: 1         // 右上角
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/11.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Ladder_fragmentShader")
            }
        }

        Row {
            spacing: 20

            ShaderEffect {
                width: 480; height: 270

                property int dir: 2         // 左下角
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/12.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Ladder_fragmentShader")
            }

            ShaderEffect {
                width: 480; height: 270

                property int dir: 3         // 右下角
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/13.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Ladder_fragmentShader")
            }
        }
    }
}
