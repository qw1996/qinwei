<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<style>
.error{color:red;}
/* remove codrops styles and reset the whole thing */
#container_demo{
	 text-align: left;
	 margin: 0;
	 padding: 0;
	 margin: 0 auto;
	 font-family: "Trebuchet MS","Myriad Pro",Arial,sans-serif;
}


a.hiddenanchor{
	display: none;
}
/** The wrapper that will contain our two forms **/
#wrapper{
	width: 60%;
	right: 0px;
	min-height: 560px;	
	margin: 0px auto;	
	width: 500px;
	position: relative;	
}
/**** Styling the form elements **/

/**** general text styling ****/
#wrapper a{
	color: rgb(95, 155, 198);
	text-decoration: underline;
}

#wrapper h1{
	font-size: 48px;
	color: rgb(6, 106, 117);
	padding: 2px 0 10px 0;
	font-family: 'FranchiseRegular','Arial Narrow',Arial,sans-serif;
	font-weight: bold;
	text-align: center;
	padding-bottom: 30px;
}
/** For the moment only webkit supports the background-clip:text; */
#wrapper h1{
    background: -webkit-repeating-linear-gradient(-45deg, 
	rgb(18, 83, 93) , 
	rgb(18, 83, 93) 20px, 
	rgb(64, 111, 118) 20px, 
	rgb(64, 111, 118) 40px, 
	rgb(18, 83, 93) 40px);
	-webkit-text-fill-color: transparent;
	-webkit-background-clip: text;
}
#wrapper h1:after{
	content: ' ';
	display: block;
	width: 100%;
	height: 2px;
	margin-top: 10px;
	background: -moz-linear-gradient(left, rgba(147,184,189,0) 0%, rgba(147,184,189,0.8) 20%, rgba(147,184,189,1) 53%, rgba(147,184,189,0.8) 79%, rgba(147,184,189,0) 100%); 
	background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(147,184,189,0)), color-stop(20%,rgba(147,184,189,0.8)), color-stop(53%,rgba(147,184,189,1)), color-stop(79%,rgba(147,184,189,0.8)), color-stop(100%,rgba(147,184,189,0))); 
	background: -webkit-linear-gradient(left, rgba(147,184,189,0) 0%,rgba(147,184,189,0.8) 20%,rgba(147,184,189,1) 53%,rgba(147,184,189,0.8) 79%,rgba(147,184,189,0) 100%); 
	background: -o-linear-gradient(left, rgba(147,184,189,0) 0%,rgba(147,184,189,0.8) 20%,rgba(147,184,189,1) 53%,rgba(147,184,189,0.8) 79%,rgba(147,184,189,0) 100%); 
	background: -ms-linear-gradient(left, rgba(147,184,189,0) 0%,rgba(147,184,189,0.8) 20%,rgba(147,184,189,1) 53%,rgba(147,184,189,0.8) 79%,rgba(147,184,189,0) 100%); 
	background: linear-gradient(left, rgba(147,184,189,0) 0%,rgba(147,184,189,0.8) 20%,rgba(147,184,189,1) 53%,rgba(147,184,189,0.8) 79%,rgba(147,184,189,0) 100%); 
}

#wrapper p{
	margin-bottom:15px;
}
#wrapper p:first-child{
	margin: 0px;
}
#wrapper label{
	color: rgb(64, 92, 96);
	position: relative;
}

/**** advanced input styling ****/
/* placeholder */
::-webkit-input-placeholder  { 
	color: rgb(190, 188, 188); 
	font-style: italic;
}
input:-moz-placeholder,
textarea:-moz-placeholder{ 
	color: rgb(190, 188, 188);
	font-style: italic;
} 
input {
  outline: none;
}

/* all the input except submit and checkbox */
#wrapper input:not([type="checkbox"]){
	width: 92%;
	margin-top: 4px;
	padding: 10px 5px 10px 32px;	
	border: 1px solid rgb(178, 178, 178);
	-webkit-appearance: textfield;
	-webkit-box-sizing: content-box;
	  -moz-box-sizing : content-box;
	       box-sizing : content-box;
	-webkit-border-radius: 3px;
	   -moz-border-radius: 3px;
	        border-radius: 3px;
	-webkit-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.6) inset;
	   -moz-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.6) inset;
	        box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.6) inset;
	-webkit-transition: all 0.2s linear;
	   -moz-transition: all 0.2s linear;
	     -o-transition: all 0.2s linear;
	        transition: all 0.2s linear;
}
#wrapper input:not([type="checkbox"]):active,
#wrapper input:not([type="checkbox"]):focus{
	border: 1px solid rgba(91, 90, 90, 0.7);
	background: rgba(238, 236, 240, 0.2);	
	-webkit-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9) inset;
	   -moz-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9) inset;
	        box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9) inset;
} 

