<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html><html class=''>
<head><meta charset='UTF-8'><meta name="robots" content="noindex">
<style class="cp-pen-styles">@import url(http://fonts.useso.com/css?family=Merriweather:900);
* {
    margin: 0;
    padding: 0;
    -webkit-user-select:none;
       -moz-user-select:none;
        -ms-user-select:none;
            user-select:none;
}

html {
    height: 100%;
    overflow: hidden;
}

canvas {
    z-index: 1;
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    font-family: 'Merriweather', serif;
}

.container {
    z-index: 3;
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100vh;
    background: -webkit-radial-gradient(center, ellipse, hsla(0, 0%, 0%, 0) 0%, hsla(0, 0%, 0%, 0) 19%, hsla(0, 0%, 0%, 0.9) 100%);
    background: radial-gradient(ellipse at center, hsla(0, 0%, 0%, 0) 0%, hsla(0, 0%, 0%, 0) 19%, hsla(0, 0%, 0%, 0.9) 100%); 
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr = '#00000000', endColorstr = '#e6000000', GradientType = 1); 
}

.container div {
    position: absolute;
    left: 0;
    top: -20%;
    width: 100%;
    height: 20%;
    background-color: hsla(0, 0%, 0%, .09);
    box-shadow: 0 0 10px hsla(0, 0%, 0%, .2);
    -webkit-animation: waves 12s linear infinite;
            animation: waves 12s linear infinite;
}

.container div:nth-child(1) {
    -webkit-animation-delay: 0;
            animation-delay: 0;
}

.container div:nth-child(2) {
    -webkit-animation-delay: 4s;
            animation-delay: 4s;
}

.container div:nth-child(3) {
    -webkit-animation-delay: 8s;
            animation-delay: 8s;
}

@-webkit-keyframes waves {
    0% {
        top: -20%;
    }
    100% {
        top: 100%;
    }
}

@keyframes waves {
    0% {
        top: -20%;
    }
    100% {
        top: 100%;
    }
}

h1 {
    z-index: 3;
    position: absolute;
    font: bold 20vw 'Merriweather', serif;
    left: 50%;
    top: 50%;
    margin-top: -10vh;
    width: 100%;
    margin-left: -50%;
    height: 20vw;
    text-align: center;
    color: transparent;
    text-shadow: 0 0 30px hsla(0, 0%, 0%, .5);
    -webkit-animation: flicks .8s linear infinite;
            animation: flicks .8s linear infinite;
}

h2 {
    z-index: 2;
    position: absolute;
    font: bold 5.5vw 'Merriweather', serif;
    left: 51%;
    top: 40%;
    width: 90%;
    margin-left: -45%;
    height: 50vw;
    text-align: center;
    color: transparent;
    text-shadow: 0 0 12px hsla(0, 0%, 0%, .5);
    -webkit-animation: flicks 1.5s linear infinite;
            animation: flicks 1.5s linear infinite;
}
span{
   font-size:7.5vw;
   text-shadow: 0 0 24px hsla(0, 0%, 0%, 1);
   -webkit-animation: spanflicks 1s linear infinite;
           animation: spanflicks 1s linear infinite;
}
h3{
  z-index:2;
  position: absolute;
  font: bold 3vw 'Merriweather', serif;
  left: 51%;
  top: 30%;
  width: 90%;
  margin-left: -45%;
  height: 50vw;
  text-align: center;
  color: transparent;
  text-shadow: 0 0 12px hsla(0, 0%, 0%, .4);
  -webkit-animation: flicks 1s linear infinite;
          animation: flicks 1s linear infinite;
}


@-webkit-keyframes flicks {
    0% {
        text-shadow: 0 0 30px hsla(0, 0%, 0%, .5);
    }
    33% {
      color: hsla(0,0%,0%,.4);
      text-shadow: 0 0 10px hsla(0, 0%, 0%, .4);
    }
    66% {
        color: transparent;
        text-shadow: 0 0 20px hsla(0, 0%, 0%, .2);
    }
    100% {
        color: hsla(0,0%,0%,.5);
        text-shadow: 0 0 40px hsla(0, 0%, 0%, .8);
    }
}


@keyframes flicks {
    0% {
        text-shadow: 0 0 30px hsla(0, 0%, 0%, .5);
    }
    33% {
      color: hsla(0,0%,0%,.4);
      text-shadow: 0 0 10px hsla(0, 0%, 0%, .4);
    }
    66% {
        color: transparent;
        text-shadow: 0 0 20px hsla(0, 0%, 0%, .2);
    }
    100% {
        color: hsla(0,0%,0%,.5);
        text-shadow: 0 0 40px hsla(0, 0%, 0%, .8);
    }
}

@-webkit-keyframes spanflicks {
    0% {
        text-shadow: 0 0 30px hsla(0, 0%, 0%, .5);
    }
    33% {
      color: hsla(0,0%,0%,.4);
      text-shadow: 0 0 10px hsla(2, 95%, 15%, .5);
    }
    66% {
        color: transparent;
        text-shadow: 0 0 20px hsla(2, 95%, 15%, .2);
    }
    100% {
        color: hsla(0,0%,0%,.5);
        text-shadow: 0 0 40px hsla(2, 95%, 15%, .1);
    }
}

@keyframes spanflicks {
    0% {
        text-shadow: 0 0 30px hsla(0, 0%, 0%, .5);
    }
    33% {
      color: hsla(0,0%,0%,.4);
      text-shadow: 0 0 10px hsla(2, 95%, 15%, .5);
    }
    66% {
        color: transparent;
        text-shadow: 0 0 20px hsla(2, 95%, 15%, .2);
    }
    100% {
        color: hsla(0,0%,0%,.5);
        text-shadow: 0 0 40px hsla(2, 95%, 15%, .1);
    }
}</style></head><body>

<h2>很抱歉！您指的的网页无法访问！<span>糟糕！</span></h2>
<h3>攻城狮正在速度解决!</h3>

<div class="container">
    <div><h1>-500-</h1></div>
    <div></div>
    <div></div>
</div>
<canvas id="canv"></canvas>

<script>
//论一个外国银的个性命名。
var noise = ( function () {
        var ب_ب;   
        var ಥ_ಥ;   
        var imgData;  
        var px;  
        var w;  
        var h;  
        var flickInt;  

        var flicker = function () {
            ب_ب = document.getElementById('canv');
            ಥ_ಥ = ب_ب.getContext('2d');
            ب_ب.width = w = 700;
            ب_ب.height = h = 500;
            ಥ_ಥ.fillStyle = 'hsla(255,255%,255%,1)';
            ಥ_ಥ.fillRect(0, 0, w, h);
            ಥ_ಥ.fill();
            imgData = ಥ_ಥ.getImageData(0, 0, w, h);
            px = imgData.data;
            flickInt = setInterval(flicks, 30);
        };

        var flicks = function () {
            for (var i = 0; i < px.length; i += 4) {
                var col = (Math.random() * 255) + 50; 
                px[i] = col;
                px[i + 1] = col;
                px[i + 2] = col;
            }
            ಥ_ಥ.putImageData(imgData, 0, 0);
        };

        return {
            init: flicker
        };
    }());

    noise.init();

</script>

</body></html>