<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order_update.aspx.cs" Inherits="FOODIVE.admin.order_update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <title>FOODIVE | Update Orders</title>
    <link rel="shortcut icon" href="/Image/Favicon/Favicon.png" type="image/x-icon">
    <link href="css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="css/helper.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="fix-header fix-sidebar">
    <div id="main-wrapper">
        <div class="header">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/Admin/dashboard.aspx">
                        <span>
                            <img src="/Image/LOGO/foodive-logos_black.png" width="50px" alt="homepage" class="dark-logo" /></span>
                    </a>
                </div>
                <div class="navbar-collapse">
                    <ul class="navbar-nav mr-auto mt-md-0"></ul>
                    <ul class="navbar-nav my-lg-0">
                        <li class="nav-item dropdown">
                            <div class="dropdown-menu dropdown-menu-right mailbox animated zoomIn">
                                <ul>
                                    <li>
                                        <div class="drop-title">Notifications</div>
                                    </li>
                                    <li>
                                        <a class="nav-link text-center" href="javascript:void(0);"><strong>Check all notifications</strong> <i class="fa fa-angle-right"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted  " href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="images/bookingSystem/user-icn.png" alt="user" class="profile-pic" /></a>
                            <div class="dropdown-menu dropdown-menu-right animated zoomIn">
                                <ul class="dropdown-user">
                                    <li><a href=" /Admin/logout.aspx"><i class="fa fa-power-off"></i>Logout</a></li>
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
                                    <h4 class="m-b-0 text-white">Update Order</h4>
                                </div>
                                <div class="table-responsive m-t-40">
                                    <form runat="server">
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
                                                <%
                                                    if (order_id.Count == 0)
                                                    {
                                                %>
                                                <td colspan="9">
                                                    <center>No Orders</center>
                                                </td>
                                                <%}
                                                    else
                                                    {
                                                        for (int i = 0; i < order_id.Count; i++)
                                                        {%>
                                                <tr>
                                                    <td><% Response.Write(fname[i]); %></td>
                                                    <td><% Response.Write(lname[i]); %></td>
                                                    <td><% Response.Write(address[i]); %></td>
                                                    <td><% Response.Write(date[i]); %> </td>
                                                    <td><% Response.Write(amount[i]); %> </td>
                                                    <td>
                                                        <table class='table table-hover'>
                                                            <thead>
                                                                <tr>
                                                                    <th scope='col'>dishname</th>
                                                                    <th scope='col'>Quantity</th>
                                                                    <th scope='col'>Price</th>
                                                                    <th scope='col'>Status</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <% for (int j = 0; j < o_id.Count; j++)
                                                                    {
                                                                        if (order_id[i] == or_id[j])
                                                                        {%>
                                                                <tr>
                                                                    <td><% Response.Write(dishname[j]); %></td>
                                                                    <td><% Response.Write(quantity[j]); %></td>
                                                                    <td><% Response.Write(price[j]); %></td>
                                                                    <td>
                                                                        <input type="radio" runat="server" class="btn-check" name="status" value="1" id="option2" autocomplete="off">
                                                                        <label class="btn fa fa-check-circle" style="background: #5c4ac7; color: white;" for="option2">Delivered</label>

                                                                        <input type="radio" runat="server" class="btn-check" name="status" value="2" id="option3" autocomplete="off">
                                                                        <label class="btn fa fa-cog" style="background: #ffb22b; color: white;" for="option3" checked>Processing</label>

                                                                        <input type="radio" runat="server" class="btn-check" name="status" value="3" id="option4" autocomplete="off">
                                                                        <label class="btn fa fa-close" style="background: #ef5350; color: white;" for="option4">Cancelled</label>
                                                                    </td>
                                                                </tr>
                                                                <%}
                                                                    } %>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <%}
                                                    }%>
                                            </tbody>
                                        </table>
                                        <asp:Button class="btn btn-primary text-white" ID="update" runat="server" Text="Update" OnClick="update_Click" />
                                    </form>
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
    <script src="js/lib/datatables/datatables.min.js"></script>
    <script src="js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script src="js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
    <script src="js/lib/datatables/cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script src="js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>
