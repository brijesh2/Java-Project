<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="style.css" rel="stylesheet" type="text/css"> 
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300" type="text/css" />
 <style>

body {
	width: 100wh;
	height: 90vh;
	color: #fff;
	background: linear-gradient(-45deg, #EE7752, #E73C7E, #23A6D5, #23D5AB);
	background-size: 400% 400%;
	-webkit-animation: Gradient 15s ease infinite;
	-moz-animation: Gradient 15s ease infinite;
	animation: Gradient 15s ease infinite;
}

@-webkit-keyframes Gradient {
	0% {
		background-position: 0% 50%
	}
	50% {
		background-position: 100% 50%
	}
	100% {
		background-position: 0% 50%
	}
}

@-moz-keyframes Gradient {
	0% {
		background-position: 0% 50%
	}
	50% {
		background-position: 100% 50%
	}
	100% {
		background-position: 0% 50%
	}
}

@keyframes Gradient {
	0% {
		background-position: 0% 50%
	}
	50% {
		background-position: 100% 50%
	}
	100% {
		background-position: 0% 50%
	}
}


h6 {
	font-family: 'Open Sans';
	font-weight: 300;
	text-align: center;
	position: absolute;
	top: 45%;
	right: 0;
	left: 0;
}

</style> 
</head>
<body background="main.jpg">
<i class="fa fa-arrow-left"></i>

<!--   <a href="#default" class="logo"><img src="main.jpg" alt="IMG"></a> -->

<div class="header">


  <div class="header-right">

    <a href="./Signout.jsp">Signout</a>
  </div>
   <center><h1>Welcome to HelpDesk</h1></center>
</div>

 <div>
  <h1><center>Articles that may help you</center></h1><i class="fa fa-arrow-left"></i>
<div id="mySidenav" class="sidenav"><br>&nbsp;&nbsp;&nbsp;&nbsp;<br>

  <a href="./ComplaintForm.jsp" id="about">Create Issue</a>
    <a href="./ViewComplaint.jsp" id="blog">View Complain</a><br>
     <a href="./FAQImp" id="projects">FAQ</a>
</div>

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
   <a href="TopBlogs.jsp"><button class="button button1">Top 10 Blogs</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="Quora.jsp"><button class="button button2">Quora</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="GeeksForGeeks.jsp"><button class="button button3">Geeks For Geeks</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="TedTalks.jsp"><button class="button button4">Ted Talks</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="TimesOfIndia.jsp"><button class="button button5">Times of India Blogs</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
  
  
<!-- </div>
 --> </div>  
</body>
</html> 
