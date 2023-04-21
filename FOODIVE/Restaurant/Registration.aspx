<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FOODIVE.Restaurant.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FOODIVE | Restaurant Registration</title>
    <link rel="shortcut icon" href="../Image/Favicon/Favicon.png" type="image/x-icon">
    <style>
        *{
            font-family:'Open Sans', sans-serif;
        }
    </style>
    <link rel="stylesheet" href="Registration/vendor/nouislider/nouislider.min.css">
    <link rel="stylesheet" href="Registration/css/style.css">
</head>
<body>

    <div class="main">
        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                    <img src="../Image/Img/restro_mng.jpg" alt="" style="height: 100%">
                </div>
                <div class="signup-form">
                    <form method="POST" runat="server" class="register-form">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-select">
                                    <div class="label-flex">
                                        <h3>RESTAURANT MANAGER DETAILS</h3>
                                    </div>
                                    <div class="form-input">
                                        <label for="name">Full Name</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="validate" runat="server" ControlToValidate="txtname" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="validationfirstname" ValidationGroup="validate" runat="server" ControlToValidate="txtname" ErrorMessage="Invalid Full name" ValidationExpression="[a-zA-Z][ a-zA-Z]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-input">
                                    <label for="phone_number">Phone number</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="validate" ControlToValidate="txtphone_number" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="validate" ControlToValidate="txtphone_number" ErrorMessage="Invalid Phone number" Display="Dynamic" ValidationExpression="[6789][0-9]{9}" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="txtphone_number" runat="server" MaxLength="10"></asp:TextBox>
                                </div>
                                <div class="form-input">
                                    <label for="email">Email</label>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="validate" runat="server" ControlToValidate="txtemail" ErrorMessage="Invalid Email" ValidationExpression="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="validate" runat="server" ControlToValidate="txtemail" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtemail" TextMode="Email" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-input">
                                    <label for="password">Password</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="validate" ControlToValidate="txtpassword" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorpassword" ValidationGroup="validate" runat="server" ControlToValidate="txtpassword" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet, 1 Number and 1 Special Character" ForeColor="Red" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="txtpassword" TextMode="Password" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-select">
                                    <div class="label-flex">
                                        <h3>ID PROOF</h3>
                                    </div>
                                    <div class="form-input">
                                        <label for="Aadhaar">Aadhaar card photo</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="validate" runat="server" ControlToValidate="FileAadhaar" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <asp:FileUpload ID="FileAadhaar" runat="server" />
                                    </div>

                                </div>
                                <div class="form-select">
                                    <div class="label-flex">
                                        <h3 for="payment">RESIDENTIAL INFORMATION</h3>
                                    </div>
                                    <div class="form-input">
                                        <label for="address">Address</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="validate"  runat="server" ControlToValidate="txtaddress" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-input">
                                    <label for="city">City</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="validate" ControlToValidate="txtcity" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="validationcity" runat="server" ValidationGroup="validate" ControlToValidate="txtcity" ErrorMessage="Invalid City" ValidationExpression="[a-zA-Z][a-zA-Z]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-input">
                                    <label for="pincode">Pincode</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="validate" ControlToValidate="txtpincode" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="validationPincode" runat="server" ValidationGroup="validate" ControlToValidate="txtpincode" ErrorMessage="Invalid Pincode" ValidationExpression="[0-9]{6}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:TextBox MaxLength="6" ID="txtpincode" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-submit">
                            <asp:Button ID="submit" class="submit" name="submit" runat="server" ValidationGroup="validate" Text="Next" OnClick="submit_Click" />
                            <asp:Button ID="reset" class="submit" name="reset" runat="server" Text="Back" OnClick="reset_Click" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="Registration/vendor/jquery/jquery.min.js"></script>
    <script src="Registration/vendor/nouislider/nouislider.min.js"></script>
    <script src="Registration/vendor/wnumb/wNumb.js"></script>
    <script src="Registration/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="Registration/vendor/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="Registration/js/main.js"></script>
</body>
</html>
