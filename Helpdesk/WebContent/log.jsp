<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="css/style.css"> 

</head>

<body>
  <video autoplay loop id="myVideo">
  <source src="login.mp4" type="video/mp4">
</video>
<div class="content">
  <div class="form">

      <ul class="tab-group">
        <li class="tab active"><a href="#admin">Admin</a></li>
        <li class="tab"><a href="#login">Employee</a></li>
      </ul>

      <div class="tab-content">
              <div id="login">   
          <h1>Welcome</h1>
          
          <form id="form" name="Login" action="./Validate" onsubmit="" method="post">
          
           <div class="field-wrap">
            <label>
             <font color="#1ab188">Employee ID</font><span class="req">*</span>
            </label>
            <input type="text"name ="uname" id="uname"required autocomplete="off"/>
           </div>
          
          <div class="field-wrap">
            <label>
              <font color="#1ab188">Password</font><span class="req">*</span>
            </label>
            <input type="password" name="pword" id="pword"required autocomplete="off"/>
          </div>
          
          <p class="forgot"><a href="./forgotPassword.jsp">Forgot Password?</a></p>
          
          <button class="button button-block"/>Log In</button>
          </form>
       

        </div>
        
        <div id="admin">   
          <h1>Welcome</h1>
          
          <form action="./AdminWelcome.jsp" method="post">
          
           <div class="field-wrap">
            <label>
             Admin ID<span class="req">*</span>
            </label>
            <input type="text"name ="uname" id="uname"required autocomplete="off"/>
           </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="pword" id="pword"required autocomplete="off"/>
          </div>
          
          <p class="forgot"><a href="./forgotPassword.jsp">Forgot Password?</a></p>
          
          <button class="button button-block"/>Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
</div>

</body>
</html>
