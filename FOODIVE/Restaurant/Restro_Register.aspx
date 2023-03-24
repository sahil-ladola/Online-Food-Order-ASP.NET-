<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Restro_Register.aspx.cs" Inherits="FOODIVE.Restaurant.Restro_Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FOODIVE | Restaurant Registration</title>
    <link rel="shortcut icon" href="../Image/Favicon/Favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="Registration/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="Registration/vendor/nouislider/nouislider.min.css">
    <link rel="stylesheet" href="Registration/css/style.css">
</head>
<body>
    <div class="main">
        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                    <img src="../Image/Img/restro_reg.jpg" alt="" style="height: 100%">
                </div>
                <div class="signup-form">
                    <form method="POST" runat="server" class="register-form">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-select">
                                    <div class="label-flex">
                                        <h3>RESTAURANT DETAILS</h3>
                                    </div>
                                    <div class="form-input">
                                        <label for="txtrestro_name">Restaurant name</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="validate" ControlToValidate="txtrestro_name" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="validationfirstname" runat="server" ValidationGroup="validate" ControlToValidate="txtrestro_name" ErrorMessage="Invalid Restaurant name" ValidationExpression="[a-zA-Z0-9][ a-zA-Z0-9]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="txtrestro_name" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-input">
                                    <label for="txtrestro_phone_number">Phone number</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="validate" runat="server" ControlToValidate="txtrestro_phone_number" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="validate" runat="server" ControlToValidate="txtrestro_phone_number" ErrorMessage="Invalid Phone number" Display="Dynamic" ValidationExpression="[6789][0-9]{9}" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:TextBox MaxLength="10" ID="txtrestro_phone_number"  runat="server"></asp:TextBox>
                                </div>
                                <div class="form-input">
                                    <label for="txtrestro_email">Email</label>
                                    <asp:RegularExpressionValidator ValidationGroup="validate" ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtrestro_email" ErrorMessage="Invalid Email" ValidationExpression="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ValidationGroup="validate" ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtrestro_email" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtrestro_email" TextMode="Email" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-input">
                                    <label for="Filerestro_img">Restaurant image</label>
                                    <asp:RequiredFieldValidator ValidationGroup="validate" ID="RequiredFieldValidator2" runat="server" ControlToValidate="Filerestro_img" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:FileUpload ID="Filerestro_img" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-select">
                                    <div class="form-radio">
                                        <div class="label-flex">
                                            <h3>SUB-BRANCH INFORMATION</h3>
                                        </div>
                                            <label>Is your restaurant have sub-branches ?</label>
                                        <div class="form-radio-group">
                                            <div class="form-radio-item">
                                                <input type="radio" name="payment" id="No" runat="server" checked>
                                                <label for="No">No</label>
                                                <span class="check"></span>
                                            </div>
                                            <div class="form-radio-item">
                                                <input type="radio" name="payment" id="Yes" runat="server">
                                                <label for="Yes">Yes</label>
                                                <span class="check"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-select">
                                    <div class="label-flex">
                                        <h3 for="payment">RESTAURANT ADDRESS</h3>
                                    </div>
                                    <div class="form-input">
                                        <label for="txtaddress">Address</label>
                                        <asp:RequiredFieldValidator ValidationGroup="validate" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtaddress" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-input">
                                    <label for="txtcity">City</label>
                                    <asp:RequiredFieldValidator ValidationGroup="validate" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcity" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="validate" ID="validationcity" runat="server" ControlToValidate="txtcity" ErrorMessage="Invalid City" ValidationExpression="[a-zA-Z][a-zA-Z]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-input">
                                    <label for="txtpincode">Pincode</label>
                                    <asp:RequiredFieldValidator ValidationGroup="validate" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtpincode" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="validate" ID="validationPincode" runat="server" ControlToValidate="txtpincode" ErrorMessage="Invalid Pincode" ValidationExpression="[0-9]{6}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:TextBox MaxLength="6" ID="txtpincode" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-submit">
                            <asp:Button ID="submit" class="submit" name="submit" ValidationGroup="validate" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
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
