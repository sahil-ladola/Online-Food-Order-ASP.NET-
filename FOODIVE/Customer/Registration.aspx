<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FOODIVE.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE | Sign Up</title>
    <link rel="shortcut icon" href="../Image/Favicon/Favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .card-registration .select-input.form-control[readonly]:not([disabled]) {
            font-size: 1rem;
            line-height: 2.15;
            padding-left: .75em;
            padding-right: .75em;
        }

        .card-registration .select-arrow {
            top: 13px;
        }
    </style>
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
                        <asp:HyperLink class="nav-link" runat="server" NavigateUrl="~/Customer/Login.aspx">Login</asp:HyperLink>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="h-100 bg-light">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
                    <div class="card card-registration my-4">
                        <div class="row g-0">
                            <div class="col-xl-6 d-none d-xl-block">
                                <img src="../Image/Img/Customer_SignUp.jpg" alt="SIGN UP photo" class="img-fluid h-100" style="border-radius: 1rem 0 0 1rem;" />
                            </div>
                            <div class="col-xl-6">
                                <div class="card-body p-md-5 mt-5 text-black">
                                    <h3 class="mb-5 text-uppercase border-bottom">Sign up</h3>
                                    <form method="post" runat="server">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFname" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="validationfirstname" runat="server" ControlToValidate="txtFname" ErrorMessage="Invalid First name" ValidationExpression="[a-zA-Z][a-zA-Z]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLname" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="validationlastname" runat="server" ControlToValidate="txtLname" ErrorMessage="Invalid Last name" ValidationExpression="[a-zA-Z][a-zA-Z]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <div class="form-floating">
                                                    <asp:TextBox name="fname" class="form-control" placeholder="First Name" runat="server" ID="txtFname" OnTextChanged="txtFname_TextChanged"></asp:TextBox>
                                                    <label for="floatingInput">First Name</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <div class="form-floating">
                                                    <asp:TextBox name="lname" class="form-control" placeholder="Last Name" runat="server" ID="txtLname"></asp:TextBox>
                                                    <label for="floatingInput">Last Name</label>
                                                </div>
                                            </div>
                                        </div>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <div class="form-floating mb-4">
                                            <asp:TextBox class="form-control" name="address" placeholder="Address" runat="server" ID="txtAddress"></asp:TextBox>
                                            <label for="floatingInputAddress">Address</label>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCity" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="validationcity" runat="server" ControlToValidate="txtCity" ErrorMessage="Invalid City" ValidationExpression="[a-zA-Z][a-zA-Z]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPincode" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="validationPincode" runat="server" ControlToValidate="txtPincode" ErrorMessage="Invalid Pincode" ValidationExpression="[0-9]{6}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-6 ">
                                                <div class="form-floating">
                                                    <asp:TextBox class="form-control" name="city" placeholder="City" runat="server" ID="txtCity"></asp:TextBox>
                                                    <label for="floatingInputCity">City</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 ">
                                                <div class="form-floating">
                                                    <asp:TextBox class="form-control" name="pincode" placeholder="Pincode" runat="server" ID="txtPincode" MaxLength="6"></asp:TextBox>
                                                    <label for="floatingInputPincode">Pincode</label>
                                                </div>
                                            </div>
                                        </div>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email address" ValidationExpression="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <div class="d-md-flex justify-content-start align-items-center mb-4">
                                            <div class="form-floating col-12">
                                                <asp:TextBox class="form-control" TextMode="Email" name="email" placeholder="name@example.com" runat="server" ID="txtEmail"></asp:TextBox>
                                                <label for="floatingInput">Email address</label>
                                            </div>
                                        </div>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtMobileNum" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMobileNum" ErrorMessage="Invalid Contact number" Display="Dynamic" ValidationExpression="[6789][0-9]{9}" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                        <div class="row">
                                            <div class="input-group input-group-lg mb-4">
                                                <span class="input-group-text" id="inputGroup-sizing-lg">+91</span>
                                                <asp:TextBox class="form-control" name="mobnum" placeholder="Mobile Number" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" MaxLength="10" runat="server" ID="txtMobileNum"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPassword" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorpassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet, 1 Number and 1 Special Character" ForeColor="Red" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                            <div class="form-floating mb-4">
                                                <asp:TextBox class="form-control" name="password" placeholder="Password" runat="server" ID="txtPassword" TextMode="Password"></asp:TextBox>
                                                <label for="floatingInputPassword">Create Password</label>
                                            </div>
                                        </div>
                                        <div class="d-grid gap-2 mb-4">
                                            <asp:Button ID="btnSendOtp" runat="server" class="btn btn-primary" Text="Create Account" OnClick="btnSendOtp_Click" />
                                        </div>
                                        <div class="col-12">
                                            <p class="text-muted">
                                                Already have an account?
                                               <strong>
                                                   <asp:HyperLink class="text-decoration-none" runat="server" NavigateUrl="~/Customer/Login.aspx">Login</asp:HyperLink></strong>
                                            </p>
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
