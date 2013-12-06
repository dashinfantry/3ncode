/*
  ** 3encode version 3.0
  **
  ** by Leszek Lesner
  ** released under the terms of BSD
  **
  ** Copyright (c) 2013, Leszek Lesner
  ** All rights reserved.
  **
  ** Redistribution and use in source and binary forms, with or without modification,
  ** are permitted provided that the following conditions are met:
  **
  ** Redistributions of source code must retain the above copyright notice,
  ** this list of conditions and the following disclaimer.
  ** Redistributions in binary form must reproduce the above copyright notice,
  ** this list of conditions and the following disclaimer in the documentation
  ** and/or other materials provided with the distribution.
  ** Neither the name of the <ORGANIZATION> nor the names of its contributors
  ** may be used to endorse or promote products derived from this software without
  ** specific prior written permission.
  **
  ** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ** ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  ** WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
  ** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
  ** INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  ** (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  ** LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ** ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  ** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  ** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  **/

import QtQuick 1.1

Rectangle {
    id: convertAnimPage
    width: parent.width -(parent.width/8)
    height: 250
    anchors.centerIn: parent
    color: "#C4BDBB"
    border.color: "blue"
    border.width: 1
    radius: 8
    z:100  // Above all

    function animationStart() {
        animate.start()
    }
    function animationStop() {
        animate.stop()
    }

    Image {
        id: animLogo
        source: "img/convert.png"
        anchors.centerIn: parent
        height: 128
        width: 128
    }
    Text {
        id: animText
        anchors.top: animLogo.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
        text: "Encoding ..."
    }

    ParallelAnimation {
        id: animate
        NumberAnimation {
            target: animLogo
            properties: "rotation"
            from: 0
            to: 360
            loops: Animation.Infinite
            duration: 1500
            //easing {type: Easing.OutBack; overshoot: 500}
        }
        SequentialAnimation {
            PropertyAction { target: animText; property: "text"; value: "Encoding" }
            // Just a useless numberanimation for duration pause in text animation
            NumberAnimation { target: animText; property: "anchors.topMargin"; to: 15; duration: 1500 }
            PropertyAction { target: animText; property: "text"; value: "Encoding ." }
            NumberAnimation { target: animText; property: "anchors.topMargin"; to: 15; duration: 1500 }
            PropertyAction { target: animText; property: "text"; value: "Encoding .." }
            NumberAnimation { target: animText; property: "anchors.topMargin"; to: 15; duration: 1500 }
            PropertyAction { target: animText; property: "text"; value: "Encoding ..." }
            NumberAnimation { target: animText; property: "anchors.topMargin"; to: 15; duration: 1500 }
            loops: Animation.Infinite
        }
    }

}
