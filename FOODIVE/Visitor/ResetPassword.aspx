<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="FOODIVE.Visitor.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE | Reset Password</title>
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
            <asp:HyperLink ID="HyperLink1" class="navbar-brand" runat="server">
                <img src="../Image/LOGO/foodive-logos_black.png" alt="FOODIVE" height="40" width="40">
            </asp:HyperLink>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0"></ul>
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
                                    <form method="POST" runat="server">
                                        <h3 class="fw-normal text-center pb-3 mb-3">Reset Password</h3>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtNewpass" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorpassword" runat="server" ControlToValidate="txtNewpass" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet, 1 Number and 1 Special Character" ForeColor="Red" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                        <div class="form-floating col-12 mb-3">
                                            <asp:TextBox ID="txtNewpass" class="form-control" placeholder="New Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <label for="NewPass">New Password</label>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtConfirmNewpass" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtConfirmNewpass" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet, 1 Number and 1 Special Character" ForeColor="Red" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                        <div class="form-floating col-12 mb-3">
                                            <asp:TextBox ID="txtConfirmNewpass" class="form-control" placeholder="Confirm New Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <label for="ConfirmNewPass">Confirm New Password</label>
                                        </div>
                                        <div class="d-grid gap-2">
                                            <asp:Button ID="btnResetpass" class="btn btn-primary" runat="server" Text="Reset Password" OnClick="btnResetpass_Click" />
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
