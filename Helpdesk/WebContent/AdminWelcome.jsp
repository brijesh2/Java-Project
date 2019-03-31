<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
  <link rel="stylesheet" href="css/style.css">
<style>
#myVideo {
  position: fixed;
  width: 100%; 
  height: 100%;
}
.content {
  position: fixed;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  color: #f1f1f1;
  width: 100%;
  padding: 20px;
}
.signout button {
  display: inline-block; 
  background-color: #add8e6;
  right-padding: 15px;
    border: none;
    color: black;
  padding: 5px 10px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  
  

/*   border-radius: 15px;
  box-shadow: 0 9px #999; */
  transition-duration: 0.4s;
}
.button {
  display: inline-block;
  
  padding: 15px 20px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: black;
  background-color: transparent;
  background-repeat:no-repeat;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
  width:25%;
  height:15%;
}

.button:hover {background-color:#add8e6 }

.button:active {
  background-color: #add8e6;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

.signout button:hover {box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);}

/* .signout button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
} */

</style>
</head>
<body>
<%session = request.getSession(false);
if(null==session.getAttribute("uname")){
	System.out.println("Hello");
	response.sendRedirect("./login.jsp");
	System.out.println(session.getAttribute("uname"));
	
}
%>
  <video autoplay muted loop id="myVideo">
  <source src="adminwelcome.mp4" type="video/mp4">
</video>
<div class="content">
<table style="width:100%" >
<tr></tr><br><br>
<tr>
<td>
 <h2>Hello <%=session.getAttribute("uname") %>,</h2>
 </td>
 <td align="right" style="right-padding: 20px">
<a href="./login.jsp" class="signout"><button class="signout button">Sign Out</button></a></td>
 
</tr>
</table><br>

 <center><br>
<br> <p class="ex1">
<div class="exp">
<button type="button" onclick="location.href='./viewComp.jsp'"  class="button" >
         View Complaints</button>
</div>     
<br>     
<div class="exp">
<button onclick="location.href='./assigntech.jsp'" type="button" class="button" >
         Assign Technician</button>
</div>       
<br>
<div class="exp">
<button onclick="location.href='./registerUser.jsp'" type="button" class="button" >
         Register User</button>
     </div>
     <br> 
        <div class="exp">
<button onclick="location.href='./Report.jsp'" type="button"  class="button">
         Generate Reports</button>
         </div>

</p></center>  
 </div>   
</body>
</html>