/** the magic icon trick ! **/
[data-icon]:after {
    content: attr(data-icon);
    font-family: 'FontomasCustomRegular';
    color: rgb(106, 159, 171);
    position: absolute;
    left: 10px;
    top: 35px;
	width: 30px;
}

/*styling both submit buttons */
#wrapper p.button input{
	width: 30%;
	cursor: pointer;	
	background: rgb(61, 157, 179);
	padding: 8px 5px;
	font-family: 'BebasNeueRegular','Arial Narrow',Arial,sans-serif;
	color: #fff;
	font-size: 24px;	
	border: 1px solid rgb(28, 108, 122);	
	margin-bottom: 10px;	
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.5);
	-webkit-border-radius: 3px;
	   -moz-border-radius: 3px;
	        border-radius: 3px;	
	-webkit-box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.07) inset,
	        0px 0px 0px 3px rgb(254, 254, 254),
	        0px 5px 3px 3px rgb(210, 210, 210);
	   -moz-box-shadow:0px 1px 6px 4px rgba(0, 0, 0, 0.07) inset,
	        0px 0px 0px 3px rgb(254, 254, 254),
	        0px 5px 3px 3px rgb(210, 210, 210);
	        box-shadow:0px 1px 6px 4px rgba(0, 0, 0, 0.07) inset,
	        0px 0px 0px 3px rgb(254, 254, 254),
	        0px 5px 3px 3px rgb(210, 210, 210);
	-webkit-transition: all 0.2s linear;
	   -moz-transition: all 0.2s linear;
	     -o-transition: all 0.2s linear;
	        transition: all 0.2s linear;
}
#wrapper p.button input:hover{
	background: rgb(74, 179, 198);
}
#wrapper p.button input:active,
#wrapper p.button input:focus{
	background: rgb(40, 137, 154);
	position: relative;
	top: 1px;
	border: 1px solid rgb(12, 76, 87);	
	-webkit-box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.2) inset;
	   -moz-box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.2) inset;
	        box-shadow: 0px 1px 6px 4px rgba(0, 0, 0, 0.2) inset;
}
p.login.button,
p.signin.button{
	text-align: right;
	margin: 5px 0;
}


/* styling the checkbox "keep me logged in"*/
.keeplogin{
	margin-top: -5px;
}
.keeplogin input,
.keeplogin label{
	display: inline-block;
	font-size: 12px;	
	font-style: italic;
}
.keeplogin input#loginkeeping{
	margin-right: 5px;
}
.keeplogin label{
	width: 80%;
}


/*styling the links to change from one form to another */

