<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FOODIVE.Restaurant.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FOODIVE | Restaurant Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <link rel="shortcut icon" href="../Image/Favicon/Favicon.png" type="image/x-icon">    
    <link rel="stylesheet" type="text/css" href="Login/vendor/bootstrap/css/bootstrap.min.css">    
    <link rel="stylesheet" type="text/css" href="Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">    
    <link rel="stylesheet" type="text/css" href="Login/vendor/animate/animate.css">    
    <link rel="stylesheet" type="text/css" href="Login/vendor/css-hamburgers/hamburgers.min.css">    
    <link rel="stylesheet" type="text/css" href="Login/vendor/select2/select2.min.css">    
    <link rel="stylesheet" type="text/css" href="Login/css/util.css">
    <link rel="stylesheet" type="text/css" href="Login/css/main.css">    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
   <div class="limiter">
        <div class="container-login100" style="background-color: #fff;">
            <div class="wrap-login100" style="padding-top:50px">
                <div class="login100-pic" data-tilt>
                    <img src="../Image/Img/restro_login.jpg" alt="IMG" class="shadow-lg rounded">
                </div>

                <form runat="server" class="login100-form validate-form">
                    <span class="login100-form-title p-t-100">
                        Restaurant Login
                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Username is required">
                        <asp:TextBox ID="txtUsername" placeholder="Email" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <asp:TextBox ID="txtpass" class="input100" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="container-login100-form-btn">
                        <asp:Button ID="btnLogin" class="login100-form-btn" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script src="Login/vendor/jquery/jquery-3.2.1.min.js"></script>    
    <script src="Login/vendor/bootstrap/js/popper.js"></script>
    <script src="Login/vendor/bootstrap/js/bootstrap.min.js"></script>    
    <script src="Login/vendor/select2/select2.min.js"></script>
    <script src="Login/js/main.js"></script>

</body>
</html>
