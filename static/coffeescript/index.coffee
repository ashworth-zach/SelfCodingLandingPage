styles = """

body {
  background-color: #1a1c24; color: #fff;
  font-size: 13px; line-height: 1.4;
  -webkit-font-smoothing: subpixel-antialiased;
}
.container{
height:100px;
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
  height:90%;
}



:root {
  --size: 140px;
  --speed: 5s;
}

.Frontend::before{
color:white;
content:"Frontend";
}
.github::before{color:white;content:"See my pinned repositories on github for projects";}
.react::before{content:"React";}
.angular::before{content:"Angular";}
.js::before{content:"Javascript and JQuery";}
.backend::before{color:white;content:"Backend"}
.flask::before{content:"Flask";}
.django::before{content:"Django";}
.asp::before{content:".Net, and Entity framework";}
.mean::before{content:"Full stack MEAN";}
.databases::before{color:white;content:"Databases";}
.mongo::before{content:"MongoDB";}
.mysql::before{content:"MySQL";}



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

