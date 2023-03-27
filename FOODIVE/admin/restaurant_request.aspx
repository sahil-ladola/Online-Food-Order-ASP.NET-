<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="restaurant_request.aspx.cs" Inherits="FOODIVE.admin.restaurant_request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>FOODIVE | Restaurant Requests</title>
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
                    <a class="navbar-brand" href="../Admin/dashboard.aspx">
                        <span>
                            <img src="../Image/LOGO/foodive-logos_black.png" width="50px" alt="LOGO" class="dark-logo" />
                        </span>
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
                                    <li><a href="../Admin/logout.aspx"><i class="fa fa-power-off"></i>Logout</a></li>
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
                        <li><a href="../Admin/dashboard.aspx"><i class="fa fa-tachometer"></i><span>Dashboard</span></a>
                        </li>
                        <li class="nav-label">Log</li>
                        <li><a href="../Admin/all_users.aspx"><span><i class="fa fa-user f-s-20 "></i></span><span>Users</span></a></li>
                        <li><a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-archive f-s-20 color-warning"></i><span class="hide-menu">Restaurant</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="../Admin/all_restaurant.aspx">All Restaurant</a></li>
                                <li><a href="restaurant_request.aspx">Restaurant Request</a></li>
                            </ul>
                        </li>
                        <li><a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-delicious f-s-20 color-warning"></i><span class="hide-menu">Categories</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="all_category.aspx">All Categories</a></li>
                                <li><a href="add_category.aspx">Add Categories</a></li>
                            </ul>
                        </li>
                        <li><a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-cutlery" aria-hidden="true"></i><span class="hide-menu">Menu</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="../Admin/all_menu.aspx">All Menues</a></li>
                                <li><a href="../Admin/add_menu.aspx">Add Menu</a></li>
                            </ul>
                        </li>
                        <li><a href="../Admin/all_orders.aspx"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span>Orders</span></a></li>
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
                                    <h4 class="m-b-0 text-white">Restaurant Requests</h4>
                                </div>
                                <div class="table-responsive m-t-40">
                                    <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Manager name</th>
                                                <th>Manager phone number</th>
                                                <th>Manager email</th>
                                                <th>Manager adhaar card image</th>
                                                <th>Manager address</th>
                                                <th>Manager city</th>
                                                <th>Manager pincode</th>
                                                <th>Restaurant name</th>
                                                <th>Restaurant phone number</th>
                                                <th>Restaurant email</th>
                                                <th>Restaurant image</th>
                                                <th>Restaurant sub-brach status</th>
                                                <th>Restaurant address</th>
                                                <th>Restaurant city</th>
                                                <th>Restaurant pincode</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                             <% if (req_id.Count == 0)
                                                {
                                            %>
                                            <tr>
                                                <td colspan="16">
                                                    <center>No Restaurant Requests</center>
                                                </td>
                                            </tr>
                                            <% }
                                                else
                                                {
                                                    for (int i = 0; i <= req_id.Count - 1; i++)
                                                    {
                                            %>
                                            <tr>
                                                <td><% Response.Write(mng_name[i]);%></td>
                                                <td><% Response.Write(mng_phone_num[i]);%></td>
                                                <td><% Response.Write(mng_email[i]);%></td>
                                                <td><% Response.Write("<div class='col-md-3 col-lg-8 m-b-10'><center><img class='img-responsive radius'  style='min-width:150px;min-height:100px;' src='"+ mng_adharcard[i] +"'></center></div>");%></td>
                                                <td><% Response.Write(mng_address[i]);%></td>
                                                <td><% Response.Write(mng_city[i]);%></td>
                                                <td><% Response.Write(mng_pincode[i]);%></td>
                                                <td><% Response.Write(res_name[i]);%></td>
                                                <td><% Response.Write(res_phone_number[i]);%></td>
                                                <td><% Response.Write(res_email[i]);%></td>
                                                <td><% Response.Write("<div class='col-md-3 col-lg-8 m-b-10'><center><img class='img-responsive radius'  style='min-width:150px;min-height:100px;' src='"+ res_image[i] +"'></center></div>");%></td>
                                                <td><% if (res_sub_status[i] == "1")
                                                        {
                                                            Response.Write("Yes");
                                                        }
                                                        else
                                                        {
                                                            Response.Write("No");
                                                        }%></td>
                                                <td><% Response.Write(res_address[i]);%></td>
                                                <td><% Response.Write(res_city[i]);%></td>
                                                <td><% Response.Write(res_pincode[i]);%></td>
                                                <td><% Response.Write("<a href='delete_request.aspx?res_req_del=" + req_id[i] + "' class='btn btn-danger btn-flat btn-addon btn-xs m-b-10'><i class='fa fa-trash-o' style='font-size:16px'></i></a><a href='accept_request.aspx?res_req_acc=" + req_id[i] + "' class='btn btn-info btn-flat btn-addon btn-sm m-b-10 m-l-5'><i class='fa fa-check'></i></a>"); %></td>
                                            </tr>
                                            <%
                                                    }
                                                }%>
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
