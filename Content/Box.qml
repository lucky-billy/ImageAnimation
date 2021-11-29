import QtQuick 2.12
import "./function.js" as JSFunction

// 方盒与圆盒
Rectangle {
    color: "#858585"

    Column {
        x: 20; y: 20
        spacing: 20

        Row {
            spacing: 20

            ShaderEffect {
                width: 480; height: 300

                property int dir: 0         // 方盒从里往外
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/5.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Box_fragmentShader")
            }

            ShaderEffect {
                width: 480; height: 300

                property int dir: 1         // 方盒从外往里
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/6.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Box_fragmentShader")
            }
        }

        Row {
            spacing: 20

            ShaderEffect {
                width: 480; height: 300

                property int dir: 2         // 圆盒从里往外
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/8.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Box_fragmentShader")
            }

            ShaderEffect {
                width: 480; height: 300

                property int dir: 3         // 圆盒从外往里
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/9.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Box_fragmentShader")
            }
        }
    }
}
