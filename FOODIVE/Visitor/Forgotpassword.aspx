<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgotpassword.aspx.cs" Inherits="FOODIVE.Visitor.Forgotpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE | Forgot Password</title>
    <style>
        *{
            font-family:'Open Sans', sans-serif;
        }
    </style>
    <link rel="shortcut icon" href="../Image/Favicon/Favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: whitesmoke;">
        <div class="container">
            <asp:HyperLink ID="HyperLink1" class="navbar-brand" runat="server" NavigateUrl="~/Visitor/index.aspx">
                <img src="../Image/LOGO/foodive-logos_black.png" alt="FOODIVE" height="40" width="40">
            </asp:HyperLink>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink2" class="nav-link" runat="server" NavigateUrl="~/Visitor/index.aspx">Home</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink3" class="nav-link" runat="server" NavigateUrl="~/Customer/Login.aspx">Login</asp:HyperLink>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="vh-100 bg-light">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-10">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                            <div class="col-md-6 col-lg-5 d-none d-md-block">
                                <img src="../Image/Img/FORGET_PASS.jpg" alt="LOGIN photo" class="img-fluid h-100" style="border-radius: 1rem 0 0 1rem;" />
                            </div>
                            <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                <div class="card-body p-4 p-lg-5 text-black">
                                    <form runat="server" method="POST">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                        <h3 class="fw-normal text-center">Forgot Password</h3>
                                        <p class="text-center text-muted small pb-3 mb-3">Enter your email we'll send you a OTP to get back into your account.</p>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCustomerEmail" ErrorMessage="Invalid Email address" ValidationExpression="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCustomerEmail" ErrorMessage="Field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <div class="form-floating mb-4">
                                            <asp:TextBox ID="txtCustomerEmail" class="form-control" placeholder="Email Address" runat="server"></asp:TextBox>
                                            <label for="CustomerEmail">Email Address</label>
                                        </div>
                                        <div class="d-grid gap-2 mt-4">
                                            <asp:Button ID="btnsendOTP" runat="server" class="btn btn-primary" Text="Send One Time Password" OnClick="btnsendOTP_Click" />
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
