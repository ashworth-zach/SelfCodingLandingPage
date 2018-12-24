styles = """

body {
  background-color: #1a1c24; color: #fff;
  font-size: 13px; line-height: 1.4;
  -webkit-font-smoothing: subpixel-antialiased;
}


pre em:not(.comment) { font-style: normal; }

.comment       { color: #00b3ff; }
.selector      { color: #00fdd3; }
.selector .key { color: #66ff00; }
.key           { color: #ffffff; }
.value         { color: #3787ff; }

pre { 
box-shadow:20px 20px 50px 15px grey; 
  position: fixed; width: 48%;
  top: 30px; bottom: 30px; left: 52%;
  transition: left 500ms;
  overflow: auto;
  background-color: #313744; color: #a6c3d4;
  border: 1px solid white;
  padding: 24px 12px;
  box-sizing: border-box;
  border-radius: 3px;
  transform: skewY(2deg);
}

.loader,
.loader:before,
.loader:after {
  background: #ffffff;
  -webkit-animation: load1 1s infinite ease-in-out;
  animation: load1 1s infinite ease-in-out;
  width: 1em;
  height: 4em;
}
.loader {
  color: #ffffff;
  text-indent: -9999em;
  margin: 88px auto;
  position: relative;
  font-size: 11px;
  -webkit-transform: translateZ(0);
  -ms-transform: translateZ(0);
  transform: translateZ(0);
  -webkit-animation-delay: -0.16s;
  animation-delay: -0.16s;
}
.loader:before,
.loader:after {
  position: absolute;
  top: 0;
  content: '';
}
.loader:before {
  left: -1.5em;
  -webkit-animation-delay: -0.32s;
  animation-delay: -0.32s;
}
.loader:after {
  left: 1.5em;
}
@-webkit-keyframes load1 {
  0%,
  80%,
  100% {
    box-shadow: 0 0;
    height: 4em;
  }
  40% {
    box-shadow: 0 -2em;
    height: 5em;
  }
}
@keyframes load1 {
  0%,
  80%,
  100% {
    box-shadow: 0 0;
    height: 4em;
  }
  40% {
    box-shadow: 0 -2em;
    height: 5em;
  }
} 

.container{
box-shadow:20px 20px 50px 15px grey; 
background-color:blue;
background-color:lime;
background-color:yellow;
background-color:red;
  background-color: #313744; color: #a6c3d4;

  position: fixed; width: 48%;
  top: 30px; bottom: 30px; left: 0%;
  transition: left 500ms;
  overflow: auto;
  border: 1px solid white;
  padding: 24px 12px;
  box-sizing: border-box;
  border-radius: 3px;
  transform: skewY(-2deg);
}



:root {
  --size: 140px;
  --speed: 5s;
}

.test::before{
color:white;
content:"Lorem, ipsum dolor sit amet consectetur adipisicing elit. Repellendus nisi possimus adipisci magni in illum voluptates dolor, assumenda pariatur iusto, omnis cum eaque delectus reprehenderit eligendi dolorem officiis commodi molestiae temporibus vel unde deserunt iste et. Nihil sint ratione fuga dolorem aliquid, dolor cupiditate temporibus quisquam provident nemo hic maiores!";
color:grey;
}

a{
display:block;
}
.typewriter h1 {
animation-play-state:running;
}
.loader:before{
animation-play-state:paused;
display:none;
}
.loader:after{
animation-play-state:paused;
display:none;
}
.loader{
animation-play-state:paused;
display:none;
}



/* 
 *Contact me at zashworth2@gmail.com
 *Github link https://github.com/ashworth-zach
 *CodePen https://codepen.io/ashworth-zach
 */

"""


writeStyleChar = (which) ->
	# begin wrapping open comments
  if which == '/' && openComment == false
    openComment = true
    styles = $('#style-text').html() + which
  else if which == '/' && openComment == true
    openComment = false
    styles = $('#style-text').html().replace(/(\/[^\/]*\*)$/, '<em class="comment">$1/</em>')
  # wrap style declaration
  else if which == ':'
    styles = $('#style-text').html().replace(/([a-zA-Z- ^\n]*)$/, '<em class="key">$1</em>:')
  # wrap style value 
  else if which == ';'
    styles = $('#style-text').html().replace(/([^:]*)$/, '<em class="value">$1</em>;')
  # wrap selector
  else if which == '{'
    styles = $('#style-text').html().replace(/(.*)$/, '<em class="selector">$1</em>{')
  else
    styles = $('#style-text').html() + which
  $('#style-text').html styles
  $('#style-tag').append which

writeStyles = (message, index, interval) ->
  if index < message.length
    pre = document.getElementById 'style-text'
    pre.scrollTop = pre.scrollHeight
    writeStyleChar message[index++]
    setTimeout (->
      writeStyles message, index, interval
    ), interval
    

# appending the tags I'll need.
$('body').append """
  <style id="style-tag"></style>
	<pre id="style-text"></pre>
"""

# faster typing in small iframe on codepen homepage
# time = if window.innerWidth <= 578 then 4 else 16
  
# starting it off
writeStyles(styles, 0, 1)

