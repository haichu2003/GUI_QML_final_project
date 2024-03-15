// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.5
import QtQuick.Controls
import Car_Dashboard

Window {
    width: 1600
    height: 800

    visible: true
    title: "Car_Dashboard"

    Rectangle {
        id: root
        anchors.fill: parent
        // color: "lightblue"
        property int current_screen: 1
        state: "off"

        // the actual component
        Rectangle {
            id: main_screen
            width: parent.width
            height: parent.height
            x: parent.width - width
            SwipeView {
                id: view
                currentIndex: current_screen
                width: parent.width
                height: parent.height
                x: parent.width - width
                property Gradient on: Gradient {
                    GradientStop {
                        id: grad1
                        position: 0.1
                        color: "black"
                    }
                    GradientStop {
                        id: grad2
                        position: 1
                        color: "black"
                    }
                }

                Item {
                    // the actual component
                    Rectangle {
                        id: speedometer
                        width: parent.width * 0.8 - 20
                        height: parent.height - 20
                        x: parent.width - width - 10
                        y: 10
                        radius: width * 0.05
                        // color: "black"
                        gradient: view.on
                        Image {
                            id: speedometerClock
                            source: "images/speedo.png"
                            width: parent.width / 2
                            height: parent.width / 2
                            y: (parent.height - width) / 2
                            Image {
                                id: speedometerNeedle
                                source: "images/needlered.png"
                                anchors.centerIn: parent
                                height: parent.width * 0.4
                                anchors.verticalCenterOffset: -height / 2
                                rotation: -137
                                transformOrigin: Image.Bottom

                                RotationAnimation {
                                    id: speedometerSpin
                                    target: speedometerNeedle
                                    property: "rotation"
                                    // from: -137
                                    to: 140
                                    duration: 1000
                                    running: false
                                    easing.type: Easing.Linear
                                }

                                RotationAnimation {
                                    id: speedometerSpinBack
                                    target: speedometerNeedle
                                    property: "rotation"
                                    to: -137
                                    duration: 1000
                                    running: false
                                    easing.type: Easing.OutQuad
                                }
                            }
                        }
                        Image {
                            id: tachometerClock
                            source: "images/speedo.png"
                            width: parent.width / 2
                            height: parent.width / 2
                            y: (parent.height - width) / 2
                            x: parent.width / 2
                            Image {
                                id: tachometerNeedle
                                source: "images/needlered.png"
                                anchors.centerIn: parent
                                height: parent.width * 0.4
                                anchors.verticalCenterOffset: -height / 2
                                rotation: -137
                                transformOrigin: Image.Bottom

                                RotationAnimation {
                                    id: tachometerSpin
                                    target: tachometerNeedle
                                    property: "rotation"
                                    // from: -137
                                    to: 80
                                    duration: 2000
                                    running: false
                                    easing.type: Easing.Linear
                                }

                                RotationAnimation {
                                    id: tachometerSpinBack
                                    target: tachometerNeedle
                                    property: "rotation"
                                    to: -100
                                    duration: 2000
                                    running: false
                                    easing.type: Easing.OutQuad
                                }

                                RotationAnimation {
                                    id: tachometerSpinStart
                                    target: tachometerNeedle
                                    property: Rotation
                                    to: -117
                                    duration: 1000
                                    running: false
                                    easing.type: Easing.OutQuad
                                }

                                RotationAnimation {
                                    id: tachometerSpinStop
                                    target: tachometerNeedle
                                    property: Rotation
                                    to: -137
                                    duration: 1000
                                    running: false
                                    easing.type: Easing.OutQuad
                                }
                            }
                        }
                    }
                }
                Item {
                    Rectangle {
                        width: parent.width * 0.8 - 20
                        height: parent.height - 20
                        x: parent.width - width - 10
                        y: 10
                        radius: width * 0.05
                        color: "lightgray"
                        Rectangle {
                            width: parent.width * 0.25
                            height: parent.width * 0.25
                            x: (parent.width - width) / 2
                            y: (parent.height - height) / 2
                            radius: width * 0.1
                            color: "lightgray"
                            Rectangle {
                                id: x1y1
                                width: parent.width * 0.5
                                height: parent.width * 0.5
                                radius: width * 0.5
                                color: "lightgray"
                                Image {
                                    source: "images/seatbeltindicator.png"
                                    width: parent.width
                                    height: parent.width
                                }
                            }
                            Rectangle {
                                id: x1y2
                                width: parent.width * 0.5
                                height: parent.width * 0.5
                                x: width
                                radius: width * 0.5
                                color: "lightgray"
                                Image {
                                    source: "images/seatbeltindicator.png"
                                    width: parent.width
                                    height: parent.width
                                }
                            }

                            Rectangle {
                                id: x2y1
                                width: parent.width * 0.5
                                height: parent.width * 0.5
                                y: height
                                radius: width * 0.5
                                color: "lightgray"
                                Image {
                                    source: "images/seatbeltindicator.png"
                                    width: parent.width
                                    height: parent.width
                                }
                            }

                            Rectangle {
                                id: x2y2
                                width: parent.width * 0.5
                                height: parent.width * 0.5
                                x: width
                                y: height
                                radius: width * 0.5
                                color: "lightgray"
                                Image {
                                    source: "images/seatbeltindicator.png"
                                    width: parent.width
                                    height: parent.width
                                }
                            }
                        }
                    }
                }
            }

            PageIndicator {
                id: indicator
                count: view.count
                currentIndex: view.currentIndex
                anchors.bottom: view.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        // controller
        Rectangle {
            id: controller
            width: parent.width * 0.2 - 20
            height: parent.height - 20
            y: 10
            x: 10
            radius: speedometer.width * 0.05
            color: "lightgrey"
            Button {
                id: start_engine
                text: root.state === "on" ? "Stop" : "Start"
                x: parent.width - width - 40
                y: parent.height - height - 40
                onClicked: {
                    if (root.state === "on") {
                        root.state = "off"
                        speedometerSpinBack.running = true
                        tachometerSpinStop.running = true
                        // speedometer.gradient = view.off
                        x1y1.color = "lightgray"
                        x1y2.color = "lightgray"
                        x2y1.color = "lightgray"
                        x2y2.color = "lightgray"
                    } else if(root.state === "off") {
                        root.state = "on"
                        tachometerSpinStart.running = true
                        x1y1.color = "orange"
                        x1y2.color = "orange"
                        x2y1.color = "orange"
                        x2y2.color = "orange"
                        // speedometer.gradient = view.on
                    }
                }
            }

            Button {
                id: accel
                text: "Gas"
                x: 30
                y: parent.height * 3 / 4
                onPressed: {
                    if (root.state === "on") {
                        tachometerSpin.running = true
                        tachometerSpinBack.running = false
                        speedometerSpinBack.running = false
                        speedometerSpin.running = true
                    }
                }
                onReleased: {
                    if (root.state === "on") {
                        speedometerSpin.running = false;
                        tachometerSpin.running = false;
                    }
                }
            }

            Button {
                id: brake
                text: "brake"
                x: parent.width - width - 40
                y: parent.height * 3 / 4
                onPressed: {
                    if (root.state === "on") {
                        tachometerSpinBack.running = true
                        tachometerSpin.running = false
                        speedometerSpinBack.running = true
                        speedometerSpin.running = false
                    }
                }
                onReleased: {
                    if (root.state === "on") {
                        tachometerSpinBack.running = false;
                        speedometerSpinBack.running = false;
                    }
                }
            }
            Button {
                id: seatbelt_11
                text: "fasten"
                x: 40
                y: 50
                onClicked: {
                    if (root.state === "on") {
                        if (text === "fasten") {
                            text = "undo"
                            x1y1.color = "lightgray"
                        } else {
                            text = "fasten"
                            x1y1.color = "orange"
                        }
                    }
                }
            }
            Button {
                id: seatbelt_12
                text: "fasten"
                x: parent.width - width - 40
                y: 50
                onClicked: {
                    if (root.state === "on") {
                        if (text === "fasten") {
                            text = "undo"
                            x1y2.color = "lightgray"
                        } else {
                            text = "fasten"
                            x1y2.color = "orange"
                        }
                    }
                }
            }
            Button {
                id: seatbelt_21
                text: "fasten"
                x: 40
                y: height * 1.5 + 50
                onClicked: {
                    if (root.state === "on") {
                        if (text === "fasten") {
                            text = "undo"
                            x2y1.color = "lightgray"
                        } else {
                            text = "fasten"
                            x2y1.color = "orange"
                        }
                    }
                }
            }
            Button {
                id: seatbelt_22
                text: "fasten"
                x: parent.width - width - 40
                y: height * 1.5 + 50
                onClicked: {
                    if (root.state === "on") {
                        if (text === "fasten") {
                            text = "undo"
                            x2y2.color = "lightgray"
                        } else {
                            text = "fasten"
                            x2y2.color = "orange"
                        }
                    }
                }
            }
        }

        states: [
            State {
                name: "off"
                PropertyChanges {
                    target: grad2
                    color: "black"
                }
            },
            State {
                name: "on"
                PropertyChanges {
                    target: grad2
                    color: "lightblue"
                }
            }
        ]
        transitions: Transition {
            from: "*"
            to: "*"
            PropertyAnimation {
                target: grad2
                properties: "color"
                duration: 1000
            }
        }
    }
}

