<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Home</title>
<style type="text/css">
*{
padding:0;
margin:0;
}
body {
 	background-image: url("https://www.screensoft.co/images/joomlart/project/Background%20Checks%20Image.png");
	background-repeat: no-repeat;
	background-size: cover;
  	height: 100%;
  	background-position: center;
}
.myButton {
	-moz-box-shadow: 0px 1px 0px 0px #1c1b18;
	-webkit-box-shadow: 0px 1px 0px 0px #1c1b18;
	box-shadow: 0px 1px 0px 0px #1c1b18;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #eae0c2), color-stop(1, #ccc2a6));
	background:-moz-linear-gradient(top, #eae0c2 5%, #ccc2a6 100%);
	background:-webkit-linear-gradient(top, #333029, 5%, #ccc2a6 100%);
	background:-o-linear-gradient(top, #eae0c2 5%, #ccc2a6 100%);
	background:-ms-linear-gradient(top, #eae0c2 5%, #ccc2a6 100%);
	background:linear-gradient(to bottom, #eae0c2 5%, #ccc2a6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#eae0c2', endColorstr='#ccc2a6',GradientType=0);
	background-color: MintCream; /* #0099FF */
	-moz-border-radius:15px;
	-webkit-border-radius:15px;
	border-radius:15px;
	border:2px solid #333029;
	display:inline-block;
	cursor:pointer;
	color: #0099FF;
	font-family:Arial;
	font-size:14px;
	font-weight:bold;
	padding:12px 16px;
	text-decoration:none;
	text-shadow:3px 1px 0px #ffffff;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ccc2a6), color-stop(1, #eae0c2));
	background:-moz-linear-gradient(top, #ccc2a6 5%, #eae0c2 100%);
	background:-webkit-linear-gradient(top, #ccc2a6 5%, #eae0c2 100%);
	background:-o-linear-gradient(top, #ccc2a6 5%, #eae0c2 100%);
	background:-ms-linear-gradient(top, #ccc2a6 5%, #eae0c2 100%);
	background:linear-gradient(to bottom, #ccc2a6 5%, #eae0c2 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ccc2a6', endColorstr='#eae0c2',GradientType=0);
	background-color:#ccc2a6;
	box-shadow: 0 8px 16px 0 rgba(255,0,0,0.2),0 17px 50px 0 rgba(0,0,0,0.19);
}
.myButton:active {
	position:relative;
	top:1px;
}
a{
color:#FFFFFF;
text-decoration:none;

}
h3{
margin-bottom:30px;
background:rgba(0,0,0,0.5);
border-radius:5px;
text-align:center;
padding-right:150px;
}
b{
font-family:Arial;
	font-size:20px;
	font-weight:bold;
	color: White;
}
</style>

</head>
<body>

<table style="width:100%" >

<tr>
<td><b>Hello <%=session.getAttribute("username") %>,</b></td> 
 <%session = request.getSession(false);
 if(null==session.getAttribute("uname")){
		System.out.println("Hello");
		response.sendRedirect("./login.jsp");
		System.out.println(session.getAttribute("uname"));
		
	} %>       
        
       
        
        
<td align="right">
<a href="./ChangePassword.jsp"><button class="myButton" >Change Password</button></a>

<a href="./Signout.jsp" ><button class="myButton" >SignOut</button></a></td>
 </tr>
</table>
<table  style="width:100%">
<tr>
<td><center><h1 style="margin-top: -30px;
    margin-bottom: 50px;
	font-family:Georgia, 'Times New Roman', Times, serif ;
	color:#ffffff;
	font-size:45px;">Welcome to HelpDesk</h1></center></td>
</tr>
</table>
<!-- <table  style="width:100%">
<tr>
<td><a href="./ComplaintForm.jsp"><button class="myButton" >Create Issue</button></a></td>
<td>
<a href="./ViewComplaint.jsp"><button class="myButton" >View Complain</button></a></td>
<td><a href="./FAQImp"><button class="myButton" style="margin-bottom: 30px;">FAQ</button></a></td>


</tr>

</table> -->
<br>
<br>
<div>
<table width="30%">
<tr><th><a href="./ComplaintForm.jsp"><button class="myButton" >Create Issue</button></a> </th>
<th><a href="./ViewComplaint.jsp"><button class="myButton" >View Complain</button></a> </th>
<th><a href="./FAQImp"><button class="myButton" >FAQ</button></a> </th></tr>
</table>
</div>
 

<div align="right">
<h1 style="color:#FFFFFF; background:rgba(0,0,0,0.5); width:30%; padding-right:150px;">Articles that may help you</h1>
<marquee direction="up" behavior="scroll" width="25%" scrollamount="5" 
onmouseover="this.stop();" onmouseout="this.start();">

  <h3 align="right"><a href="TopBlogs.jsp">Top 10 Blogs</a></h3><br>
   <h3 align="right"><a href="Quora.jsp">Quora</a></h3><br>
 <h3 align="right">  <a href="GeeksForGeeks.jsp">Geeks For Geeks</a></h3><br>
   <h3 align="right"> <a href="TedTalks.jsp">Ted Talks</a></h3><br>
  <h3 align="right"> <a href="TimesOfIndia.jsp">Times of India Blogs</a></h3>
  
</div>
</marquee>
</body>
</html>