<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit profile.aspx.cs" Inherits="FOODIVE.Customer.edit_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        body {
            background: rgb(99, 39, 120)
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #BA68C8
        }

        .profile-button {
            background: rgb(99, 39, 120);
            box-shadow: none;
            border: none
        }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

        .back:hover {
            color: #682773;
            cursor: pointer
        }

        .labels {
            font-size: 11px
        }

        .add-experience:hover {
            background: #BA68C8;
            color: #fff;
            cursor: pointer;
            border: solid 1px #BA68C8
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
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
                        <asp:HyperLink ID="HyperLink4" class="nav-link text-decoration-none text-muted" runat="server" NavigateUrl="~/Customer/Logout.aspx">Logout</asp:HyperLink>
                    </li>
                </ul>
                <div class="text-end">

                    <div class="dropdown text-end">
                        <asp:HyperLink ID="HyperLink5" class="text-decoration-none mx-2 text-info" runat="server" NavigateUrl="~/Customer/AddToCart.aspx">
                            <img src="../Image/Icon/Cart.png" alt="cart" height="20" width="20"> ( <asp:Label ID="quanatc" runat="server"></asp:Label> )
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
    <div class="container rounded bg-white mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img class="rounded-circle mt-5" width="150px" src="../Image/Icon/User.png"><span class="font-weight-bold"><asp:Label ID="Username" runat="server" Text="Label"></asp:Label></span><span class="text-black-50"><asp:Label ID="Email" runat="server"></asp:Label></span><span> </span>
                </div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>
                    <form runat="server">
                        <asp:Panel ID="Panel1" DefaultButton="SaveProfile" runat="server">
                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtFirstName" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small" ValidationGroup="SaveProfile"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Invalid First name" ValidationExpression="[a-zA-Z][a-zA-Z]{2,}" Display="Dynamic" ValidationGroup="SaveProfile" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-6">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtLastName" ErrorMessage="Invalid Last name" ValidationExpression="[a-zA-Z][a-zA-Z]{2,}" Display="Dynamic" ValidationGroup="SaveProfile" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtLastName" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" ValidationGroup="SaveProfile" Font-Size="Small"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label class="labels" ID="Label1" runat="server" Text="First Name"></asp:Label><asp:TextBox ID="txtFirstName" placeholder="First name" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label class="labels" ID="Label2" runat="server" Text="Last Name"></asp:Label><asp:TextBox ID="txtLastName" placeholder="Last name" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 mt-3">
                                    <asp:Label class="labels" ID="Label3" runat="server" Text="Mobile Number ">
                                        <asp:RequiredFieldValidator ValidationGroup="SaveProfile" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ValidationGroup="SaveProfile" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Invalid Contact number" Display="Dynamic" ValidationExpression="[6789][0-9]{9}" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    </asp:Label><asp:TextBox ID="txtMobileNumber" placeholder="Mobile number" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-12 mt-3">
                                    <asp:Label class="labels" ID="Label4" runat="server" Text="Address"></asp:Label>
                                    <asp:RequiredFieldValidator ValidationGroup="SaveProfile" ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtAddress" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtAddress" placeholder="Address" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-12 mt-3">
                                    <asp:Label class="labels" ID="Label5" runat="server" Text="Email Address"></asp:Label>
                                    <asp:RegularExpressionValidator ValidationGroup="SaveProfile" ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email address" ValidationExpression="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ValidationGroup="SaveProfile" ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtEmail" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtEmail" placeholder="Email Address" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <asp:RequiredFieldValidator ValidationGroup="SaveProfile" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCity" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="SaveProfile" ID="validationcity" runat="server" ControlToValidate="txtCity" ErrorMessage="Invalid City" ValidationExpression="[a-zA-Z][a-zA-Z]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-6">
                                    <asp:RequiredFieldValidator ValidationGroup="SaveProfile" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPincode" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="SaveProfile" ID="validationPincode" runat="server" ControlToValidate="txtPincode" ErrorMessage="Invalid Pincode" ValidationExpression="[0-9]{6}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label class="labels" ID="Label6" runat="server" Text="City"></asp:Label><asp:TextBox ID="txtCity" placeholder="City" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label class="labels" ID="Label7" runat="server" Text="Pincode"></asp:Label><asp:TextBox ID="txtPincode" placeholder="Pincode" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="mt-5 text-center">
                                <asp:Button class="btn btn-primary profile-button" ID="SaveProfile" runat="server" Text="Save Profile" OnClick="SaveProfile_Click" />
                            </div>
                        </asp:Panel>
                </div>
            </div>
            <div class="col-md-4">

                <div class="p-3 py-5">
                    <asp:Panel ID="Panel2" DefaultButton="Button1" runat="server">
                    <div class="d-flex justify-content-between align-items-center"><strong><span>Password</span></strong>&nbsp;<asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Change Password" OnClick="Button1_Click" /></div>
                    <br>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="ChangePassword" ControlToValidate="txtOldPassword" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                        <div class="col-md-12">
                            <asp:Label class="labels" ID="Label8" runat="server" Text="Old Password"></asp:Label><asp:TextBox class="form-control" ID="txtOldPassword" placeholder="Old password" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <br>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ChangePassword" ControlToValidate="txtNewPassword" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorpassword" ValidationGroup="ChangePassword" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet, 1 Number and 1 Special Character" ForeColor="Red" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                        <div class="col-md-12">
                            <asp:Label class="labels" ID="Label9" runat="server" Text="New Password"></asp:Label><asp:TextBox class="form-control" ID="txtNewPassword" placeholder="New password" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                    </asp:Panel>
                </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
