<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="all_orders.aspx.cs" Inherits="FOODIVE.Restaurant.all_orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>FOODIVE | All Orders</title>
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
                <div class="row">
                    <div class="col-12">
                        <div class="col-lg-12">
                            <div class="card card-outline-primary">
                                <div class="card-header">
                                    <h4 class="m-b-0 text-white">All Orders</h4>
                                </div>

                                <div class="table-responsive m-t-40">
                                    <table id="myTable" class="table table-bordered table-striped">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>First name</th>
                                                <th>Last name</th>
                                                <th>Address</th>
                                                <th>Date</th>
                                                <th>Amount</th>
                                                <th>Orders</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <td colspan="9">
                                                <center>No Orders</center>
                                            </td>




                                            <!-- 3= Cancelled
                                                    // 1= Delivered
                                                    // 2=processing -->
                                            <%--<tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>
                                                        <table class='table table-hover'>
                                                        <thead>
                                                            <tr>
                                                                <th scope='col'>dishname</th>
                                                                <th scope='col'>Quantity</th>
                                                                <th scope='col'>Price</th>
                                                                <th scope='col'>Status</th>
                                                                <th scope='col'>Action</th>
                                                            </tr>
                                                        </thead>--%>
                                            <%--<tbody>--%>

                                            <%--<tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                        
                                                            <td><button type="button" class="btn btn-warning"><span class="fa fa-cog fa-spin" aria-hidden="true"></span> Processing</button></td>
                                                        
                                                        
                                                            <td> <button type="button" class="btn btn-primary"><span class="fa fa-check-circle" aria-hidden="true"></span> Delivered</button></td>
                                                       
                                                        
                                                            <td> <button type="button" class="btn btn-danger"> <i class="fa fa-close"></i> Cancelled</button></td>
                                                        
                                                        <td>
                                                            
                                                        </td>
                                                    
                                                            </tr>
                                                   
                                                        </tbody>
                                                        </table>
                                                    </td>

                                                    </tr>--%>
                                        </tbody>
                                    </table>
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
</body>
</html>
