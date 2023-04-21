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

                <div class="col-lg-12">
                    <div class="card card-outline-primary">
                        <div class="card-header">
                            <h4 class="m-b-0 text-white">Add Sub-branch Restaurant</h4>
                        </div>
                        <div class="card-body">
                            <%--<form action='' method='post' enctype="multipart/form-data">
                                <div class="form-body">
                                    <hr>
                                    <div class="row p-t-20">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Dish Name</label>
                                                <input type="text" name="d_name" pattern="[A-Z a-z0-9]*" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group has-danger">
                                                <label class="control-label">Description</label>
                                                <input type="text" name="about" pattern="[A-Z a-z0-9]*" class="form-control form-control-danger">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row p-t-20">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Price </label>
                                                <input type="text" name="price" pattern="[0-9]*" class="form-control" placeholder="00.00/-">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group has-danger">
                                                <label class="control-label">Image</label>
                                                <input type="file" name="file" id="lastName" class="form-control form-control-danger" placeholder="12n">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <%--<div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Select Restaurant</label>
                                                <select name="res_name" class="form-control custom-select" data-placeholder="Choose a Category" tabindex="1">
                                                    <option>-- Select Restaurant --</option>
                                                </select>
                                            </div>
                                        </div>--%>
                                        <%--<div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label">Select Category</label>
                                                <select name="res_name" class="form-control custom-select" data-placeholder="Choose a Category" tabindex="1">
                                                    <option>-- Select Category --</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <input type="submit" name="submit" class="btn btn-primary" value="Save">
                                        <a href="add_menu.aspx" class="btn btn-inverse">Cancel</a>
                                    </div>
                                </div>
                            </form>--%>
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