p.change_link{
	position: absolute;
	color: rgb(127, 124, 124);
	left: 0px;
	height: 20px;
	width: 440px;
	padding: 17px 30px 20px 30px;
	font-size: 16px	;
	text-align: right;
	border-top: 1px solid rgb(219, 229, 232);
	-webkit-border-radius: 0 0  5px 5px;
	   -moz-border-radius: 0 0  5px 5px;
	        border-radius: 0 0  5px 5px;
	background: rgb(225, 234, 235);
	background: -moz-repeating-linear-gradient(-45deg, 
	rgb(247, 247, 247) , 
	rgb(247, 247, 247) 15px, 
	rgb(225, 234, 235) 15px, 
	rgb(225, 234, 235) 30px, 
	rgb(247, 247, 247) 30px
	);
	background: -webkit-repeating-linear-gradient(-45deg, 
	rgb(247, 247, 247) , 
	rgb(247, 247, 247) 15px, 
	rgb(225, 234, 235) 15px, 
	rgb(225, 234, 235) 30px, 
	rgb(247, 247, 247) 30px
	);
	background: -o-repeating-linear-gradient(-45deg, 
	rgb(247, 247, 247) , 
	rgb(247, 247, 247) 15px, 
	rgb(225, 234, 235) 15px, 
	rgb(225, 234, 235) 30px, 
	rgb(247, 247, 247) 30px
	);
	background: repeating-linear-gradient(-45deg, 
	rgb(247, 247, 247) , 
	rgb(247, 247, 247) 15px, 
	rgb(225, 234, 235) 15px, 
	rgb(225, 234, 235) 30px, 
	rgb(247, 247, 247) 30px
	);
}
#wrapper p.change_link a {
	display: inline-block;
	font-weight: bold;
	background: rgb(247, 248, 241);
	padding: 2px 6px;
	color: rgb(29, 162, 193);
	margin-left: 10px;
	text-decoration: none;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	border: 1px solid rgb(203, 213, 214);
	-webkit-transition: all 0.4s linear;
	-moz-transition: all 0.4s  linear;
	-o-transition: all 0.4s linear;
	-ms-transition: all 0.4s  linear;
	transition: all 0.4s  linear;
}
#wrapper p.change_link a:hover {
	color: rgb(57, 191, 215);
	background: rgb(247, 247, 247);
	border: 1px solid rgb(74, 179, 198);
}
#wrapper p.change_link a:active{
	position: relative;
	top: 1px;
}
/** Styling both forms **/
#register, 
#login{
	position: absolute;
	top: 0px;
	width: 88%;	
	padding: 18px 6% 60px 6%;
	margin: 0 0 35px 0;
	background: rgb(247, 247, 247);
	border: 1px solid rgba(147, 184, 189,0.8);
	-webkit-box-shadow: 0pt 2px 5px rgba(105, 108, 109,  0.7),	0px 0px 8px 5px rgba(208, 223, 226, 0.4) inset;
	   -moz-box-shadow: 0pt 2px 5px rgba(105, 108, 109,  0.7),	0px 0px 8px 5px rgba(208, 223, 226, 0.4) inset;
	        box-shadow: 0pt 2px 5px rgba(105, 108, 109,  0.7),	0px 0px 8px 5px rgba(208, 223, 226, 0.4) inset;
	-webkit-box-shadow: 5px;
	-moz-border-radius: 5px;
		 border-radius: 5px;
}
#register{	
	z-index: 21;
	opacity: 0;
}
#login{
	z-index: 22;
}
#toregister:target ~ #wrapper #register,
#tologin:target ~ #wrapper #login{
	z-index: 22;
	-webkit-animation-name: fadeInLeft;
	-moz-animation-name: fadeInLeft;
	-ms-animation-name: fadeInLeft;
	-o-animation-name: fadeInLeft;
	animation-name: fadeInLeft;
	-webkit-animation-delay: .1s;
	-moz-animation-delay: .1s;
	-o-animation-delay: .1s;
	-ms-animation-delay: .1s;
	animation-delay: .1s;
}
#toregister:target ~ #wrapper #login,
#tologin:target ~ #wrapper #register{
	-webkit-animation-name: fadeOutLeft;
	-moz-animation-name: fadeOutLeft;
	-ms-animation-name: fadeOutLeft;
	-o-animation-name: fadeOutLeft;
	animation-name: fadeOutLeft;
}

/** the actual animation, credit where due : http://daneden.me/animate/ ***/
.animate{
	-webkit-animation-duration: 0.5s;
	-webkit-animation-timing-function: ease;
	-webkit-animation-fill-mode: both;
	
	-moz-animation-duration: 0.5s;
	-moz-animation-timing-function: ease;
	-moz-animation-fill-mode: both;
	
	-o-animation-duration: 0.5s;
	-o-animation-timing-function: ease;
	-o-animation-fill-mode: both;
	
	-ms-animation-duration: 0.5s;
	-ms-animation-timing-function: ease;
	-ms-animation-fill-mode: both;
	
	animation-duration: 0.5s;
	animation-timing-function: ease;
	animation-fill-mode: both;
}

/** yerk some ugly IE fixes 'cause I know someone will ask "why does it look ugly in IE?", no matter how many warnings I will put in the article */

.lt8 #wrapper input{
	padding: 10px 5px 10px 32px;
    width: 92%;
}
.lt8 #wrapper input[type=checkbox]{
	width: 10px;
	padding: 0;
}
.lt8 #wrapper h1{
	color: #066A75;
}
.lt8 #register{	
	display: none;
}
.lt8 p.change_link,
.ie9 p.change_link{
	position: absolute;
	height: 90px;
	background: transparent;
}


