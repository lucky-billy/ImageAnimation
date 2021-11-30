import QtQuick 2.12
import "./function.js" as JSFunction

// 轮辐与扇形
Rectangle {
    color: "#858585"

    Column {
        x: 20; y: 20
        spacing: 20

        Row {
            spacing: 20

            ShaderEffect {
                width: 480; height: 270

                property int dir: 0         // 顺时针
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/22.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Spoke_fragmentShader")
            }

            ShaderEffect {
                width: 480; height: 270

                property int dir: 1         // 逆时针
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/23.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Spoke_fragmentShader")
            }
        }

        Row {
            spacing: 20

            ShaderEffect {
                width: 480; height: 270

                property int dir: 2         // 扇形-横
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/24.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Spoke_fragmentShader")
            }

            ShaderEffect {
                width: 480; height: 270

                property int dir: 3         // 扇形-竖
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/28.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Spoke_fragmentShader")
            }
        }
    }
}
