<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="FOODIVE.SubRestro.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>FOODIVE | Dashboard</title>
    <style>
        *{
            font-family:'Open Sans', sans-serif;
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
                            <h4 class="m-b-0 text-white">Dashboard</h4>
                        </div>
                        <div class="row">
                             <div class="col-md-6">
                                <div class="card p-30">
                                    <div class="media">
                                        <div class="media-left meida media-middle">
                                            <span><i class="fa fa-cutlery f-s-40" aria-hidden="true"></i></span>
                                        </div>
                                        <div class="media-body media-text-right">
                                            <asp:Label ID="lbldishes" style="font-size : 2rem" CssClass="text-secondary" runat="server" Text="0"></asp:Label>
                                            <p class="m-b-0">Dishes</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card p-30">
                                    <div class="media">
                                        <div class="media-left meida media-middle">
                                            <span><i class="fa fa-shopping-cart f-s-40" aria-hidden="true"></i></span>
                                        </div>
                                        <div class="media-body media-text-right">
                                            <asp:Label ID="lbltotal" style="font-size : 2rem" CssClass="text-secondary" runat="server" Text="0"></asp:Label>
                                            <p class="m-b-0">Total Orders</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                           
                        </div>
                        <div class="row">
                            
                            <div class="col-md-6">
                                <div class="card p-30">
                                    <div class="media">
                                        <div class="media-left meida media-middle">
                                            <span><i class="fa fa-spinner f-s-40" aria-hidden="true"></i></span>
                                        </div>
                                        <div class="media-body media-text-right">
                                            <asp:Label ID="lblprocess" style="font-size : 2rem" CssClass="text-secondary" runat="server" Text="0"></asp:Label>
                                            <p class="m-b-0">Processing Orders</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card p-30">
                                    <div class="media">
                                        <div class="media-left meida media-middle">
                                            <span><i class="fa fa-check f-s-40" aria-hidden="true"></i></span>
                                        </div>
                                        <div class="media-body media-text-right">
                                            <asp:Label ID="lbldeliver" style="font-size : 2rem" CssClass="text-secondary" runat="server" Text="0"></asp:Label>
                                            <p class="m-b-0">Delivered Orders</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="card p-30">
                                    <div class="media">
                                        <div class="media-left meida media-middle">
                                            <span><i class="fa fa-times f-s-40" aria-hidden="true"></i></span>
                                        </div>
                                        <div class="media-body media-text-right">
                                            <asp:Label ID="lblcancel" style="font-size : 2rem" CssClass="text-secondary" runat="server" Text="0"></asp:Label>
                                            <p class="m-b-0">Cancelled Orders</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 3= Cancelled
                            1= Delivered
                            2=processing 
                            0=dispatch-->
                            <div class="col-md-6">
                                <div class="card p-30">
                                    <div class="media">
                                        <div class="media-left meida media-middle">
                                            <span><i class="fa fa-usd f-s-40" aria-hidden="true"></i></span>
                                        </div>
                                        <div class="media-body media-text-right">
                                            <asp:Label ID="lblearn" style="font-size : 2rem" CssClass="text-secondary" runat="server" Text="0"></asp:Label>
                                            <p class="m-b-0">Total Earnings</p>
                                        </div>
                                    </div>
                                </div>
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
    </div>
</body>

</html>