/* CSS reset */
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,p,blockquote,th,td { 
	margin:0;
	padding:0;
}
html,body {
	margin:0;
	padding:0;
	height: 100%;
}
table {
	border-collapse:collapse;
	border-spacing:0;
}
fieldset,img { 
	border:0;
}
address,caption,cite,code,dfn,th,var {
	font-style:normal;
	font-weight:normal;
}
ol,ul {
	list-style:none;
}
caption,th {
	text-align:left;
}
h1,h2,h3,h4,h5,h6 {
	font-size:100%;
	font-weight:normal;
}
q:before,q:after {
	content:'';
}
abbr,acronym { border:0;
}
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
	display: block;
}
/* General Demo Style */
body{
	font-family: Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
	background: #fff url(../images/bg.jpg) repeat top left;
	font-weight: 400;
	font-size: 15px;
	color: #1d3c41;
	overflow-y: scroll;
}
a{
	color: #333;
	text-decoration: none;
}
.container{
	width: 100%;
	height: 100%;
	position: relative;
	text-align: center;
}
.clr{
	clear: both;
}
.container > header{
	padding: 20px 30px 10px 30px;
	margin: 0px 20px 10px 20px;
	position: relative;
	display: block;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
    text-align: center;
}
.container > header h1{
	font-family: 'BebasNeueRegular', 'Arial Narrow', Arial, sans-serif;
	font-size: 35px;
	line-height: 35px;
	position: relative;
	font-weight: 400;
	color: rgba(26,89,120,0.9);
	text-shadow: 1px 1px 1px rgba(0,0,0,0.1);
    padding: 0px 0px 5px 0px;
}
.container > header h1 span{
	color: #7cbcd6;
	text-shadow: 0px 1px 1px rgba(255,255,255,0.8);
}
.container > header h2{
	font-size: 16px;
	font-style: italic;
	color: #2d6277;
	text-shadow: 0px 1px 1px rgba(255,255,255,0.8);
}
/* Header Style */
.codrops-top{
	line-height: 24px;
	font-size: 11px;
	background: rgba(255, 255, 255, 0.4);
	text-transform: uppercase;
	z-index: 9999;
	position: relative;
	box-shadow: 1px 0px 2px rgba(0,0,0,0.2);
}
.codrops-top a{
	padding: 0px 10px;
	letter-spacing: 1px;
	color: #333;
	text-shadow: 0px 1px 1px #fff;
	display: block;
	float: left;
}
.codrops-top a:hover{
	background: #fff;
}
.codrops-top span.right{
	float: right;
}
.codrops-top span.right a{
	float: left;
	display: block;
}

.codrops-demos{
	text-align:center;
	display: block;
	padding: 14px;
}
.codrops-demos span{
	display: inline-block;
	padding-right: 15px;
	text-shadow: 1px 1px 1px rgba(255, 255, 255, 0.8);
}
.codrops-demos a,
.codrops-demos a.current-demo,
.codrops-demos a.current-demo:hover{
    display: inline-block;
	font-style: italic;
	font-size: 12px;
	padding: 3px 5px;
	margin: 0px 3px;
	font-weight: 800;
	box-shadow: 1px 1px 1px rgba(0,0,0,0.05) inset;
	color: #fff;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.1);
	background: rgba(104,171,194,0.5);
}
.codrops-demos a:hover{
	background: #4fa2c4;
}
.codrops-demos a.current-demo,
.codrops-demos a.current-demo:hover{
	color: rgba(104,171,194,1);
	background: rgba(255,255,255,0.9);
	box-shadow: 0px 1px 1px rgba(0,0,0,0.1);
}





</style>

 <head>
    </head>
    <body>
        <div class="container">
		    <br/><br/>
            <header>
                <h1>Login and Registration Form <span>with HTML5 and CSS3</span></h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="" method="post"> 
                                <h1>Log in</h1> 
                                <p> 
                                    <label for="username" class="uname"> Input your username here </label>
                                    <input id="username" name="username" required="required" type="text" />
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" > Input Your password here </label>
                                    <input id="password" name="password" required="required" type="password"/> 
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="rememberMe" id="loginkeeping" value="true" /> 
									<label for="loginkeeping">Keep me logged in</label>
								</p>
                                <p class="login button"> 
                                    <input type="submit" value="Login"  onClick="msg();" /> 
								</p>
                            </form>
                        </div>
                        		
                    </div>
                </div>

                <div id="error" style="text-align:center;">
                    <c:if test="${not empty error}"> <script>alert('${error}')</script> </c:if>
           			<c:if test="${not empty param.kickout}"><script>alert('您被踢出登录。')</script></c:if>
                </div>
                
                  
            </section>
        </div>
        
    </body>
</html>