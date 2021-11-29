import QtQuick 2.12
import "./function.js" as JSFunction

// 百叶窗与棋盘
Rectangle {
    color: "#858585"

    Column {
        x: 20; y: 20
        spacing: 20

        Row {
            spacing: 20

            ShaderEffect {
                width: 480; height: 270

                property int dir: 0         // 从左往右
                property int rows: 1        // 行数
                property int cols: 5        // 列数
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/1.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Blinds_fragmentShader")
            }

            ShaderEffect {
                width: 480; height: 270

                property int dir: 1         // 从右往左
                property int rows: 10       // 行数
                property int cols: 10       // 列数
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/1.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Blinds_fragmentShader")
            }
        }

        Row {
            spacing: 20

            ShaderEffect {
                width: 480; height: 270

                property int dir: 2         // 从上往下
                property int rows: 5        // 行数
                property int cols: 1        // 列数
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/1.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Blinds_fragmentShader")
            }

            ShaderEffect {
                width: 480; height: 270

                property int dir: 3         // 从下往上
                property int rows: 10       // 行数
                property int cols: 10       // 列数
                property int percent: 0     // 百分比

                // 图像
                property ShaderEffectSource effectSource: ShaderEffectSource {
                    hideSource: true
                    sourceItem: Image {
                        sourceSize: Qt.size(480, 270)
                        source: "file:///D:/Qt/ImageAnimation/Image/1.jpg"
                        fillMode: Image.Tile
                    }
                }

                // 动画 - 通过控制百分比实现特效
                NumberAnimation on percent { from: 0; to: 100; duration: 1000; running: true }

                // 片段着色器
                fragmentShader: JSFunction.getShader("Blinds_fragmentShader")
            }
        }
    }
}
