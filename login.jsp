<html>
    <head>
        <title>Log In</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
        <script>
            function signup()
            {
                window.location.href="signup.jsp";
            }
        </script>
    </head>
    <body>
        
      
        <jsp:include page="Header.jsp" />
        
<!--        <img src="0.jpg" alt="top image" height="300" width="1660">-->
        
<!--        <table align="center" class="mytheme" style="margin-top:-200px">
            <tr><td class="mytheme">TRS</td></tr>
        </table>-->
        <!--<table align="center" style="margin-top:150px;margin-left: 850px">
         <tr style="background-color:rgb(245, 208, 24); border-radius: 25px">
                    <td class="mytheme2">LOGIN</td>
                </tr>
        </table> -->
    <center><img  src="images/loginicon2.png" alt="login icon" style="height: 300px"></center>>
       
       <!--<img style="margin-left:350px;margin-top:40px" src="ticketing.png" alt="login image" height="800" width="950">-->
       
    <center><div align="center" id="loginForm">
            <form action="loginDB.jsp" onsubmit="return submit(this)">
        <table cellpadding="20">
           
        <tr>
            <td class="mytheme1">Username</td>
            <td><input style="" type=email name="uName" required></td>
        </tr>
        <tr>
            <td class="mytheme1">Password</td>
            <td ><input  type=password name="pass" required></td>
        </tr>
        <tr>
            <td><button type="submit">Login</button></td>
            
            <td><button type="button" onclick="signup()">  New User  </button></td>
            
        </tr>
        
        </table>
            </form>
        </div>
    </center>
        
        <jsp:include page="footer.jsp" />
    </body>
</html>