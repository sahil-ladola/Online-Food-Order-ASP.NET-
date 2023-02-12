<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="change password.aspx.cs" Inherits="FOODIVE.Customer.changw_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE | Change Password</title>
    <link rel="shortcut icon" href="../Image/Favicon/Favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
</head>
<body>
    <div class="container">
        <header class="p-3 border-bottom">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <asp:HyperLink ID="HyperLink1" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none" runat="server" NavigateUrl="~/Customer/afterlogin.aspx">
                    <img class="bi me-2" width="40" height="40" role="img" src="../Image/LOGO/foodive-logos_black.png" alt="FOODIVE">
                </asp:HyperLink>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink2" class="nav-link text-decoration-none text-muted" runat="server" NavigateUrl="~/Customer/afterlogin.aspx">Home</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink3" class="nav-link text-decoration-none text-muted" runat="server" NavigateUrl="~/Customer/order.aspx">My Orders</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink4" class="nav-link text-decoration-none text-muted" runat="server" NavigateUrl="~/Logout.aspx">Logout</asp:HyperLink>
                    </li>
                </ul>
                <div class="text-end">

                    <div class="dropdown text-end">
                        <asp:HyperLink ID="HyperLink5" class="text-decoration-none mx-2 text-info" runat="server" NavigateUrl="~/Customer/AddToCart.aspx">
                            <img src="../Image/Icon/Cart.png" alt="cart" height="20" width="20">
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink6" class="text-decoration-none" runat="server" NavigateUrl="~/Customer/profile.aspx">
                            <asp:Label ID="lbluser" class="px-2 text-secondary" runat="server" Text="Label"></asp:Label>
                            <img src="../Image/Icon/User.png" id="User" alt="User" width="32" height="32" class="rounded-circle">
                        </asp:HyperLink>
                    </div>
                </div>
            </div>

        </header>
    </div>
    <div class="container text-center mt-3">
        <h1 id="ResetPass">Change Password</h1>
        <form class="row g-3" runat="server" method="post">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtOldPassword"  ErrorMessage="All field must be filled" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorpassword" runat="server" ControlToValidate="txtOldPassword" ErrorMessage="Enter atleast 1 number,1 Uppercase , 1 Lowercase and length must be 8 character" Display="Dynamic" ValidationExpression="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"></asp:RegularExpressionValidator>
            <div class="form-floating mt-4 col-12">
                <asp:TextBox ID="txtOldPassword" class="form-control" placeholder="Old Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <label for="txtOldPassword">Old Password</label>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPassword"  ErrorMessage="All field must be filled" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Enter atleast 1 number,1 Uppercase , 1 Lowercase and length must be 8 character" Display="Dynamic" ValidationExpression="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"></asp:RegularExpressionValidator>
            <div class="form-floating col-12">
                <asp:TextBox ID="txtNewPassword" class="form-control" placeholder="New Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <label for="txtNewPassword">New Password</label>
            </div>
            <div class="d-grid gap-2">
                <asp:Button ID="btnChangePass" class="btn btn-primary" runat="server" Text="Change Password" OnClick="btnChangePass_Click1" />

            </div>
        </form>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
