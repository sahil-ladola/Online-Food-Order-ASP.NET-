<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FOODIVE.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE | Login</title>
    <link rel="shortcut icon" href="~/Image/Favicon/Favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: whitesmoke;">
        <div class="container">
            <asp:HyperLink class="navbar-brand" runat="server" NavigateUrl="~/Visitor/index.aspx">
                <img src="../Image/LOGO/foodive-logos_black.png" alt="FOODIVE" height="40" width="40">
            </asp:HyperLink>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <asp:HyperLink class="nav-link" runat="server" NavigateUrl="~/Visitor/index.aspx">Home</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink class="nav-link" runat="server" NavigateUrl="~/Customer/Registration.aspx">Sign up</asp:HyperLink>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="vh-100 bg-light">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-10">
                    <div class="card my-4" style="border-radius: 1rem;">
                        <div class="row g-0">
                            <div class="col-md-6 col-lg-5 d-none d-md-block">
                                <img src="../Image/Img/Customer_Login.jpg" alt="LOGIN photo" class="img-fluid h-100" style="border-radius: 1rem 0 0 1rem;" />
                            </div>
                            <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                <div class="card-body p-4 p-lg-5 text-black">
                                    <form method="POST" runat="server">
                                        <div class="d-flex align-items-center mb-3 pb-1">
                                            <span class="h1 fw-bold mb-0">
                                                <img src="../Image/LOGO/foodive-logos_black.png" alt="LOGO" height="100" width="100">
                                            </span>
                                        </div>
                                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email address" ValidationExpression="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <div class="form-floating mb-4">
                                            <asp:TextBox ID="txtEmail" class="form-control" placeholder="name@example.com" runat="server" TextMode="Email"></asp:TextBox>
                                            <label for="floatingInput">Email address</label>
                                        </div>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPassword" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <div class="form-floating mb-2">
                                            <asp:TextBox ID="txtPassword" class="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <label for="password">Password</label>
                                        </div>

                                        <div class="small mb-4">
                                            <asp:CheckBox ID="chkRememberme" value="Rememberme" name="Rememberme" runat="server" Checked="True" />
                                            <asp:Label class="form-check-label" for="flexCheckDefault" runat="server" Text="Remember me"></asp:Label>
                                        </div>

                                        <div class="pt-1 mb-4">
                                            <div class="d-grid gap-2">
                                                <asp:Button ID="btnlogin" class="btn btn-primary" runat="server" Text="Login" OnClick="btnlogin_Click" />
                                            </div>
                                        </div>

                                        <asp:HyperLink ID="HyperLink1" class="small text-muted text-decoration-none" runat="server" NavigateUrl="~/Visitor/Forgot password.aspx">Forgot password?</asp:HyperLink>
                                        <p class="mb-5 pb-lg-2 text-muted">
                                            Don't have an account?<asp:HyperLink ID="HyperLink2" class="text-decoration-none" runat="server" NavigateUrl="~/Customer/Registration.aspx"><strong> Register here</strong></asp:HyperLink>
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
