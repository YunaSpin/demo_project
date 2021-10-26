<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <style>
        :root {
            /* Fixed colors that don't get transition/animation */
            --dark-cosmos-color: hsl(290, 34%, 10%);
            --star-color: hsl(272, 57%, 95%);
            --t-sun-color: hsl(47, 100%, 88%);
            --t-moon-color: hsl(274, 93%, 94%);
            --t-moon-pattern-color: hsl(274, 58%, 89%);

            --sunsys-color: hsl(41, 99%, 75%);
            --sunsys-patterns-color: hsl(33, 95%, 73%);
            --earth-water-color: hsl(202, 62%, 74%);
            --earth-continent-color: hsl(192, 34%, 64%);

            /* colorz  that will change on transition */
            --circle-bg-color: hsl(28, 97%, 70%);
            --cactus-body-color: hsl(337, 43%, 28%);
            --cactus-flower-color: hsl(348, 80%, 62%);
            --mountain-color: hsl(346, 43%, 50%);
            --sand-01-color: hsl(339, 55%, 30%);
            --sand-02-color: hsl(335, 62%, 37%);
            --sand-03-color: hsl(338, 53%, 38%);
            --sand-04-color: hsl(336, 46%, 50%);


            /* The poster Illustration colors */
            --poster: hsl(25, 43%, 79%);
            --poster-border: min(3vmax, 50px);


            /* animation and transition timings */
            --t-slow: 2500ms;
            --t-med: 1500ms;
            --t-fast: 1000ms;
            --t-delay-motionpath: 400ms;
            --t-delay-colorfades: 200ms;

            --a-scale-from: scale(1);
            --a-scale-to: scale(1.05);

        }


        /* Sass vars */

        $mq-small: 650px;
        $mq-medium: 850px;
        $mq-vert-small: 650px;

        /* CSS solar system animation */
        .sun-system-bg,
        .sun-system-shadow-01,
        .sun-system-shadow-02 {
            fill: var(--sunsys-color);
        }

        .sun-system-shadow-01,
        .sun-system-shadow-02 {
            opacity: 0.1;
        }

        .sun-system-patterns {
            fill: var(--sunsys-patterns-color);
        }

        .earth-continent {
            fill: var(--earth-continent-color);
        }

        .earth-water,
        .earth-shadow-01,
        .earth-shadow-02 {
            fill: var(--earth-water-color);
        }
        .earth-shadow-01,
        .earth-shadow-02 {
            opacity: 0.15;
        }

        .astral-paths {
            fill: none;
            stroke: var(--star-color);
            stroke-miterlimit: 10;
            stroke-width: 2px;
            stroke-dasharray: 10 10;
            opacity: 0.5;
        }

        /* Solar System Animations */

        /* moon around the earth */
        .system-moonlight {
            offset-path: path(
                    "M536.21,257.25a163.79,163.79 0 1,0 327.58,0a163.79,163.79 0 1,0 -327.58,0"
            ); /* convert circle to path http://complexdan.com/svg-circleellipse-to-path-converter/ */
            offset-distance: 100%;
            transform-origin: 700px 92px;
        }

        /* Earth around the sun */
        .system-earth-moon-container {
            transform-origin: 700px 700px;
        }

        /* animating the sun in the system */
        .system-sun {
        .sun-system-shadow-01 {
            transform-origin: 700px 700px;
        }
        .sun-system-shadow-02 {
            transform-origin: 700px 700px;
        }
        }



        @media (prefers-reduced-motion: no-preference) {
            /* Moon around the earth */
            .system-moonlight {
                animation: AstralRotation 21s infinite linear;
            }

            /* moon path rotation */
            .moon-path {
                transform-origin: 700px 257px;
                animation: 21s linear infinite Rotation;
            }

            /* planet rotation */
            .planet {
                transform-origin: 700px 255px;
                animation: 3s linear infinite Rotation;
            }

            /* earth rings pulsing */
            .earth-shadow-01 {
                transform-origin: 700px 255px;
                animation: 2s linear infinite Pulsing;
            }
            .earth-shadow-02 {
                --a-scale-from: scale(1.05);
                --a-scale-to: scale(1);
                transform-origin: 700px 255px;
                animation: 2s linear infinite Pulsing;
            }

            /* Earth around the sun */
            .system-earth-moon-container {
                animation: 72s linear infinite Rotation;
            }
            /* earth path rotation */
            .earth-path {
                transform-origin: 700px 700px;
                animation: 72s linear infinite Rotation;
            }

            /* moon rings animation */
            .system-earth-moon {
            .moon-shadow-02 {
                --a-scale-from: scale(1.1);
                --a-scale-to: scale(1);
                transform-origin: 700px 92px;
                animation: 2s linear infinite Pulsing;
            }

            .moon-shadow-01 {
                --a-scale-from: scale(1.1);
                --a-scale-to: scale(1);
                transform-origin: 700px 92px;
                animation: 2s linear infinite Pulsing;
            }
        }

        /* animating the sun in the system */
        .system-sun {
        .shadow-01-container {
            transform-origin: 700px 700px;
            animation: 60s linear infinite Rotation;
        }
        .shadow-02-container {
            transform-origin: 700px 700px;
            animation: 80s linear infinite Rotation;
        }

        .sun-system-shadow-01 {
            animation: 4s linear infinite OpacityRipple;
        }
        .sun-system-shadow-02 {
            --a-scale-from: scale(1.1);
            --a-scale-to: scale(1.01);
            animation: 4s linear infinite OpacityRipple;
        }
        }
        }

        #div1 {
            width: 90%;
            height: 100px;
            border: #222831;
            margin: auto;
        }
        #input1 {
            width: 200px;
            height: 50px;
            margin-top: 50px;
            margin-left: 550px;
            border: 1px saddlebrown;
        }

        @media (prefers-reduced-motion: reduce) {
            .system-moonlight {
                animation: AstralRotation 280s infinite linear;
            }

            /* moon path rotation */
            .moon-path {
                transform-origin: 700px 257px;
                animation: 280s linear infinite Rotation;
            }

            /* Earth around the sun */
            .system-earth-moon-container {
                animation: 600s linear infinite Rotation;
            }

            /* animating the sun in the system */
            .system-sun {
            .sun-system-shadow-01 {
                --a-scale-from: scale(1);
                --a-scale-to: scale(1);
                animation: 10s linear infinite OpacityRipple 2s;
            }
            .sun-system-shadow-02 {
                --a-scale-from: scale(1);
                --a-scale-to: scale(1);
                animation: 10s linear infinite OpacityRipple;
            }
        }
        }

        /* all the keyframes */

        @keyframes Pulsing {
            0% {
                transform: var(--a-scale-from);
            }
            50% {
                transform: var(--a-scale-to);
            }
            100% {
                transform: var(--a-scale-from);
            }
        }

        @keyframes OpacityRipple {
            0% {
                transform: var(--a-scale-from);
                opacity: 0.1;
            }
            50% {
                transform: var(--a-scale-to);
                opacity: 0.18;
            }
            100% {
                transform: var(--a-scale-from);
                opacity: 0.1;
            }
        }

        @keyframes Rotation {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        @keyframes AstralRotation {
            to {
                offset-distance: 0%;
            }
        }

        /* This is the code for the CSS transition demo */

        .svg-mask-transition {
            clip-path: url(#clip-path);
        }

        /* Colors that do not transition */
        .sun-center,
        .sun-shadow-01,
        .sun-shadow-02,
        .cloud {
            fill: var(--t-sun-color);
        }

        .sun-shadow-01 {
            opacity: 0.3;
        }

        .sun-shadow-02 {
            opacity: 0.2;
        }

        /* for both moons */

        .moon-center,
        .moon-shadow-01,
        .moon-shadow-02 {
            fill: var(--t-moon-color);
        }

        .moon-shadow-01 {
            opacity: 0.1;
        }

        .moon-shadow-02 {
            opacity: 0.1;
        }

        .moon-pattern {
            fill: var(--t-moon-pattern-color);
        }

        /* Colors that will transition */

        .circle-bg {
            fill: var(--circle-bg-color);
        }

        .cactus-body {
            fill: var(--cactus-body-color);
        }

        .cactus-flower {
            fill: var(--cactus-flower-color);
        }

        .mountain {
            fill: var(--mountain-color);
        }

        .sand-01 {
            fill: var(--sand-01-color);
        }

        .sand-02 {
            fill: var(--sand-02-color);
        }

        .sand-03 {
            fill: var(--sand-03-color);
        }

        .sand-04 {
            fill: var(--sand-04-color);
        }

        .moonlight {
            opacity: 0;
        }
        .rings {
        .shadow-01,
        .shadow-02 {
            opacity: 0.08;
        }
        }

        /* all the fill transitions */

        .circle-bg,
        .color-fade-transition {
            transition: fill var(--t-slow) ease-in-out var(--t-delay-colorfades);
        }

        /* stars transition */
        .star {
            fill: var(--star-color);
            opacity: 0;
            transition: opacity var(--t-med) ease-in-out var(--t-delay-colorfades);
        }

        /* Here we go, transition the scene colors on :hover, using the CSS vars to reset the colors for every one that gets a transition */

        .transition-scene:hover {

            /* recolor me tonight */
            --circle-bg-color: hsl(253, 36%, 51%);
            --cactus-body-color: hsl(282, 43%, 26%);
            --cactus-flower-color: hsl(278, 40%, 62%);
            --mountain-color: hsl(302, 36%, 37%);
            --sand-01-color: hsl(285, 43%, 28%);
            --sand-02-color: hsl(285, 45%, 34%);
            --sand-03-color: hsl(285, 47%, 35%);
            --sand-04-color: hsl(283, 43%, 42%);

        .color-fade-transition {
            transition: fill var(--t-fast) ease-in-out var(--t-delay-colorfades);
        }

        /* stars transition */
        .star {
            opacity: 1;
        }
        }

        /* Motion transitions for people who did not set reduced motion to reduce  */

        @media (prefers-reduced-motion: no-preference) {
            .sun {
                offset-path: path(
                        "M107.35,727.94A304.79,304.79,0,0,1-20,739.51a319.27,319.27,0,0,1-119.14-39.12A340.8,340.8,0,0,1-237,617.77a357.93,357.93,0,0,1-78.3-252.49,339.85,339.85,0,0,1,34-123.49,319.66,319.66,0,0,1,76.1-99.66A305.13,305.13,0,0,1-93.67,79.61,304.64,304.64,0,0,1,33.69,68a319.87,319.87,0,0,1,119.15,39.13,339.85,339.85,0,0,1,97.86,82.61A353.53,353.53,0,0,1,314,308.54a353.48,353.48,0,0,1,15,133.73A339.93,339.93,0,0,1,295,565.75a320.39,320.39,0,0,1-76.11,99.71,305.23,305.23,0,0,1-111.58,62.48m.24.77C277.76,676,370.59,487.7,315,308.25S76.25,26.08-93.91,78.84s-263,241-207.35,420.47,238.69,282.16,408.85,229.4Z"
                );
                offset-distance: 32%;
                transform-origin: 208px 103px;
                transition: offset-distance var(--t-med) cubic-bezier(0.215, 0.61, 0.355, 1)
                    /* easeOutCubic */ var(--t-delay-motionpath);
            }

            .cloud {
                opacity: 0.7;
                transition: transform var(--t-med) cubic-bezier(0.215, 0.61, 0.355, 1)
                    /* easeOutCubic */ var(--t-delay-motionpath);
            }

            .moonlight {
                offset-path: path(
                        "M675,101.23a304.55,304.55,0,0,1,98.23,81.88A319.33,319.33,0,0,1,829.83,295a341.1,341.1,0,0,1,10.78,127.62,357.92,357.92,0,0,1-123.18,233.9A339.81,339.81,0,0,1,606.1,719.84,319.59,319.59,0,0,1,481.81,736.5,306.56,306.56,0,0,1,260.48,619.93,319.71,319.71,0,0,1,203.89,508,339.94,339.94,0,0,1,193.11,380.4,358,358,0,0,1,316.29,146.51,340.05,340.05,0,0,1,427.61,83.2,320.47,320.47,0,0,1,551.93,66.51,305.23,305.23,0,0,1,675,101.23m.38-.71C517.75,17.5,319,85,231.45,251.21s-30.74,368.3,126.89,451.32,356.39,15.54,443.94-150.7S833,183.53,675.39,100.52Z"
                );
                offset-distance: 23%;
                transform-origin: 260px 430px;
                transition: all var(--t-fast) cubic-bezier(0.55, 0.055, 0.675, 0.19)
                /* easeInCubic */;
            }

            .transition-scene:hover {
            /* the motion path transitions */
            .sun {
                offset-distance: 43%;
                transition: offset-distance var(--t-fast)
                cubic-bezier(0.55, 0.055, 0.675, 0.19) /* easeInCubic */;
            }

            .cloud {
                transform: translateX(250px);
                transition: transform var(--t-fast) cubic-bezier(0.55, 0.055, 0.675, 0.19)
                /* easeInCubic */;
            }

            .moonlight {
                opacity: 1;
                offset-distance: 39%;
                transition: offset-distance var(--t-med) cubic-bezier(0.215, 0.61, 0.355, 1)
                    /* easeOutCubic */ var(--t-delay-motionpath);
            }
        }
        }

        /* Let's have cool color transitions for people who do not want motion instead :) */

        @media (prefers-reduced-motion: reduce) {
            .sun {
                opacity: 1;
            }

            .cloud {
                opacity: 0.7;
            }

            .sun,
            .cloud {
                transition: opacity var(--t-slow) linear var(--t-delay-motionpath);
            }

            .moonlight {
                transform: translate(-3%, -62%);
                transition: opacity var(--t-fast) linear;
            }

            /* Smooth color transition */

            .transition-scene:hover {
            .sun,
            .cloud {
                opacity: 0;
            }

            .sun,
            .cloud {
                transition: opacity var(--t-fast) linear;
            }

            .moonlight {
                opacity: 1;
                transition: opacity var(--t-slow) linear var(--t-delay-motionpath);
            }
        }
        }

        @media (prefers-reduced-motion: reduce) {
            .sun {
                opacity: 1;
            }

            .cloud {
                opacity: 0.7;
            }

            .sun,
            .cloud {
                transition: opacity var(--t-slow) linear var(--t-delay-motionpath);
            }

            .moonlight {
                transform: translate(0, -310px);
                transition: opacity var(--t-fast) linear;
            }

            /* Smooth color transition */

            .transition-scene:hover {
            .sun,
            .cloud {
                opacity: 0;
            }

            .sun,
            .cloud {
                transition: opacity var(--t-fast) linear;
            }

            .moonlight {
                opacity: 1;
                transition: opacity var(--t-slow) linear var(--t-delay-motionpath);
            }
        }
        }

        /* Let"s have some comets raining from the sky */

        .svg-defs {
            display: none;
        }

        .comet-rain {
            z-index: -1;
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            right: 0;
        // transform: scaleX(-1);
        }

        .comet-instance {
            height: auto;
            position: absolute;
            left: -10vw;
            top: -10vh;
            z-index: -1;
            transform: scaleX(-1);
        // right: -10vw;
        // top: -10vh;
            fill: url(#gradient);
        }

        .comet-01,
        .comet-03,
        .comet-04,
        .comet-06 {
            width: 5vmin;
        //transform: scale(0);
        }
        .comet-02,
        .comet-05 {
            width: 6vmin;
        //transform: scale(0);
        }

        @media (prefers-reduced-motion: no-preference) {
            .comet-instance {
                animation: MakeItRain 10s infinite;
            }

            .comet-01 {
                left: 30vw;
                animation-delay: 0ms;
            }

            .comet-02 {
                left: 57vw;
                animation-delay: 9s;
            }

            .comet-03 {
                left: 83vw;
                animation-delay: 6s;
            }

            .comet-04 {
                top: 13vh;
                animation-delay: 22s;
            }

            .comet-05 {
                top: 34vh;
                animation-delay: 5s;
            }

            .comet-06 {
                top: 67vh;
                animation-delay: 14s;
            }

            @keyframes MakeItRain {
                0% {
                    opacity: 0;
                    transform: scaleX(-1) translate(0, 0);
                }
                70% {
                    opacity: 0.4;
                    transform: scaleX(-1) translate(0, 0);
                }
                100% {
                    opacity: 1;
                    transform: scaleX(-1) translate(-101vw, 101vmax);
                }
            }
        }

        /* Layout */

        body {
            padding: 2em 2em 3em 2em;
            display: flex;
            gap: 60px;
            flex-direction: column;
            overflow-x: hidden;
            overflow-y: auto;

        @media (min-width: $mq-small) {
            overflow: hidden;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            gap: clamp(2vw, 300px, 5vw);
            height: 100vh;
            padding: 0 5vw;
        }

        @media (min-width: $mq-medium) {
            padding: 0 10vw;
            gap: clamp(5vw, 400px, 10vw);
        }
        }



        .solar-system-animation,
        .day-night-transition {
            position: relative;
            z-index: 100;
            border: var(--poster-border) solid;

            display: flex;
            flex-flow: column;
            justify-content: center;

        @media (min-width: $mq-small) {
            height: 50vh;
            width: 50%;
        }

        @media (min-width: $mq-medium) {
            height: 65vh;
            width: 50%;
            max-width: 600px;
            margin-top: 0;
        }

        @media (min-width: $mq-small) and (max-height: $mq-small) {
            --poster-border: 30px;
            border: var(--poster-border) solid;
            border-top: 8px solid;
            height: 80vh;
            width: 80vw;
        }
        }

        svg.animation-scene,
        svg.transition-scene {
            flex-basis: 100%;
            width: 100%;
            position: relative;
            margin: 1px auto;
            z-index: 1;
        }

        .explanation {
            margin-top: auto;
        }

        .day-night-transition,
        .solar-system-animation {
            border-color: var(--poster);
            z-index: 1;
            position: relative;

        .accent {
            color: var(--poster);
        }

        .heading,
        .explanation {
            background: var(--poster);
            box-shadow: 0 0 0px 1px var(--poster); //crapfixing that ugly pixel on chrome
        }

        &:before,
        &:after {
             content: "";
             pointer-events: none;
             position: absolute;
             top: calc(10px - var(--poster-border));
             left: calc(10px - var(--poster-border));
         }

        &:before {
             right: calc(0px - var(--poster-border));
             bottom: calc(0px - var(--poster-border));
             border-left: 3px solid var(--dark-cosmos-color);
             border-top: 3px solid var(--dark-cosmos-color);
             z-index: 2;

        @media (min-width: $mq-small) and (max-height: $mq-small) {
            top: calc(30px - var(--poster-border));
        }
        }

        &:after {
             z-index: 1;
             right: calc(0px - var(--poster-border) - 12px);
             bottom: calc(0px - var(--poster-border) - 12px);
             border-right: 3px solid var(--poster);
             border-bottom: 3px solid var(--poster);
             border-top: 3px solid var(--poster);
             border-left: 3px solid var(--poster);

        @media (min-width: $mq-small) and (max-height: $mq-small) {
            top: calc(30px - var(--poster-border));
        }
        }
        }

        .solar-system-animation {
            --poster: hsl(265, 38%, 89%);
        }

        .smallnumber {
            font-size: 0.8em;
            text-align: right;
            position: relative;
            top: calc(0px - var(--poster-border) + 25px);
            right: calc(0px - var(--poster-border) + 15px);

        @media (min-width: $mq-small) {
            font-size: 1em;
            top: calc(0px - var(--poster-border) + 20px);
            right: calc(0px - var(--poster-border) + 10px);
        }

        @media (min-width: $mq-medium) {
            font-size: 1.3em;
            top: calc(0px - var(--poster-border) + 30px);
            right: calc(0px - var(--poster-border) + 20px);
        }

        @media (min-width: $mq-small) and (max-height: $mq-small) {
            font-size: 1em;
            top: 7px;
            right: calc(0px - var(--poster-border) + 10px);
        }
        }

        h1,
        .smallnumber {
            font-family: "Archivo Black", sans-serif;
            margin: 0;
        }

        h1 {
            font-size: clamp(1.8em, 3vw, 3.2em);
            letter-spacing: -0.03em;
            margin-bottom: 0;
            margin-top: -0.3em;
            position: relative;
            bottom: -0.22em;

        @media (min-width: $mq-small) {
            bottom: -0.2em;
        }

        @media (min-width: $mq-small) and (max-height: $mq-small) {
            font-size: clamp(1.5em, 8vw, 2em);
        }
        }

        /* Explanation */

        .explanation {
            padding: 3vh 0;
            font-size: 1em;
            line-height: 1.3;
            border-bottom: 3px solid var(--dark-cosmos-color);
            position: relative;

        @media (min-width: $mq-medium) {

        &:before {
            content: "";
            position: absolute;
            top: -6vh;
            left: -1.2vh;
            width: 2vh;
            height: 5vh;
            background-repeat: no-repeat;
            background-size: 100%;
            background-image: url("data:image/svg+xml;base64,PCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDI0LjIuMSwgU1ZHIEV4cG9ydCBQbHVnLUluICAtLT4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMTYycHgiCgkgaGVpZ2h0PSIzMjYuN3B4IiB2aWV3Qm94PSIwIDAgMTYyIDMyNi43IiBzdHlsZT0ib3ZlcmZsb3c6dmlzaWJsZTtlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDE2MiAzMjYuNzsiIHhtbDpzcGFjZT0icHJlc2VydmUiPgo8c3R5bGUgdHlwZT0idGV4dC9jc3MiPgoJLnN0MHtmaWxsOmhzbCgyOTAsIDM0JSwgMTAlKTt9Cjwvc3R5bGU+CjxkZWZzPgo8L2RlZnM+CjxnPgoJPGNpcmNsZSBjbGFzcz0ic3QwIiBjeD0iODMiIGN5PSIyNzIuNCIgcj0iNTQuMyIvPgoJPGNpcmNsZSBjbGFzcz0ic3QwIiBjeD0iMTA3LjgiIGN5PSI1NC4zIiByPSI1NC4zIi8+Cgk8Y2lyY2xlIGNsYXNzPSJzdDAiIGN4PSIxNC40IiBjeT0iMTIzLjgiIHI9IjE0LjQiLz4KPC9nPgo8L3N2Zz4K");
        }
            font-size: 1.1em;
            line-height: 1.4;
            padding: 3vh 0;
            margin-bottom: -0.9em;
            border-bottom: 6px solid var(--dark-cosmos-color);

        &:before {
             top: -8vw;
             left: -1.3vw;
             width: 2.5vw;
             height: 16vw;
         }
        }

        @media (min-width: $mq-small) and (max-height: $mq-small) {
            font-size: 1em;
            border-bottom: 2px solid var(--dark-cosmos-color);

        &:before {
             background: none;
         }
        }
        }

        .accent {
            background: var(--dark-cosmos-color);
            padding: 0.2em 0.2em;
        }

        /* Utilities and pen background */

        html {
            background: var(--dark-cosmos-color);
            color: var(--dark-cosmos-color);
        }

        /* collapsing the SVG on the body */

        body {
            font-family: "Raleway", sans-serif;
            position: relative;
            background-size: 360px;
            background-image: url("data:image/svg+xml;base64,PHN2ZyBpZD0iTGF5ZXJfMSIgZGF0YS1uYW1lPSJMYXllciAxIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzMTkuNTQgMzE4Ljk2Ij4KICA8ZGVmcz4KICAgIDxzdHlsZT4KICAgICAgLmNscy0xIHsKICAgICAgICBmaWxsOiAjZmFlY2NhOwogICAgICB9CiAgICA8L3N0eWxlPgogIDwvZGVmcz4KICA8Zz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTIyNS41NywxMDAuNThhLjIzLjIzLDAsMCwwLDAsLjQ1QzIyNS44MywxMDEsMjI1LjgzLDEwMC41OCwyMjUuNTcsMTAwLjU4WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjU2LjgyLDU1Ljc4YS4yMy4yMywwLDAsMCwwLC40NUMyNTcuMDgsNTYuMjMsMjU3LjA4LDU1Ljc4LDI1Ni44Miw1NS43OFoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTI0Mi44NSwyMC43NGMtLjI2LDAtLjI2LjQ1LDAsLjQ1QS4yMy4yMywwLDAsMCwyNDIuODUsMjAuNzRaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yOTQuNzIsMTU4YS4yMy4yMywwLDAsMCwwLC40NUMyOTUsMTU4LjQ4LDI5NSwxNTgsMjk0LjcyLDE1OFoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTMxNS42Niw3Mi43NmMtLjI2LDAtLjI2LjQ1LDAsLjQ1QS4yMy4yMywwLDAsMCwzMTUuNjYsNzIuNzZaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yODYuNzQsMTE5LjczYS4yMy4yMywwLDAsMCwwLC40NUMyODcsMTIwLjE4LDI4NywxMTkuNzMsMjg2Ljc0LDExOS43M1oiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTMxNywuMTRjLS4yNiwwLS4yNi40NSwwLC40NUEuMjMuMjMsMCwwLDAsMzE3LC4xNFoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTE2My43MywxNy4xMmEuMjMuMjMsMCwwLDAsMCwuNDVDMTY0LDE3LjU3LDE2NCwxNy4xMiwxNjMuNzMsMTcuMTJaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik01Ni42OCw4LjQ1YS4yMy4yMywwLDAsMCwwLC40NUM1Ni45NCw4LjksNTYuOTQsOC40NSw1Ni42OCw4LjQ1WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTAwLjU2LDIwLjc0YS4yMy4yMywwLDAsMCwwLC40NUEuMjMuMjMsMCwwLDAsMTAwLjU2LDIwLjc0WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTY2LjA2LDgzLjA5YS4yMy4yMywwLDAsMCwwLC40NUMxNjYuMzIsODMuNTQsMTY2LjMyLDgzLjA5LDE2Ni4wNiw4My4wOVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTk5LjQ4LDE3Ny45YS4yMy4yMywwLDAsMCwwLC40NUM5OS43NCwxNzguMzUsOTkuNzQsMTc3LjksOTkuNDgsMTc3LjlaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0xMjcuNzMsMTM0LjE2YS4yMy4yMywwLDAsMCwwLC40NUEuMjMuMjMsMCwwLDAsMTI3LjczLDEzNC4xNloiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTEwNy43OCw3OS40NmMtLjI2LDAtLjI2LjQ0LDAsLjQ0QS4yMi4yMiwwLDAsMCwxMDcuNzgsNzkuNDZaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yMzUuMzYsMjAwLjQ1Yy0uMjYsMC0uMjYuNDUsMCwuNDVBLjIzLjIzLDAsMCwwLDIzNS4zNiwyMDAuNDVaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yODAuMDksMjEwLjQxYS4yMy4yMywwLDAsMCwwLC40NUEuMjMuMjMsMCwwLDAsMjgwLjA5LDIxMC40MVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTI0MSwxNTYuNzNhLjIzLjIzLDAsMCwwLDAsLjQ1QzI0MS4yOCwxNTcuMTgsMjQxLjI4LDE1Ni43MywyNDEsMTU2LjczWiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNNTMuNjMsMjY3LjgzYS4yMi4yMiwwLDAsMCwwLC40NEM1My44OSwyNjguMjcsNTMuODksMjY3LjgzLDUzLjYzLDI2Ny44M1oiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTS4yLDEzMS42NmEuMjMuMjMsMCwwLDAsMCwuNDVBLjIzLjIzLDAsMCwwLC4yLDEzMS42NloiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTcuODMsMTM2LjVjLS4yNiwwLS4yNi40NCwwLC40NEEuMjIuMjIsMCwwLDAsNy44MywxMzYuNVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTcuODMsMTI1LjQ0Yy0uMjYsMC0uMjYuNDUsMCwuNDVBLjIzLjIzLDAsMCwwLDcuODMsMTI1LjQ0WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTUuNDYsMjUuOWMtLjI2LDAtLjI2LjQ1LDAsLjQ1QS4yMy4yMywwLDAsMCwxNS40NiwyNS45WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTI1Ljc5LDIwMC4wOWEuMjMuMjMsMCwwLDAsMCwuNDVBLjIzLjIzLDAsMCwwLDEyNS43OSwyMDAuMDlaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik00MS41NCwxOTYuNjNjLS4yNiwwLS4yNi40NSwwLC40NUEuMjMuMjMsMCwwLDAsNDEuNTQsMTk2LjYzWiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNNDYsMTMxYS4yMy4yMywwLDAsMCwwLC40NUM0Ni4yNiwxMzEuNDIsNDYuMjYsMTMxLDQ2LDEzMVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTIzNi44MSwyOTguOTNjLS4yNiwwLS4yNi40NSwwLC40NUEuMjMuMjMsMCwwLDAsMjM2LjgxLDI5OC45M1oiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTI4NS4xNSwyODAuMjdjLS4yNiwwLS4yNi40NSwwLC40NUEuMjMuMjMsMCwwLDAsMjg1LjE1LDI4MC4yN1oiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTIxOSwyMzAuNWMtLjI2LDAtLjI2LjQ1LDAsLjQ1QS4yMy4yMywwLDAsMCwyMTksMjMwLjVaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0xODkuNzQsMzEwLjY4Yy0uMjYsMC0uMjYuNDUsMCwuNDVBLjIzLjIzLDAsMCwwLDE4OS43NCwzMTAuNjhaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0xMDcuNjksMzE4LjI4Yy0uMjYsMC0uMjYuNDUsMCwuNDVBLjIzLjIzLDAsMCwwLDEwNy42OSwzMTguMjhaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yNi45MSwzMTAuNjhjLS4yNiwwLS4yNi40NSwwLC40NUEuMjMuMjMsMCwwLDAsMjYuOTEsMzEwLjY4WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjYuOTEsMjQ1Yy0uMjYsMC0uMjYuNDQsMCwuNDRBLjIyLjIyLDAsMCwwLDI2LjkxLDI0NVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTIxMi42NCwxMjUuOWMtLjUzLDAtLjUzLjksMCwuOVMyMTMuMTcsMTI1LjksMjEyLjY0LDEyNS45WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjE1LjE5LDQ5Ljg3YS40NS40NSwwLDAsMCwwLC45QzIxNS43Miw1MC43NywyMTUuNzIsNDkuODcsMjE1LjE5LDQ5Ljg3WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjk1LjMzLDkyLjczYy0uNTMsMC0uNTMuODksMCwuODlTMjk1Ljg2LDkyLjczLDI5NS4zMyw5Mi43M1oiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTE5Ny4zOCwyNjMuNTZjLS41MywwLS41NC45LDAsLjlTMTk3LjkxLDI2My41NiwxOTcuMzgsMjYzLjU2WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTY0Ljk0LDIzNi41Yy0uNTMsMC0uNTMuODksMCwuODlTMTY1LjQ3LDIzNi41LDE2NC45NCwyMzYuNVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTgyLjI1LDI5My44N2MtLjUzLDAtLjUzLjg5LDAsLjg5UzgyLjc4LDI5My44Nyw4Mi4yNSwyOTMuODdaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0xMjguMDUsMTcuMzhjLS41MywwLS41NC45LDAsLjlTMTI4LjU4LDE3LjM4LDEyOC4wNSwxNy4zOFoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTI0LjM3LDQ1Yy0uNTMsMC0uNTMuOSwwLC45UzI0LjksNDUsMjQuMzcsNDVaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik03Ni41MywxNTIuMTdhLjQ1LjQ1LDAsMCwwLDAsLjlDNzcuMDYsMTUzLjA3LDc3LjA2LDE1Mi4xNyw3Ni41MywxNTIuMTdaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yMS4xOSwxNzAuODNjLS41MywwLS41My45LDAsLjlTMjEuNzIsMTcwLjgzLDIxLjE5LDE3MC44M1oiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTYxLjksMjI4LjJjLS41MywwLS41NC45LDAsLjlTNjIuNDMsMjI4LjIsNjEuOSwyMjguMloiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTEyLjI4LDI2Ni4yMmMtLjUzLDAtLjUzLjksMCwuOUEuNDUuNDUsMCwwLDAsMTIuMjgsMjY2LjIyWiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjYwLjM1LDMxOC4wNmEuNDUuNDUsMCwwLDAsMCwuOUMyNjAuODgsMzE5LDI2MC44OCwzMTguMDYsMjYwLjM1LDMxOC4wNloiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTI1My4zNSwyNjEuMzhjLS41MywwLS41My45LDAsLjlTMjUzLjg4LDI2MS4zOCwyNTMuMzUsMjYxLjM4WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMzEwLjU5LDIzNS4xMWMtLjUzLDAtLjUzLjksMCwuOUEuNDUuNDUsMCwwLDAsMzEwLjU5LDIzNS4xMVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTIxOSw3LjQ4Yy0uNzksMC0uOCwxLjM1LDAsMS4zNVMyMTkuOCw3LjQ4LDIxOSw3LjQ4WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTc4LjkzLDM3LjJjLS44LDAtLjgsMS4zNSwwLDEuMzVTMTc5LjczLDM3LjIsMTc4LjkzLDM3LjJaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yOTcuODcsMTAuMjVjLS43OSwwLS44LDEuMzQsMCwxLjM0UzI5OC42NywxMC4yNSwyOTcuODcsMTAuMjVaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yODksNTkuMzJjLS44LDAtLjgsMS4zNSwwLDEuMzVTMjg5Ljc3LDU5LjMyLDI4OSw1OS4zMloiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTE2Ni44NSwyNTdjLS44LDAtLjgsMS4zNSwwLDEuMzVTMTY3LjY0LDI1NywxNjYuODUsMjU3WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTI4LjA1LDI0NC41N2MtLjgsMC0uOCwxLjM0LDAsMS4zNFMxMjguODUsMjQ0LjU3LDEyOC4wNSwyNDQuNTdaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0zMTAuNTksMjY5LjQ1Yy0uNzksMC0uNzksMS4zNSwwLDEuMzVTMzExLjM5LDI2OS40NSwzMTAuNTksMjY5LjQ1WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMzA0Ljg3LDMxMS42MWMtLjgsMC0uOCwxLjM1LDAsMS4zNVMzMDUuNjcsMzExLjYxLDMwNC44NywzMTEuNjFaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0xMi45Miw4OC4zNWMtLjgsMC0uOCwxLjM1LDAsMS4zNVMxMy43Miw4OC4zNSwxMi45Miw4OC4zNVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTQyLjgyLDI5LjZjLS44LDAtLjgsMS4zNSwwLDEuMzVTNDMuNjEsMjkuNiw0Mi44MiwyOS42WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNODcuMzQsMjYzLjkyYy0uOCwwLS44LDEuMzUsMCwxLjM1Uzg4LjE0LDI2My45Miw4Ny4zNCwyNjMuOTJaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik03Ni41MywzMTMuNjljLS44LDAtLjgsMS4zNCwwLDEuMzRTNzcuMzIsMzEzLjY5LDc2LjUzLDMxMy42OVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTIwMS4yOSw3Ni44NGEuMjIuMjIsMCwwLDAsMCwuNDRDMjAxLjU1LDc3LjI4LDIwMS41NSw3Ni44NCwyMDEuMjksNzYuODRaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yNjAsMS4xNWEuMjMuMjMsMCwwLDAsMCwuNDVDMjYwLjI4LDEuNiwyNjAuMjgsMS4xNSwyNjAsMS4xNVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTI2My44NC4yYS4yMi4yMiwwLDAsMCwwLC40NEEuMjIuMjIsMCwwLDAsMjYzLjg0LjJaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yNjMsNi45MWEuMjMuMjMsMCwwLDAsMCwuNDVDMjYzLjIyLDcuMzYsMjYzLjIyLDYuOTEsMjYzLDYuOTFaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yNjYuMTksNWMtLjI2LDAtLjI2LjQ1LDAsLjQ1QS4yMy4yMywwLDAsMCwyNjYuMTksNVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTI2OS4xMywxMy4zYy0uMjYsMC0uMjYuNDUsMCwuNDVBLjIzLjIzLDAsMCwwLDI2OS4xMywxMy4zWiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjc2Ljg4LDMuM2MtLjI2LDAtLjI2LjQ0LDAsLjQ0QS4yMi4yMiwwLDAsMCwyNzYuODgsMy4zWiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjY5LjMsMjM5Ljc4YS4yMy4yMywwLDAsMCwwLC40NUMyNjkuNTYsMjQwLjIzLDI2OS41NywyMzkuNzgsMjY5LjMsMjM5Ljc4WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjgwLjY3LDIyOS44OWMtLjI2LDAtLjI2LjQ1LDAsLjQ1QS4yMy4yMywwLDAsMCwyODAuNjcsMjI5Ljg5WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjgzLDIzNS42NmEuMjMuMjMsMCwwLDAsMCwuNDVDMjgzLjIxLDIzNi4xMSwyODMuMjEsMjM1LjY2LDI4MywyMzUuNjZaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yODAuNjcsMjQwLjYxYy0uMjYsMC0uMjYuNDUsMCwuNDVBLjIzLjIzLDAsMCwwLDI4MC42NywyNDAuNjFaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yNzMuMDksMjQ5LjY3YS4yMy4yMywwLDAsMCwwLC40NUEuMjMuMjMsMCwwLDAsMjczLjA5LDI0OS42N1oiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTI3My4wOSwyMzEuNTRhLjIzLjIzLDAsMCwwLDAsLjQ1QS4yMy4yMywwLDAsMCwyNzMuMDksMjMxLjU0WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjk3LjM1LDIxNS4wNmMtLjI2LDAtLjI2LjQ1LDAsLjQ1QS4yMy4yMywwLDAsMCwyOTcuMzUsMjE1LjA2WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNODcuNzIsMjE0LjI0Yy0uMjYsMC0uMjYuNDUsMCwuNDVBLjIzLjIzLDAsMCwwLDg3LjcyLDIxNC4yNFoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTk5LjEsMjIyLjQ4YS4yMy4yMywwLDAsMCwwLC40NUM5OS4zNiwyMjIuOTMsOTkuMzYsMjIyLjQ4LDk5LjEsMjIyLjQ4WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTI2Ljg1LDIwNy42NWEuMjMuMjMsMCwwLDAsMCwuNDVDMTI3LjExLDIwOC4xLDEyNy4xMSwyMDcuNjUsMTI2Ljg1LDIwNy42NVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTg5LjI0LDE5MmEuMjMuMjMsMCwwLDAsMCwuNDVBLjIzLjIzLDAsMCwwLDg5LjI0LDE5MloiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTk2LjgyLDIxNS4wNmMtLjI2LDAtLjI2LjQ1LDAsLjQ1QS4yMy4yMywwLDAsMCw5Ni44MiwyMTUuMDZaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0xMTAuMDcsMjMyLjM3YS4yMy4yMywwLDAsMCwwLC40NUMxMTAuMzMsMjMyLjgyLDExMC4zMywyMzIuMzcsMTEwLjA3LDIzMi4zN1oiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTIyMi4yOSwzMDAuNzZhLjIzLjIzLDAsMCwwLDAsLjQ1QzIyMi41NSwzMDEuMjEsMjIyLjU1LDMwMC43NiwyMjIuMjksMzAwLjc2WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjEzLjE5LDMxOC4wNmEuMjMuMjMsMCwwLDAsMCwuNDVDMjEzLjQ1LDMxOC41MSwyMTMuNDYsMzE4LjA2LDIxMy4xOSwzMTguMDZaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yMjMuMDUsMjYzYS4yMy4yMywwLDAsMCwwLC40NUMyMjMuMzEsMjYzLjQxLDIyMy4zMSwyNjMsMjIzLjA1LDI2M1oiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTE4NC41OCwxODAuNDNhLjIzLjIzLDAsMCwwLDAtLjQ1QzE4NC4zMiwxODAsMTg0LjMyLDE4MC40MywxODQuNTgsMTgwLjQzWiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjMxLjY1LDE2OC42OGEuMjMuMjMsMCwwLDAsMC0uNDVBLjIzLjIzLDAsMCwwLDIzMS42NSwxNjguNjhaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yMjQsMTk0LjQ4Yy41MywwLC41My0uOSwwLS45UzIyMy40OCwxOTQuNDgsMjI0LDE5NC40OFoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTE5OS4xMSwxNzguNmMuMjYsMCwuMjYtLjQ0LDAtLjQ0QS4yMi4yMiwwLDAsMCwxOTkuMTEsMTc4LjZaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yMDguMiwxNjEuM2EuMjMuMjMsMCwwLDAsMC0uNDVDMjA3Ljk0LDE2MC44NSwyMDcuOTQsMTYxLjMsMjA4LjIsMTYxLjNaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0xOTguMzUsMTk1LjA4Yy4yNiwwLC4yNi0uNDQsMC0uNDRBLjIyLjIyLDAsMCwwLDE5OC4zNSwxOTUuMDhaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0xMjEuNDQsMzA1LjdjLS4yNiwwLS4yNy40NSwwLC40NUEuMjMuMjMsMCwwLDAsMTIxLjQ0LDMwNS43WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjUzLjM4LDEuNjVhLjIzLjIzLDAsMCwwLDAsLjQ1QzI1My42NCwyLjEsMjUzLjY0LDEuNjUsMjUzLjM4LDEuNjVaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yMzYuNjksMTQuODNjLS4yNiwwLS4yNi40NSwwLC40NUEuMjMuMjMsMCwwLDAsMjM2LjY5LDE0LjgzWiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjU0Ljg5LDMwLjQ5Yy0uMjYsMC0uMjYuNDUsMCwuNDVBLjIzLjIzLDAsMCwwLDI1NC44OSwzMC40OVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTI1NS42NSwxNGEuMjMuMjMsMCwwLDAsMCwuNDVBLjIzLjIzLDAsMCwwLDI1NS42NSwxNFoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTI4NC40NiwyMC42Yy0uMjYsMC0uMjYuNDUsMCwuNDVBLjIzLjIzLDAsMCwwLDI4NC40NiwyMC42WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMjk1LjA4LDQuMTJhLjIzLjIzLDAsMCwwLDAsLjQ1QS4yMy4yMywwLDAsMCwyOTUuMDgsNC4xMloiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTI4OC4yNiwwYS4yMy4yMywwLDAsMCwwLC40NUMyODguNTIuNDUsMjg4LjUyLDAsMjg4LjI2LDBaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0zMDguNzMsMy4zYS4yMi4yMiwwLDAsMCwwLC40NEMzMDksMy43NCwzMDksMy4zLDMwOC43MywzLjNaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0zMTkuMzQsMTQuODNjLS4yNiwwLS4yNi40NSwwLC40NUEuMjMuMjMsMCwwLDAsMzE5LjM0LDE0LjgzWiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNNjIuNTYsOTQuMDhhLjIzLjIzLDAsMCwwLDAsLjQ1QzYyLjgyLDk0LjUzLDYyLjgyLDk0LjA4LDYyLjU2LDk0LjA4WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNNjMuNjEsMTAxLjY0Yy0uMjYsMC0uMjYuNDUsMCwuNDVBLjIzLjIzLDAsMCwwLDYzLjYxLDEwMS42NFoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTU1LjI3LDEwOS4wNWEuMjMuMjMsMCwwLDAsMCwuNDVBLjIzLjIzLDAsMCwwLDU1LjI3LDEwOS4wNVoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTEyMi4zNywyODcuNjhjLjMxLS4zNS0uMTgtLjg4LS41LS41NFMxMjIuMDUsMjg4LDEyMi4zNywyODcuNjhaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0xMTIuNzksMjgwYy4zMi0uMzUtLjE3LS44OS0uNDktLjU0UzExMi40OCwyODAuMzYsMTEyLjc5LDI4MFoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTExNC42MSwyNjAuMzJjLjMxLS4zNC0uMTgtLjg4LS41LS41M1MxMTQuMjksMjYwLjY3LDExNC42MSwyNjAuMzJaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik05My43NywxMzAuNTJjLS4yNiwwLS4yNi40NSwwLC40NUEuMjMuMjMsMCwwLDAsOTMuNzcsMTMwLjUyWiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTQ0LjUxLDkzLjg1YS4yMy4yMywwLDAsMCwwLC40NUMxNDQuNzcsOTQuMywxNDQuNzcsOTMuODUsMTQ0LjUxLDkzLjg1WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTY5LjQzLDkyLjA4Yy4yLS4xOS0uMDctLjUyLS4yNy0uMzNTMTY5LjIzLDkyLjI3LDE2OS40Myw5Mi4wOFoiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTE3MywxNDguMTZjLjItLjE5LS4wNy0uNTItLjI3LS4zM1MxNzIuODQsMTQ4LjM1LDE3MywxNDguMTZaIi8+CiAgICA8cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0xMjUuNjgsMTc3LjQ3Yy4yLS4xOS0uMDctLjUyLS4yNy0uMzNTMTI1LjQ4LDE3Ny42NiwxMjUuNjgsMTc3LjQ3WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTExLjc4LDEyMS40M2MuMi0uMTktLjA3LS41My0uMjctLjM0UzExMS41OCwxMjEuNjIsMTExLjc4LDEyMS40M1oiLz4KICAgIDxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTIwOCwxMjIuODRjLjQtLjM4LS4xNC0xLjA2LS41NC0uNjhTMjA3LjU2LDEyMy4yMiwyMDgsMTIyLjg0WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTIxLjY3LDE0Ny45Yy40LS4zOC0uMTQtMS4wNi0uNTQtLjY4UzEyMS4yNywxNDguMjgsMTIxLjY3LDE0Ny45WiIvPgogICAgPHBhdGggY2xhc3M9ImNscy0xIiBkPSJNMTQ2LjY5LDE2OC41Yy42LS41Ny0uMjEtMS41OS0uODEtMVMxNDYuMDksMTY5LjA3LDE0Ni42OSwxNjguNVoiLz4KICA8L2c+Cjwvc3ZnPgo=");
        }

    </style>
</head>

<body>
<div class="comet-rain">
    <!-- symbol definition -->
    <svg aria-hidden="true" id="svg-comet" class="svg-defs" data-name="comet" viewBox="0 0 195 173.05" width="195" height="173.05">
        <symbol id="comet">
            <path d="M192.39.66c-33.66,31.46-93.3,81.16-129,108.88L3.42,156c-5,3.89-4.29,11.28.74,15.4s12.84-.83,13.1-1.07C51.09,138.62,82.6,104.72,116.64,73c8.89-8.29,66.23-59.5,77.47-70.13C196.17,1,194.24-1.08,192.39.66Z" />
        </symbol>
    </svg>

    <!-- gradient definition for the comets -->
    <svg aria-hidden="true" width="0" height="0">
        <defs>
            <linearGradient id="gradient" x1="194.94" y1="4.2" x2="11.72" y2="161.98" gradientUnits="userSpaceOnUse">
                <stop offset="0%" stop-color="#fff" stop-opacity="0.03"></stop>
                <stop offset="100%" stop-color="var(--t-sun-color)"></stop>
            </linearGradient>
        </defs>
    </svg>

    <svg aria-hidden="true" class="comet-01 comet-instance" width="195" height="173.05" viewBox="0 0 195 173.05">
        <use xlink:href="#comet" />
    </svg>

    <svg aria-hidden="true" class="comet-02 comet-instance" width="195" height="173.05" viewBox="0 0 195 173.05">
        <use xlink:href="#comet" />
    </svg>

    <svg aria-hidden="true" role="presentation" class="comet-03 comet-instance" width="195" height="173.05" viewBox="0 0 195 173.05">
        <use xlink:href="#comet" />
    </svg>

    <svg aria-hidden="true" class="comet-04 comet-instance" width="195" height="173.05" viewBox="0 0 195 173.05">
        <use xlink:href="#comet" />
    </svg>

    <svg aria-hidden="true" class="comet-05 comet-instance" width="195" height="173.05" viewBox="0 0 195 173.05">
        <use xlink:href="#comet" />
    </svg>

    <svg aria-hidden="true" class="comet-06 comet-instance" width="195" height="173.05" viewBox="0 0 195 173.05">
        <use xlink:href="#comet" />
    </svg>
</div>

<div class="day-night-transition">
    <div class="heading">
        <p class="smallnumber"> 101.</p>
        <h1> CSS Transitions </h1>
    </div>
    <svg  id="transition-scene" class="transition-scene" viewBox="-180 -185 890 890">
        <title>CSS Transition illustrated</title>
        <desc>A day and night illustration of a desert landscape. Default it "day", orange and dark pink colors, with a sun high in the sky and cactuses. When you hover it, it turns into night dark purple colors, the sun sets and the moon rises.</desc>
        <defs>
            <clipPath id="clip-path">
                <circle id="mask" class="cls-1" cx="250" cy="250" r="250" />
            </clipPath>
        </defs>
        <g class="rings">
            <circle class="circle-bg shadow-01" cx="250" cy="250" r="270" />
            <circle class="circle-bg shadow-02" cx="250" cy="250" r="290" />
        </g>

        <g id="container" data-name="container">
            <g id="masked" class="svg-mask-transition">
                <circle id="background" data-name="background" class="circle-bg" cx="250" cy="250" r="250" />
                <g id="sky" data-name="sky" class="sky">
                    <g id="stars" data-name="stars">
                        <path class="star" d="M338.75,98.38a1.57,1.57,0,0,1,0-3.14A1.57,1.57,0,0,1,338.75,98.38Z" />
                        <path class="star" d="M316.51,173.6a1.58,1.58,0,0,0,0,3.15A1.58,1.58,0,0,0,316.51,173.6Z" />
                        <path class="star" d="M284.57,108.51c-1.37-.18-4.1-.2-3.41,2C280.43,116.18,290,110.09,284.57,108.51Z" />
                        <path class="star" d="M168.25,249.32a1.58,1.58,0,0,0,0,3.15A1.58,1.58,0,0,0,168.25,249.32Z" />
                        <path class="star" d="M87.76,117.48a1.57,1.57,0,0,0,0,3.14A1.57,1.57,0,0,0,87.76,117.48Z" />
                        <path class="star" d="M84.05,181a1.57,1.57,0,0,0,0,3.14A1.57,1.57,0,0,0,84.05,181Z" />
                        <path class="star" d="M325,298.57a1.57,1.57,0,0,0,0,3.14A1.57,1.57,0,0,0,325,298.57Z" />
                        <path class="star" d="M334,257.27a1.57,1.57,0,0,0,0,3.14A1.57,1.57,0,0,0,334,257.27Z" />
                        <path class="star" d="M268.32,213.85a1.57,1.57,0,0,0,0,3.14A1.57,1.57,0,0,0,268.32,213.85Z" />
                        <path class="star" d="M123.37,321.53c-.8-3.23-5.16-4.46-6.19-.57C116.17,325.39,124.18,326.73,123.37,321.53Z" />
                        <path class="star" d="M441,177.31a1.58,1.58,0,0,0,0,3.15A1.58,1.58,0,0,0,441,177.31Z" />
                        <path class="star" d="M465.83,230.79a1.58,1.58,0,0,0,0,3.15A1.58,1.58,0,0,0,465.83,230.79Z" />
                        <path class="star" d="M465.18,303.85a1.63,1.63,0,0,0-.42-.7c-.76-2.91-4.43-.55-3,1.62C462.5,306.55,465.69,306,465.18,303.85Z" />
                        <path class="star" d="M271.8,7.58c-3.67-1.91-7.13,3.69-3.62,6C272.35,16.35,276.08,10,271.8,7.58Z" />
                        <path class="star" d="M157.66,200.61a1.57,1.57,0,0,0,0,3.14A1.57,1.57,0,0,0,157.66,200.61Z" />
                        <path class="star" d="M115.29,228.67a1.58,1.58,0,0,0,0,3.15A1.58,1.58,0,0,0,115.29,228.67Z" />
                        <path class="star" d="M65.52,231.32a1.58,1.58,0,0,0,0,3.15A1.58,1.58,0,0,0,65.52,231.32Z" />
                        <path class="star" d="M97.82,345.7a1.57,1.57,0,0,0,0,3.14A1.57,1.57,0,0,0,97.82,345.7Z" />
                        <path class="star" d="M414.36,113.22a.79.79,0,0,0,0,1.57A.79.79,0,0,0,414.36,113.22Z" />
                        <path class="star" d="M369.9,56.7a.79.79,0,0,0,0,1.57A.79.79,0,0,0,369.9,56.7Z" />
                        <path class="star" d="M330.71,29.57a.79.79,0,0,0,0,1.57A.79.79,0,0,0,330.71,29.57Z" />
                        <path class="star" d="M339.75,34.09a.79.79,0,0,0,0,1.57A.79.79,0,0,0,339.75,34.09Z" />
                        <path class="star" d="M330.71,43.13a.79.79,0,0,0,0,1.57A.79.79,0,0,0,330.71,43.13Z" />
                        <path class="star" d="M320.91,34.84a.79.79,0,0,0,0,1.57A.79.79,0,0,0,320.91,34.84Z" />
                        <path class="star" d="M343.52,25.05a.79.79,0,0,0,0,1.57A.79.79,0,0,0,343.52,25.05Z" />
                        <path class="star" d="M131,51.42A.79.79,0,0,0,131,53,.79.79,0,0,0,131,51.42Z" />
                        <path class="star" d="M154.36,37.1a.79.79,0,0,0,0,1.58A.79.79,0,0,0,154.36,37.1Z" />
                        <path class="star" d="M134,32.58a.79.79,0,0,0,0,1.57A.79.79,0,0,0,134,32.58Z" />
                        <path class="star" d="M56.39,103.42a.79.79,0,0,0,0,1.58A.79.79,0,0,0,56.39,103.42Z" />
                        <path class="star" d="M45.84,145.63a.79.79,0,0,0,0,1.57A.79.79,0,0,0,45.84,145.63Z" />
                        <path class="star" d="M154.36,336.29a.79.79,0,0,0,0,1.58A.79.79,0,0,0,154.36,336.29Z" />
                        <path class="star" d="M165.66,334.79a.79.79,0,0,0,0,1.57A.79.79,0,0,0,165.66,334.79Z" />
                        <path class="star" d="M153.61,322a.79.79,0,0,0,0,1.58A.79.79,0,0,0,153.61,322Z" />
                        <path class="star" d="M208.62,273.74a.79.79,0,0,0,0,1.58A.79.79,0,0,0,208.62,273.74Z" />
                        <path class="star" d="M131,292.58a.79.79,0,0,0,0,1.58A.79.79,0,0,0,131,292.58Z" />
                        <path class="star" d="M96.33,288.82a.79.79,0,0,0,0,1.57A.79.79,0,0,0,96.33,288.82Z" />
                        <path class="star" d="M99.34,358.9a.79.79,0,0,0,0,1.57A.79.79,0,0,0,99.34,358.9Z" />
                        <path class="star" d="M352.56,325.74a.79.79,0,0,0,0,1.58A.79.79,0,0,0,352.56,325.74Z" />
                        <path class="star" d="M302.82,300.12a.79.79,0,0,0,0,1.57A.79.79,0,0,0,302.82,300.12Z" />
                        <path class="star" d="M320.16,254.15a.79.79,0,0,0,0,1.57A.79.79,0,0,0,320.16,254.15Z" />
                        <path class="star" d="M479.17,277.51a.79.79,0,0,0,0,1.57A.79.79,0,0,0,479.17,277.51Z" />
                        <path class="star" d="M487.46,306.15a.79.79,0,0,0,0,1.57A.79.79,0,0,0,487.46,306.15Z" />
                        <path class="star" d="M382,176.52a.79.79,0,0,0,0,1.58A.79.79,0,0,0,382,176.52Z" />
                        <path class="star" d="M403.06,127.54a.79.79,0,0,0,0,1.57A.79.79,0,0,0,403.06,127.54Z" />
                        <path class="star" d="M329.2,139.6a.79.79,0,0,0,0,1.57A.79.79,0,0,0,329.2,139.6Z" />
                        <path class="star" d="M220.68,130.55a.79.79,0,0,0,0,1.58A.79.79,0,0,0,220.68,130.55Z" />
                        <path class="star" d="M246.3,83.07a.79.79,0,0,0,0,1.58A.79.79,0,0,0,246.3,83.07Z" />
                        <path class="star" d="M109.9,166a.79.79,0,0,0,0,1.58A.79.79,0,0,0,109.9,166Z" />
                        <path class="star" d="M118.94,165.22a.79.79,0,0,0,0,1.57A.79.79,0,0,0,118.94,165.22Z" />
                        <path class="star" d="M217.66,221a.79.79,0,0,0,0,1.57A.79.79,0,0,0,217.66,221Z" />
                        <path class="star" d="M221.43,212a.79.79,0,0,0,0,1.57A.79.79,0,0,0,221.43,212Z" />
                        <path class="star" d="M119.69,95.89a.79.79,0,0,0,0,1.57A.79.79,0,0,0,119.69,95.89Z" />
                        <path class="star" d="M225.2,13.74a.79.79,0,0,0,0,1.57A.79.79,0,0,0,225.2,13.74Z" />
                        <path class="star" d="M88.79,68a.79.79,0,0,0,0,1.57A.79.79,0,0,0,88.79,68Z" />
                        <path class="star" d="M274.19,155.42a.79.79,0,0,0,0,1.58A.79.79,0,0,0,274.19,155.42Z" />
                        <path class="star" d="M408.33,75.54a.79.79,0,0,0,0,1.57A.79.79,0,0,0,408.33,75.54Z" />
                        <path class="star" d="M308.85,68.76a.79.79,0,0,0,0,1.57A.79.79,0,0,0,308.85,68.76Z" />
                        <path class="star" d="M422.65,177.28a.79.79,0,0,0,0,1.57A.79.79,0,0,0,422.65,177.28Z" />
                        <path class="star" d="M362.36,214.21a.79.79,0,0,0,0,1.57A.79.79,0,0,0,362.36,214.21Z" />
                        <path class="star" d="M364.62,145.63a.79.79,0,0,0,0,1.57A.79.79,0,0,0,364.62,145.63Z" />
                        <path class="star" d="M287,270.73a.79.79,0,0,0,0,1.57A.79.79,0,0,0,287,270.73Z" />
                        <path class="star" d="M277.2,238.32a.79.79,0,0,0,0,1.57A.79.79,0,0,0,277.2,238.32Z" />
                        <path class="star" d="M89.55,262.44a.79.79,0,0,0,0,1.57A.79.79,0,0,0,89.55,262.44Z" />
                        <path class="star" d="M463.62,130.33a.79.79,0,0,0,0,1.57A.79.79,0,0,0,463.62,130.33Z" />
                        <path class="star" d="M435.68,222.25a.79.79,0,0,0,0,1.58A.79.79,0,0,0,435.68,222.25Z" />
                        <path class="star" d="M390,262.38a.79.79,0,0,0,0,1.57A.79.79,0,0,0,390,262.38Z" />
                        <path class="star" d="M407.75,154.2a.79.79,0,0,0,0,1.57A.79.79,0,0,0,407.75,154.2Z" />
                        <path class="star" d="M326.49,199.4a.79.79,0,0,0,0,1.57A.79.79,0,0,0,326.49,199.4Z" />
                        <path class="star" d="M175.14,201.94a.79.79,0,0,0,0,1.57A.79.79,0,0,0,175.14,201.94Z" />
                        <path class="star" d="M223.9,92.74a.79.79,0,0,0,0,1.57A.79.79,0,0,0,223.9,92.74Z" />
                        <path class="star" d="M141.11,241.05a.79.79,0,0,0,0,1.57A.79.79,0,0,0,141.11,241.05Z" />
                        <path class="star" d="M111.14,199.91a.79.79,0,0,0,0,1.57A.79.79,0,0,0,111.14,199.91Z" />
                        <path class="star" d="M71,152.17a.79.79,0,0,0,0,1.57A.79.79,0,0,0,71,152.17Z" />
                        <path class="star" d="M351.88,121.66a.31.31,0,0,0,0,.62A.31.31,0,0,0,351.88,121.66Z" />
                        <path class="star" d="M366.1,111.5a.32.32,0,0,0,0,.63A.32.32,0,0,0,366.1,111.5Z" />
                        <path class="star" d="M373.21,126.23a.32.32,0,0,0,0,.63A.32.32,0,0,0,373.21,126.23Z" />
                        <path class="star" d="M392.51,101.85a.32.32,0,0,0,0,.63A.32.32,0,0,0,392.51,101.85Z" />
                        <path class="star" d="M254.88,61.22a.32.32,0,0,0,0,.63A.32.32,0,0,0,254.88,61.22Z" />
                        <path class="star" d="M265.54,50a.32.32,0,0,0,0,.63A.32.32,0,0,0,265.54,50Z" />
                        <path class="star" d="M360.52,187.68a.32.32,0,0,0,0,.63A.32.32,0,0,0,360.52,187.68Z" />
                        <path class="star" d="M374.23,244.56a.32.32,0,0,0,0,.63A.32.32,0,0,0,374.23,244.56Z" />
                        <path class="star" d="M344.77,226.79a.32.32,0,0,0,0,.63A.32.32,0,0,0,344.77,226.79Z" />
                        <path class="star" d="M300.08,237a.32.32,0,0,0,0,.63A.32.32,0,0,0,300.08,237Z" />
                        <path class="star" d="M308.2,182.6a.32.32,0,0,0,0,.63A.32.32,0,0,0,308.2,182.6Z" />
                        <path class="star" d="M276.21,295.35a.32.32,0,0,0,0,.63A.32.32,0,0,0,276.21,295.35Z" />
                        <path class="star" d="M255.89,232.88a.32.32,0,0,0,0,.63A.32.32,0,0,0,255.89,232.88Z" />
                        <path class="star" d="M233,235.42a.32.32,0,0,0,0,.63A.32.32,0,0,0,233,235.42Z" />
                        <path class="star" d="M197.49,243.55a.32.32,0,0,0,0,.63A.32.32,0,0,0,197.49,243.55Z" />
                        <path class="star" d="M187.33,282.66a.32.32,0,0,0,0,.63A.32.32,0,0,0,187.33,282.66Z" />
                        <path class="star" d="M187.33,270a.32.32,0,0,0,0,.63A.32.32,0,0,0,187.33,270Z" />
                        <path class="star" d="M198.5,266.91a.32.32,0,0,0,0,.63A.32.32,0,0,0,198.5,266.91Z" />
                        <path class="star" d="M199.52,277.07a.32.32,0,0,0,0,.63A.32.32,0,0,0,199.52,277.07Z" />
                        <path class="star" d="M220.34,277.58a.32.32,0,0,0,0,.63A.32.32,0,0,0,220.34,277.58Z" />
                        <path class="star" d="M220.85,261.83a.32.32,0,0,0,0,.63A.32.32,0,0,0,220.85,261.83Z" />
                        <path class="star" d="M218.31,245.07a.32.32,0,0,0,0,.63A.32.32,0,0,0,218.31,245.07Z" />
                        <path class="star" d="M212.72,259.8a.32.32,0,0,0,0,.63A.32.32,0,0,0,212.72,259.8Z" />
                        <path class="star" d="M212.21,288.75a.32.32,0,0,0,0,.63A.32.32,0,0,0,212.21,288.75Z" />
                        <path class="star" d="M201,296.88a.32.32,0,0,0,0,.63A.32.32,0,0,0,201,296.88Z" />
                        <path class="star" d="M173.11,298.4a.32.32,0,0,0,0,.63A.32.32,0,0,0,173.11,298.4Z" />
                        <path class="star" d="M166.5,290.78a.32.32,0,0,0,0,.63A.32.32,0,0,0,166.5,290.78Z" />
                        <path class="star" d="M145.17,328.87a.32.32,0,0,0,0,.63A.32.32,0,0,0,145.17,328.87Z" />
                        <path class="star" d="M134.51,339a.32.32,0,0,0,0,.63A.32.32,0,0,0,134.51,339Z" />
                        <path class="star" d="M135.52,347.16a.32.32,0,0,0,0,.63A.32.32,0,0,0,135.52,347.16Z" />
                        <path class="star" d="M163.46,324.81a.32.32,0,0,0,0,.63A.32.32,0,0,0,163.46,324.81Z" />
                        <path class="star" d="M240.15,243.55a.32.32,0,0,0,0,.63A.32.32,0,0,0,240.15,243.55Z" />
                        <path class="star" d="M248.78,217.14a.32.32,0,0,0,0,.63A.32.32,0,0,0,248.78,217.14Z" />
                        <path class="star" d="M277.22,190.22a.32.32,0,0,0,0,.63A.32.32,0,0,0,277.22,190.22Z" />
                        <path class="star" d="M294.49,188.7a.32.32,0,0,0,0,.63A.32.32,0,0,0,294.49,188.7Z" />
                        <path class="star" d="M321.41,181.08a.32.32,0,0,0,0,.63A.32.32,0,0,0,321.41,181.08Z" />
                        <path class="star" d="M340.2,164.32a.32.32,0,0,0,0,.63A.32.32,0,0,0,340.2,164.32Z" />
                        <path class="star" d="M342.74,151.62a.32.32,0,0,0,0,.63A.32.32,0,0,0,342.74,151.62Z" />
                        <path class="star" d="M303.13,170.41a.32.32,0,0,0,0,.63A.32.32,0,0,0,303.13,170.41Z" />
                        <path class="star" d="M284.33,177.52a.32.32,0,0,0,0,.63A.32.32,0,0,0,284.33,177.52Z" />
                        <path class="star" d="M300.08,177.52a.32.32,0,0,0,0,.63A.32.32,0,0,0,300.08,177.52Z" />
                        <path class="star" d="M280.78,201.9a.32.32,0,0,0,0,.63A.32.32,0,0,0,280.78,201.9Z" />
                        <path class="star" d="M255.89,205.46a.32.32,0,0,0,0,.63A.32.32,0,0,0,255.89,205.46Z" />
                        <path class="star" d="M342.74,113a.32.32,0,0,0,0,.63A.32.32,0,0,0,342.74,113Z" />
                        <path class="star" d="M363.06,93.72a.32.32,0,0,0,0,.63A.32.32,0,0,0,363.06,93.72Z" />
                        <path class="star" d="M380.32,86.61a.32.32,0,0,0,0,.63A.32.32,0,0,0,380.32,86.61Z" />
                        <path class="star" d="M401.15,85.09a.32.32,0,0,0,0,.63A.32.32,0,0,0,401.15,85.09Z" />
                        <path class="star" d="M423.5,82.55a.32.32,0,0,0,0,.63A.32.32,0,0,0,423.5,82.55Z" />
                        <path class="star" d="M433.15,81a.31.31,0,0,0,0,.62A.31.31,0,0,0,433.15,81Z" />
                        <path class="star" d="M413.85,94.74a.32.32,0,0,0,0,.63A.32.32,0,0,0,413.85,94.74Z" />
                        <path class="star" d="M434.16,93.21a.32.32,0,0,0,0,.63A.32.32,0,0,0,434.16,93.21Z" />
                        <path class="star" d="M196.7,62.45a.32.32,0,0,0,0,.63A.32.32,0,0,0,196.7,62.45Z" />
                        <path class="star" d="M191.14,138.7a.32.32,0,0,0,0,.63A.32.32,0,0,0,191.14,138.7Z" />
                        <path class="star" d="M181.21,98.2a.31.31,0,0,0,0,.62A.31.31,0,0,0,181.21,98.2Z" />
                        <path class="star" d="M160.56,137.11a.32.32,0,0,0,0,.63A.32.32,0,0,0,160.56,137.11Z" />
                        <path class="star" d="M212.19,166.9a.32.32,0,0,0,0,.63A.32.32,0,0,0,212.19,166.9Z" />
                        <path class="star" d="M302.11,118.57c-.85-.81-2.63.08-1.92,1.29C300.27,121.64,303.65,119.86,302.11,118.57Z" />
                        <path class="star" d="M256.72,146.56a.32.32,0,0,0,0,.63A.32.32,0,0,0,256.72,146.56Z" />
                        <path class="star" d="M285.12,79.07a.31.31,0,0,0,0,.62A.31.31,0,0,0,285.12,79.07Z" />
                        <path class="star" d="M237.17,44a.32.32,0,0,0,0,.63A.32.32,0,0,0,237.17,44Z" />
                        <path class="star" d="M425.81,192.44a.31.31,0,0,0,0,.62A.31.31,0,0,0,425.81,192.44Z" />
                        <path class="star" d="M449,189.27a.32.32,0,0,0,0,.63A.32.32,0,0,0,449,189.27Z" />
                        <path class="star" d="M469.05,181.89a.32.32,0,0,0,0,.63A.32.32,0,0,0,469.05,181.89Z" />
                        <path class="star" d="M478.54,191.38a.32.32,0,0,0,0,.63A.32.32,0,0,0,478.54,191.38Z" />
                        <path class="star" d="M487,208.25a.32.32,0,0,0,0,.63A.32.32,0,0,0,487,208.25Z" />
                        <path class="star" d="M468,204a.31.31,0,0,0,0,.62A.31.31,0,0,0,468,204Z" />
                        <path class="star" d="M465.88,160.8a.32.32,0,0,0,0,.63A.32.32,0,0,0,465.88,160.8Z" />
                        <path class="star" d="M445.85,138.65a.32.32,0,0,0,0,.63A.32.32,0,0,0,445.85,138.65Z" />
                        <path class="star" d="M201.19,56.4a.32.32,0,0,0,0,.63A.32.32,0,0,0,201.19,56.4Z" />
                        <path class="star" d="M156.9,65.89a.32.32,0,0,0,0,.63A.32.32,0,0,0,156.9,65.89Z" />
                        <path class="star" d="M193.81,29a.32.32,0,0,0,0,.63A.32.32,0,0,0,193.81,29Z" />
                        <path class="star" d="M172.72,82.13a1,1,0,0,0,0,1.89A.95.95,0,0,0,172.72,82.13Z" />
                        <path class="star" d="M183.27,33.62a1,1,0,0,0,0,1.89A.95.95,0,0,0,183.27,33.62Z" />
                        <path class="star" d="M275,41a.94.94,0,0,0,0,1.88A.94.94,0,0,0,275,41Z" />
                        <path class="star" d="M244.43,161.23a.94.94,0,0,0,0,1.88A.94.94,0,0,0,244.43,161.23Z" />
                        <path class="star" d="M202.25,124.32a.94.94,0,0,0,0,1.88A.94.94,0,0,0,202.25,124.32Z" />
                        <path class="star" d="M369.92,265.63a.94.94,0,0,0,0,1.88A.94.94,0,0,0,369.92,265.63Z" />
                        <path class="star" d="M382.58,293a1,1,0,0,0,0,1.89A.95.95,0,0,0,382.58,293Z" />
                        <path class="star" d="M432.14,246.64a1,1,0,0,0,0,1.89A.95.95,0,0,0,432.14,246.64Z" />
                        <path class="star" d="M407.88,259.3a.94.94,0,0,0,0,1.88A.94.94,0,0,0,407.88,259.3Z" />
                        <path class="star" d="M412.1,309.92a.94.94,0,0,0,0,1.88A.94.94,0,0,0,412.1,309.92Z" />
                        <path class="star" d="M438.47,286.72a.94.94,0,0,0,0,1.88A.94.94,0,0,0,438.47,286.72Z" />
                        <path class="star" d="M438.47,307.81a.94.94,0,0,0,0,1.88A.94.94,0,0,0,438.47,307.81Z" />
                        <path class="star" d="M460.61,267.73a1,1,0,0,0,0,1.89A.95.95,0,0,0,460.61,267.73Z" />
                        <path class="star" d="M45.12,171.77a1,1,0,0,0,0,1.89A.95.95,0,0,0,45.12,171.77Z" />
                        <path class="star" d="M28.25,215a.94.94,0,0,0,0,1.88A.94.94,0,0,0,28.25,215Z" />
                        <path class="star" d="M72.54,208.68a1,1,0,0,0,0,1.89A.95.95,0,0,0,72.54,208.68Z" />
                        <path class="star" d="M89.41,225.55a1,1,0,0,0,0,1.89A.95.95,0,0,0,89.41,225.55Z" />
                        <path class="star" d="M122.1,267.73a1,1,0,0,0,0,1.89A.95.95,0,0,0,122.1,267.73Z" />
                        <path class="star" d="M34.57,353.15a1,1,0,0,0,0,1.89A.95.95,0,0,0,34.57,353.15Z" />
                        <path class="star" d="M34.57,269.84a1,1,0,0,0,0,1.89A.95.95,0,0,0,34.57,269.84Z" />
                        <path class="star" d="M76.76,301.48a1,1,0,0,0,0,1.89A.95.95,0,0,0,76.76,301.48Z" />
                        <path class="star" d="M231.78,9.37a1,1,0,0,0,0,1.89A.95.95,0,0,0,231.78,9.37Z" />
                    </g>
                    <g id="moonlight" class="moonlight">
                        <circle id="shadow-02-2" data-name="shadow-02" class="moon-shadow-02" cx="382.24" cy="444.43" r="113.65" />
                        <circle id="shadow-01-2" data-name="shadow-01" class="moon-shadow-01" cx="382.24" cy="444.43" r="87.13" />
                        <g id="moon-2" data-name="moon">
                            <circle id="moon-bg" class="moon-center" cx="382.24" cy="444.43" r="58.18" />
                            <path id="moon-pattern" class="moon-pattern" d="M352.11,413.3a8.43,8.43,0,1,1,8.43,8.37A8.41,8.41,0,0,1,352.11,413.3Zm61.06,70.89a14.69,14.69,0,1,0-15-14.69A14.83,14.83,0,0,0,413.17,484.19Zm-28.92-2.43a6.37,6.37,0,1,0-6.48-6.36A6.42,6.42,0,0,0,384.25,481.76Zm12.89-28.33a4,4,0,1,0-4.18-3.95A4.07,4.07,0,0,0,397.14,453.43Zm24-4.37a1.68,1.68,0,1,0-1.78-1.68A1.73,1.73,0,0,0,421.11,449.06Zm-29.19-37.32a7.09,7.09,0,1,0-7.48-7.07A7.29,7.29,0,0,0,391.92,411.74Zm-49.23,55.59a3.45,3.45,0,1,0-3.52-3.45A3.48,3.48,0,0,0,342.69,467.33Zm8.82-33.5a3.44,3.44,0,1,0-3.46-3.44A3.45,3.45,0,0,0,351.51,433.83Zm14.06.14a4.59,4.59,0,1,0-4.84-4.58A4.72,4.72,0,0,0,365.57,434Z" />
                        </g>
                    </g>
                    <g id="sun" class="sun">
                        <path id="shadow-02" class="sun-shadow-02" d="M285.74,98.79c-.47-11.21-15.53-9.05-17-21.47-.39-8.91,14-12.79,8.23-25.57-4.63-10.18-17.74-2.29-23.75-13.19-3.69-8.08,8.19-17.3-2-26.84-8.08-7.6-17.24,4.82-26.88-2.9-6.43-6,1.09-19.18-11.87-24C202.19-19,198.38-4,186.59-7.37c-8.2-3-6.18-18.14-20-17.55-11,.48-8.85,15.87-21,17.38-8.71.41-12.5-14.35-25-8.4-10,4.73-2.25,18.13-12.92,24.27-7.89,3.78-16.92-8.36-26.25,2C74,18.62,86.14,28,78.59,37.83,72.71,44.41,59.82,36.72,55.08,50,51.31,60.51,66,64.4,62.74,76.45c-3,8.39-17.75,6.33-17.17,20.42.47,11.21,15.53,9,17,21.47.39,8.91-14,12.78-8.23,25.57C59,154.09,72.07,146.2,78.08,157.1c3.7,8.07-8.18,17.3,2,26.84,8.08,7.6,17.24-4.82,26.88,2.9,6.43,6-1.09,19.18,11.87,24,10.31,3.85,14.12-11.2,25.91-7.83,8.2,3,6.18,18.14,20,17.54,11-.47,8.85-15.87,21-17.37,8.71-.41,12.5,14.34,25,8.4,10-4.73,2.25-18.13,12.91-24.27,7.9-3.78,16.93,8.36,26.26-2,7.43-8.26-4.72-17.62,2.84-27.47,5.89-6.58,18.77,1.1,23.5-12.14,3.77-10.54-11-14.43-7.66-26.49C271.54,110.82,286.32,112.88,285.74,98.79Z" />
                        <path id="shadow-01" class="sun-shadow-01" d="M257.49,98.57c-.36-8.58-11.87-6.93-13-16.43-.3-6.81,10.74-9.77,6.29-19.55-3.54-7.79-13.56-1.75-18.16-10.09-2.82-6.17,6.26-13.23-1.5-20.53-6.19-5.8-13.19,3.69-20.56-2.21-4.92-4.6.83-14.67-9.08-18.37-7.88-3-10.8,8.56-19.82,6C175.39,15.06,176.94,3.5,166.4,4c-8.39.36-6.78,12.13-16.07,13.29-6.67.31-9.57-11-19.13-6.43-7.62,3.62-1.72,13.87-9.88,18.57-6,2.89-12.94-6.4-20.08,1.54-5.68,6.32,3.61,13.48-2.17,21-4.5,5-14.35-.84-18,9.29-2.88,8.06,8.38,11,5.86,20.25-2.27,6.42-13.58,4.84-13.13,15.61.35,8.58,11.87,6.92,13,16.43.3,6.81-10.74,9.77-6.29,19.55,3.53,7.78,13.56,1.75,18.15,10.09,2.83,6.17-6.26,13.23,1.51,20.52,6.19,5.81,13.19-3.69,20.56,2.22,4.92,4.6-.83,14.67,9.08,18.37,7.88,2.95,10.8-8.56,19.82-6,6.27,2.32,4.72,13.88,15.26,13.42,8.39-.36,6.78-12.14,16.07-13.29,6.67-.31,9.56,11,19.13,6.43,7.62-3.62,1.72-13.87,9.88-18.57,6-2.89,12.94,6.4,20.08-1.54,5.68-6.33-3.61-13.48,2.17-21,4.5-5,14.35.85,18-9.28,2.89-8.06-8.37-11-5.85-20.26C246.63,107.76,257.93,109.34,257.49,98.57Z" />
                        <ellipse id="sun-bg" class="sun-center" cx="165.72" cy="97.84" rx="60.27" ry="59.57" />
                    </g>
                    <path id="cloud" data-name="cloud" class="cloud" d="M438.36,136.12c-8.4-6.58-17.92-9-26.78-4-4.51-5.85-13.63-10.68-20.8-11.35a27.4,27.4,0,0,0-14.56,2.41,21,21,0,0,0-9.51,9,18.38,18.38,0,0,0-1.66,4.77,15.76,15.76,0,0,0-5.87.53,16.32,16.32,0,0,0-8.67,6.14c-2.3,3.2-3.49,7.45-2,11.25,2.89,7.56,11.8,5.94,18.34,6,11.53.17,16.05,0,26.59-.07,14.84-.11,28.39.09,44.92-.57,2.24-.09,5-3.73,5.76-5.69C448.39,144.16,440.08,137.57,438.36,136.12Z" />

                </g>
                <g id="desert" data-name="desert" class="desert">
                    <path id="mountain" data-name="mountain" class="mountain color-fade-transition" d="M60.87,386.8l26.42-14.43a96,96,0,0,0-1.56-12c-4.2-25.54-4.39-51.56-4.57-77.44-.07-10.56-.22-31.67-.22-31.67L56,256s-1.9-31.39.42-56.17c-8.94-.46-8.76-1.63-18.27.84-2,.52-5.44,1.93-5.34,1.38,1.12-6.19-1.8-12.76-1.74-18.24.28-26.39,1.36-28.68-.32-49.52L28,135A250.23,250.23,0,0,0,42.74,389.82C50.07,389.31,58.17,388.28,60.87,386.8Z" />
                    <path id="sand-04" class="sand-04 color-fade-transition" d="M397,333.22c-40.4-.62-80-18.35-120.44-15.54-17.49,5.25-21-6.43-37.09-.34a402,402,0,0,0-84.67,33.42c11.54,1.51,23.27,5.71,35.59,12.05,32.58,14.61,65.2,29.24,96.72,46,58.71-31.32,117.11-56,187-55.58a10.33,10.33,0,0,0,4.18-1c1.18-2.75,3.54-7.79,7.71-19.39C460.84,310.19,425.73,332.07,397,333.22Z" />
                    <g id="cactus-02">
                        <path id="cactus-body" class="cactus-body color-fade-transition" d="M439,264.27c-.48-5.65-2.14-12.54-7.27-15.46-1.61-.23-2.22,2-2.31,3.63a31.63,31.63,0,0,1-10.67,21.66c-2.71-16-3.12-32.22-6.8-47.85-2-4.38-5.76-8.58-10.58-9.59a7.16,7.16,0,0,0-8.61,6.24c-7.4,31-8.55,61.82-4.26,94.57a58.84,58.84,0,0,1-23.7-36.84c-.33-1.81-.71-3.85-2.25-4.86-6.73-4.41-8.82,13.29-8.38,18.45,1.86,20.31,18.2,44.89,37.73,50.87,1,11.12,1.73,22.34,2.74,22.56,1.49.32,11.84-.91,13.33-1.21,5.28-1,13.23.2,17.75-2.71-.49-20.52-2-49.24-4.4-69C433.52,290.34,440,276.79,439,264.27Z" />
                        <path id="flower" class="cactus-flower color-fade-transition" d="M413.17,215.44c-.17-4.35-5-2.76-6.05.89,3-4.29-1.52-16.85-4.57-6.8-2.09-4.81-8.4-1.9-5.12,2.6-7.41-4.07-11.77,4-2.09,5.28-2.49.48-3.73,4-1.6,5.63,2.89,1.56,7.66.83,9-2.49-.63,6.16,10.31,3.94,7.54-.57,1.56.57,3.32-1.37,1.88-2.58A3.25,3.25,0,0,0,413.17,215.44Z" />
                    </g>
                    <g id="cactus-02">
                        <path id="cactus-body-2" data-name="cactus-body" class="cactus-body color-fade-transition" d="M259.32,307.43c-5-2.06-10.43.84-13.55,3,.73-4.65-.69-9.72-3-14.17,10.76-.41,18.7-17.91,10.26-26.3-11.26-7.07-21.93,6.61-21.15,16.4-20.38-2.39-12.52,33.92,2.81,35.47-3.52,6.24-4.88,12.82-3.32,19.05a19.37,19.37,0,0,0-8.86.08C227,329,217.15,313.88,204.87,323c-5.74-13-26-14.08-25.7,3.93,1.08,13,9.83,22.56,22.3,16.08a14.42,14.42,0,0,0,8.67,6.95c-5.62,8.53-4.2,20.08-1.42,28.94,16.62,35.1,47.7-1.4,34.44-26.92C260.19,348.82,275.41,314.07,259.32,307.43Z" />
                        <g id="flowers">
                            <path class="cactus-flower color-fade-transition" d="M187.62,302.69a8.47,8.47,0,0,0-5.26,4c-2-4.07-9.07-1.21-7.81,3.12-9.63.4-5.14,12.6,2.73,9.56,1.14-.38,4.35-1.39,4.35-1.39,2.43-3.48,7.51-4.49,9.06-7.93C193.52,306.88,192.69,301.78,187.62,302.69Z" />
                            <path class="cactus-flower color-fade-transition" d="M261.82,256.1c-2.2-4.68-8.11-3.12-11.09-.09,1.58-2.9,2.77-5.93,2.56-9.35,0-5.08-4.33-3.44-6.13-.32a19.58,19.58,0,0,0-3.41,12.53c-10-15.84-21.09,2.67-4.3,8.53a10.28,10.28,0,0,0,5.78.69c3.24-.33,3.7.57,4.71.13C254.63,265.84,264,262.92,261.82,256.1Z" />
                        </g>
                    </g>
                    <path id="sand-01" class="sand-01 color-fade-transition" d="M361,421.5c-25.73-3.65-40.79-6.53-62.84-8.88-4.87-.52-10.07-1-15.81-1.48-54.49-1.08-113.67,66-166.95,49.35a2.71,2.71,0,0,1,.67.63c32.86,23.65,86.38,39.58,135.66,39.58,73.88,0,144.87-33.19,184.34-83.7C419.71,428.57,380.41,424.25,361,421.5Z" />
                    <path id="sand-02" class="sand-02 color-fade-transition" d="M115.37,460.49c53.28,16.67,112.46-48.43,167-47.35,5.59.46,10.67.94,15.42,1.44-34.8-19.22-71.13-35.51-107.4-51.77-30.82-15.86-57.94-18.33-87.6,1.13L60.87,386.8c-2.71,1.48-10.8,2.51-18.14,3h0A251.32,251.32,0,0,0,116,461.11,3.1,3.1,0,0,0,115.37,460.49Z" />
                    <path id="succulent-body-01" class="cactus-body color-fade-transition" d="M97.15,369.74c-2.57.21-5.31-.66-7.66.86a12.17,12.17,0,0,0,1.77-9.09.4.4,0,0,0-.76-.14c-1.57,2.36-4.21,3.84-5.49,6.49.6-.9-2.45-11.68-3.45-9.32-1.12,3-4,5.57-3.43,9.14-1.9-2.44-5.09-3-7.37-4.83-.27-.29-.82.09-.64.44,1.24,2.43,1.45,5.27,2.86,7.61a48.31,48.31,0,0,1-6.13.55.41.41,0,0,0-.37.43A9.54,9.54,0,0,0,73,377.31c-1.08.81-5.62,4.05-4.88,5.33,4.44,2.79,9.75.52,12.78-3.25a7.09,7.09,0,0,0,6.29-3.48c4.06-.15,8.19-2,10.4-5.59A.41.41,0,0,0,97.15,369.74Z" />
                    <path id="sand-03" data-name="sand-03" class="sand-03 color-fade-transition" d="M280,413.14h2.33c5.74.47,10.94,1,15.81,1.48,22.05,2.35,37.11,5.23,62.84,8.88,19.44,2.75,58.71,5.07,75-6.49a250.28,250.28,0,0,0,42.29-65c-83.68.42-138.1,28.06-199.35,61.15h1Z" />
                    <path id="succulent-body-02" class="cactus-body color-fade-transition" d="M380.55,412.55c1.34-2.11,4.26-6.49,5.94-16.08a60,60,0,0,0-15.4,10c1-6.74-.89-11.6-2.95-18.29-4.74,7.44-7.53,12.69-8.75,16.65-2.82-4.05-6.95-6.51-16-11.33-.54,6.43,2.4,14.84,6.4,19.85-6.52-.17-14.28.89-19.8.61,8.17,9.36,25.55,18.16,36.68,13.16,10.52,2.52,22.66-6.57,32.23-10.15A54.13,54.13,0,0,0,380.55,412.55Z" />
                </g>
            </g>
        </g>

    </svg>
    <div class="explanation">

        <p> Change one (or many) properties between 2 states, from <span class="accent">A</span> to <span class="accent">B</span> on a specific CSS trigger (hover/touch the illustration). </p>
    </div>
</div>

<div class="solar-system-animation">
    <div class="heading">
        <p class="smallnumber"> 102.</p>
        <h1> CSS Animations </h1>
    </div>
    <svg id="animation-scene" class="animation-scene" viewBox="0 0 1400 1400">
        <title>CSS Animations illustrated</title>
        <desc>An little earth illustration with a little moon orbiting around it, the whole itself orbiting around a yellow pusling sun.</desc>
        <g id="Solar-system">
            <circle id="sun-path" class="astral-paths earth-path" cx="700" cy="700" r="446.73" />
            <g id="system-sun" class="system-sun">
                <g class="shadow-02-container">
                    <path id="Shadow-2" class="sun-system-shadow-02" d="M891,701.53c-.73-17.83-24.69-14.39-27-34.15-.62-14.17,22.33-20.33,13.08-40.67-7.35-16.19-28.2-3.64-37.76-21-5.88-12.84,13-27.52-3.14-42.69-12.85-12.07-27.42,7.67-42.74-4.61-10.24-9.56,1.73-30.51-18.88-38.2-16.4-6.13-22.46,17.81-41.22,12.46-13-4.82-9.83-28.86-31.75-27.91-17.44.76-14.09,25.24-33.42,27.64-13.85.64-19.88-22.82-39.78-13.36-15.84,7.52-3.57,28.83-20.54,38.6-12.56,6-26.91-13.3-41.75,3.22-11.82,13.14,7.49,28-4.52,43.69-9.36,10.47-29.85-1.76-37.38,19.31-6,16.76,17.41,23,12.18,42.13-4.72,13.33-28.24,10-27.31,32.46.73,17.83,24.69,14.39,27,34.15.62,14.17-22.33,20.33-13.08,40.67,7.35,16.19,28.19,3.64,37.75,21,5.89,12.84-13,27.51,3.14,42.69,12.86,12.07,27.43-7.68,42.76,4.61,10.22,9.56-1.73,30.51,18.87,38.2,16.4,6.13,22.46-17.81,41.22-12.46,13,4.82,9.83,28.86,31.75,27.91,17.45-.76,14.09-25.24,33.42-27.64,13.85-.64,19.88,22.82,39.78,13.36,15.84-7.52,3.57-28.82,20.53-38.6,12.57-6,26.92,13.3,41.77-3.22,11.81-13.14-7.5-28,4.52-43.69,9.35-10.47,29.84,1.75,37.37-19.31,6-16.76-17.41-23-12.18-42.13C868.4,720.66,891.91,723.94,891,701.53Z" />
                </g>
                <g class="shadow-01-container">
                    <path id="Shadow-1" class="sun-system-shadow-01" d="M853.11,701.23c-.59-14.3-19.79-11.54-21.66-27.38-.51-11.36,17.89-16.3,10.48-32.61-5.9-13-22.61-2.92-30.27-16.82-4.72-10.29,10.43-22.06-2.52-34.22-10.31-9.68-22,6.15-34.27-3.7-8.21-7.66,1.39-24.46-15.13-30.63-13.15-4.91-18,14.28-33,10-10.46-3.87-7.88-23.14-25.45-22.38-14,.61-11.3,20.23-26.8,22.16-11.11.51-15.94-18.3-31.89-10.72-12.7,6-2.86,23.12-16.47,31-10.07,4.82-21.57-10.66-33.47,2.58-9.48,10.54,6,22.47-3.63,35-7.5,8.4-23.93-1.41-30,15.48-4.8,13.44,14,18.41,9.77,33.78-3.78,10.69-22.64,8.06-21.89,26,.59,14.3,19.79,11.54,21.66,27.38.51,11.36-17.89,16.3-10.48,32.61,5.9,13,22.6,2.92,30.27,16.81,4.72,10.3-10.44,22.07,2.52,34.23,10.31,9.68,22-6.15,34.27,3.7,8.2,7.67-1.38,24.46,15.13,30.63,13.15,4.91,18-14.28,33-10,10.46,3.87,7.88,23.14,25.45,22.38,14-.61,11.3-20.23,26.8-22.16,11.11-.51,15.94,18.3,31.89,10.72,12.7-6,2.86-23.12,16.46-31,10.07-4.82,21.58,10.66,33.48-2.58,9.48-10.54-6-22.47,3.63-35,7.5-8.39,23.93,1.4,30-15.48,4.8-13.44-14-18.41-9.77-33.78C835,716.56,853.86,719.19,853.11,701.23Z" />
                </g>
                <g id="Sun-Center" class="sun-center">
                    <g id="sun-bg">
                        <ellipse class="sun-system-bg" cx="700.1" cy="700.02" rx="112.62" ry="111.31" />
                    </g>
                    <g id="solar-pattern" class="sun-system-patterns">

                        <path d="M645.23,691.65c-22.92-1.52-43.41,35.65-17.18,45.57,23.25,3.94,10-15.63,23.57-22C666.1,709.92,671.45,691.23,645.23,691.65Z" />
                        <path d="M677.68,619.74c-11,4.66,2.61,17.09,7.19,6.73C686.21,622.31,681.56,618.62,677.68,619.74Z" />
                        <path d="M677.33,650.71c-2.92-9.79-21.62-11.71-23.4-.51C626.38,669.21,686.18,680.3,677.33,650.71Z" />
                        <path d="M692.35,637.33c-4.34,0-4.35,6.75,0,6.75S696.71,637.33,692.35,637.33Z" />
                        <path d="M796.8,693.83c-2.73-40.32-54.15-24.47-22.92,8.42,3.83,12.2-32.82,31.45-1.68,34.78C789.86,732.64,796.87,710.12,796.8,693.83Z" />
                        <path d="M760.72,702c-3.23-6.51-12.89-1.75-10.73,4.83C752.53,714.43,764,708.8,760.72,702Z" />
                        <path d="M752.51,745.21c-4.35,0-4.35,6.76,0,6.76S756.87,745.21,752.51,745.21Z" />
                        <path d="M645.85,742.12c-4.35,0-4.36,6.75,0,6.75S650.2,742.12,645.85,742.12Z" />
                    </g>
                </g>
            </g>
            <g class="system-earth-moon-container">
                <g id="system-earth" class="system-earth-moon">
                    <circle class="astral-paths moon-path" cx="700" cy="257.25" r="163.79" />
                    <g id="earth" class="system-earth">
                        <circle id="Shadow-2-2" class="earth-shadow-02" cx="700" cy="255.79" r="95.31" />
                        <circle id="Shadow-1-2" class="earth-shadow-01" class="cls-5" cx="699.31" cy="256.48" r="76.5" />
                        <g id="Planet" class="planet">
                            <circle id="water-bg" class="earth-water" cx="699.7" cy="256.09" r="56.15" />
                            <g id="continents" class="earth-continent">
                                <path d="M687.11,207.26c2,4.53,8.75,4.4,11.32.86,1.82-3.13,1.9-8.09,6.22-8C702.06,200.07,679.4,198.12,687.11,207.26Z" />
                                <path d="M726.44,287.35c-6.77-1.25-15.74,18.37-7.09,17.24C725.52,302.43,734.86,289.49,726.44,287.35Z" />
                                <path d="M676.87,217.52c-2.48-13.89-8.65-9-8.58-.22C668.14,219.59,676.53,218.46,676.87,217.52Z" />
                                <path d="M753.7,240.67c-2.54-7.48-5.41-14.3-10.86-20.5a56.06,56.06,0,0,0-7.18-7.19c-17.83,3.73-24.3,9-45.48,4.27-2.71-4.14-8.38,2.63-9.53,4.15-.85.5-4.44,2.31-4.81,3.12-.55,2.89,5.34,6,1.82,9a7.84,7.84,0,0,1-4,1.22c-9.43-.13-11.36,5.3-11.92,10.35.48,11,12.69,1.25,16.93-1.65,6.47-2.64,5.35,3.6,8.22,3,5.12-1.24,22.63-4.65,16,5.07-13.25,9-15.93-10.69-35,1.3-11.15-1.69-23.4,8.5-15.33,18.65,5.8,9.29,19.07,4.11,27.05,8.78,4.92,9,2.51,19.76,8.19,28.33a12.37,12.37,0,0,0,3.79,3.12,57.43,57.43,0,0,0,6.74.55c6.64-1.9,12.85-10.16,15.21-16.53,3.59-9.8,2.31-14.54,10.42-22.33,0-6.05,2.53-14.53,10-16,9-.21,10.26,9,17.54,11.44a12.66,12.66,0,0,0,3.83-5.63,53.91,53.91,0,0,0,.45-7A56.51,56.51,0,0,0,753.7,240.67Z" />
                            </g>
                        </g>
                    </g>
                    <g id="system-moonlight" class="system-moonlight">
                        <circle id="Shadow-2-3" class="moon-shadow-02" cx="700" cy="92.85" r="40" />
                        <circle id="Shadow-1-3" class="moon-shadow-01" cx="700" cy="92.85" r="30.66" />
                        <g id="moon-system-center">
                            <circle id="moon-system-bg" class="moon-center" cx="700" cy="92.85" r="20.47" />
                            <g id="moon-pattern" class="moon-pattern">
                                <ellipse cx="692.39" cy="81.87" rx="2.95" ry="2.96" />
                                <ellipse cx="710.87" cy="101.69" rx="5.17" ry="5.27" transform="translate(607.73 812.35) rotate(-89.88)" />
                                <ellipse cx="700.69" cy="103.74" rx="2.24" ry="2.28" transform="translate(595.52 804.22) rotate(-89.88)" />
                                <ellipse cx="705.24" cy="94.63" rx="1.39" ry="1.47" transform="translate(609.17 799.68) rotate(-89.88)" />
                                <ellipse cx="713.68" cy="93.91" rx="0.59" ry="0.63" transform="translate(618.31 807.4) rotate(-89.88)" />
                                <ellipse cx="703.44" cy="78.86" rx="2.49" ry="2.63" transform="translate(623.15 782.14) rotate(-89.88)" />
                                <ellipse cx="686.07" cy="99.66" rx="1.21" ry="1.24" transform="matrix(0, -1, 1, 0, 585.01, 785.53)" />
                                <ellipse cx="689.2" cy="87.88" rx="1.21" ry="1.22" transform="matrix(0, -1, 1, 0, 599.91, 776.9)" />
                                <ellipse cx="694.15" cy="87.54" rx="1.61" ry="1.7" transform="matrix(0, -1, 1, 0, 605.19, 781.51)" />
                            </g>
                        </g>
                    </g>
                </g>
            </g>
        </g>
    </svg>
    <div class="explanation">
        <p> Change one (or many) properties between many different states and build loops using <span class="accent">keyframes</span>.</p>
    </div>
</div>

<div id="div1">
    <form action="PlaceRegister" method="get">
        <input type="submit" value="进入页面" id="input1">
    </form>
</div>
</body>
</html>

