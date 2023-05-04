<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_restaurant.aspx.cs" Inherits="FOODIVE.Restaurant.add_restaurant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>FOODIVE | Add Sub-branch Restaurant</title>
    <style>
        * {
            font-family: 'Open Sans', sans-serif;
        }
    </style>
    <link rel="shortcut icon" href="../Image/Favicon/Favicon.png" type="image/x-icon">
    <link href="css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="css/helper.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="fix-header">
    <div id="main-wrapper">
        <div class="header">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <div class="navbar-header">
                    <a class="navbar-brand" href=" dashboard.aspx">
                        <span>
                            <img src="../Image/LOGO/foodive-logos_black.png" width="50px" alt="LOGO" class="dark-logo" /></span>
                    </a>
                </div>

                <div class="navbar-collapse">
                    <ul class="navbar-nav mr-auto mt-md-0">
                    </ul>
                    <ul>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted " href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="images/bookingSystem/user-icn.png" alt="user" class="profile-pic" /></a>
                            <div class="dropdown-menu dropdown-menu-right animated zoomIn">
                                <ul class="dropdown-user">
                                    <li><a href=" logout.aspx"><i class="fa fa-power-off"></i>Logout</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="left-sidebar">
            <div class="scroll-sidebar">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-devider"></li>
                        <li class="nav-label">Home</li>
                        <li><a href=" dashboard.aspx"><i class="fa fa-tachometer active"></i><span>Dashboard</span></a>
                        </li>
                        <li class="nav-label">Log</li>
                        <%--<li><a href=" all_users.aspx"><span><i class="fa fa-user f-s-20 "></i></span><span>Users</span></a></li>--%>
                        <li><a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-archive f-s-20 color-warning"></i><span class="hide-menu">Restaurant</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href=" all_restaurant.aspx">All Restaurant</a></li>
                                <li><a href="add_restaurant.aspx">Add Sub-branch Restaurant</a></li>
                            </ul>
                        </li>
                        <%--<li><a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-delicious f-s-20 color-warning"></i><span class="hide-menu">Categories</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="all_category.aspx">All Categories</a></li>
                                <li><a href="add_category.aspx">Add Categories</a></li>
                            </ul>
                        </li>--%>
                        <li><a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-cutlery" aria-hidden="true"></i><span class="hide-menu">Menu</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href=" all_menu.aspx">All Menues</a></li>
                                <li><a href=" add_menu.aspx">Add Menu</a></li>
                            </ul>
                        </li>
                        <li><a href=" all_orders.aspx"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span>Orders</span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="page-wrapper">
            <div class="container-fluid">

                <div class="col-lg-12">
                    <div class="card card-outline-primary">
                        <div class="card-header">
                            <h4 class="m-b-0 text-white">Add Sub-branch Restaurant</h4>
                        </div>
                        <div class="card-body">
                            <form runat="server" enctype="multipart/form-data">
                                <div class="form-body">
                                    <hr>
                                    <h4 class="text-dark">Manager Details</h4>
                                    <hr />
                                    <div class="row p-t-20">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="name">Full Name</label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="validate" runat="server" ControlToValidate="txtname" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="validationfirstname" ValidationGroup="validate" runat="server" ControlToValidate="txtname" ErrorMessage="Invalid Full name" ValidationExpression="[a-zA-Z][ a-zA-Z]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                                <asp:TextBox ID="txtname" class="form-control form-control-danger" runat="server"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group has-danger">
                                                <label for="phone_number">Phone number</label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="validate" ControlToValidate="txtphone_number" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="validate" ControlToValidate="txtphone_number" ErrorMessage="Invalid Phone number" Display="Dynamic" ValidationExpression="[6789][0-9]{9}" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                                <asp:TextBox ID="txtphone_number" class="form-control form-control-danger" runat="server" MaxLength="10"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="email">Email</label>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="validate" runat="server" ControlToValidate="txtemail" ErrorMessage="Invalid Email" ValidationExpression="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="validate" runat="server" ControlToValidate="txtemail" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtemail" class="form-control form-control-danger" TextMode="Email" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row p-t-20">
                                        <div class="col-md-6">
                                            <div class="form-group has-danger">
                                                <label for="password">Password</label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="validate" ControlToValidate="txtpassword" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorpassword" ValidationGroup="validate" runat="server" ControlToValidate="txtpassword" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet, 1 Number and 1 Special Character" ForeColor="Red" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                                <asp:TextBox ID="txtpassword" TextMode="Password" class="form-control form-control-danger" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group has-danger">
                                                <label for="Aadhaar">Aadhaar card photo</label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="validate" runat="server" ControlToValidate="FileAadhaar" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                                <asp:FileUpload ID="FileAadhaar" class="form-control form-control-danger" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row p-t-20">
                                        <div class="col-md-4">
                                            <div class="form-group has-danger">
                                                <label for="address">Address</label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="validate" runat="server" ControlToValidate="txtaddress" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtaddress" class="form-control form-control-danger" runat="server"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group has-danger">
                                                <label for="city">City</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="validate" ControlToValidate="txtcity" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="validationcity" runat="server" ValidationGroup="validate" ControlToValidate="txtcity" ErrorMessage="Invalid City" ValidationExpression="[a-zA-Z][a-zA-Z]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="txtcity" class="form-control form-control-danger" runat="server"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="pincode">Pincode</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="validate" ControlToValidate="txtpincode" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="validationPincode" runat="server" ValidationGroup="validate" ControlToValidate="txtpincode" ErrorMessage="Invalid Pincode" ValidationExpression="[0-9]{6}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                    <asp:TextBox MaxLength="6" class="form-control form-control-danger" ID="txtpincode" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <h4 class="text-dark">Sub-Restaurant Details</h4>
                                    <hr>

                                    <div class="row p-t-20">
                                        <div class="col-md-4">
                                            <label for="txtrestro_name">Sub-Restaurant name</label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="validate" ControlToValidate="txtrestro_name" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="validate" ControlToValidate="txtrestro_name" ErrorMessage="Invalid Restaurant name" ValidationExpression="[a-zA-Z0-9][ a-zA-Z0-9]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                            <asp:TextBox ID="txtrestro_name" class="form-control form-control-danger" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4">
                                            <label for="txtrestro_phone_number">Phone number</label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="validate" runat="server" ControlToValidate="txtrestro_phone_number" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationGroup="validate" runat="server" ControlToValidate="txtrestro_phone_number" ErrorMessage="Invalid Phone number" Display="Dynamic" ValidationExpression="[6789][0-9]{9}" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                            <asp:TextBox MaxLength="10" class="form-control form-control-danger" ID="txtrestro_phone_number" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4">
                                            <label for="txtrestro_email">Email</label>
                                            <asp:RegularExpressionValidator ValidationGroup="validate" ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtrestro_email" ErrorMessage="Invalid Email" ValidationExpression="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ValidationGroup="validate" ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtrestro_email" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtrestro_email" class="form-control form-control-danger" TextMode="Email" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row p-t-20">
                                        <div class="col-md-6">
                                            <label for="Filerestro_img">Sub-Restaurant image</label>
                                            <asp:RequiredFieldValidator ValidationGroup="validate" ID="RequiredFieldValidator10" runat="server" ControlToValidate="Filerestro_img" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                            <asp:FileUpload ID="Filerestro_img" class="form-control form-control-danger" runat="server" />
                                        </div>
                                        <div class="col-md-6">
                                            <label for="txtaddress">Address</label>
                                            <asp:RequiredFieldValidator ValidationGroup="validate" ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtaddress" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="TextBox1" class="form-control form-control-danger" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-actions p-t-20">
                                    <asp:Button ID="btnsubmit" class="btn btn-primary" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/lib/jquery/jquery.min.js"></script>
        <script src="js/lib/bootstrap/js/popper.min.js"></script>
        <script src="js/lib/bootstrap/js/bootstrap.min.js"></script>
        <script src="js/jquery.slimscroll.js"></script>
        <script src="js/sidebarmenu.js"></script>
        <script src="js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
        <script src="js/custom.min.js"></script>
    </div>
</body>
</html>
