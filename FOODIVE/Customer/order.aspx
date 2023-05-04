<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="FOODIVE.Customer.order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE | My Orders</title>
    <style>
        * {
            font-family: 'Open Sans', sans-serif;
        }
    </style>
    <link rel="shortcut icon" href="../Image/Favicon/Favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <header class="p-3 border-bottom">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="../Customer/afterlogin.aspx" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                    <img class="bi me-2" width="40" height="40" role="img" src="../Image/LOGO/foodive-logos_black.png" alt="FOODIVE">
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="../Customer/afterlogin.aspx" class="nav-link px-2 text-secondary">Home</a></li>
                    <li><a href="../Customer/AddToCart.aspx" class="nav-link px-2 text-secondary">Add to cart</a></li>
                    <li><a href="../Customer/Logout.aspx" class="nav-link px-2 text-secondary">Logout</a></li>
                </ul>

                <div class="text-end">
                    <div class="dropdown text-end">
                        <a href="profile.aspx" class="text-decoration-none">
                            <label for="User" class="px-2 text-secondary">
                                <asp:Label ID="lblusername" class="px-2 text-secondary" runat="server" Text="Label"></asp:Label></label>
                            <img src="../Image/Icon/User.png" id="User" alt="User" width="32" height="32" class="rounded-circle">
                        </a>
                    </div>
                </div>
            </div>
        </header>
    </div>
    <div>
        <img src="../Image/Img/Add-Restro.jpg" class="img-fluid mh-100 mw-100" alt="Add-Restro" style="width: 100%; height: 450px;">
    </div>
    <div class="container">
        <table class="table table-bordered mt-3 table-hover">
            <thead class="bg-dark text-white">
                <tr>
                    <th scope="col">Item</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%if (o_id.Count == 0)
                    {%><td colspan="6">
                        <center>You have No orders Placed yet. </center>
                    </td>
                <%}
                    else
                    {
                        for (int i = 0; i <= o_id.Count - 1; i++)
                        {%>
                <tr>
                    <th scope="row"><% Response.Write(dishname[i]); %></th>
                    <td><% Response.Write(quantity[i]); %></td>
                    <td><% Response.Write(Convert.ToInt32(price[i]) * Convert.ToInt32(quantity[i]) + "/-"); %></td>
                    <td>
                        <%

                            if (status[i] == "3")
                            {
                        %>
                        <p class="text-danger">Cancelled</p>
                        <%
                            }
                            if (status[i] == "1")
                            {
                        %>
                        <p class="text-success">Delivered</p>
                        <%
                            }
                            if (status[i] == "2")
                            {
                        %>
                        <p class="text-warning">Processing</p>
                        <%
                            }
                        %>
                    <td>
                        <%
                            if (status[i] == "2")
                            {
                        %>
                        <% Response.Write("<a href='delete.aspx?order_del=" + o_id[i] +"'>");%>
                        <button class="btn btn-danger">
                            <img src="/Image/Icon/delete.png" alt="Del" height="20" width="20">
                        </button>
                        <% Response.Write("</a>"); %>
                        <%
                            }
                            else
                            {
                        %>
                        <p class="text-success">Done</p>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <%}
                    } %>
            </tbody>
        </table>
        <a href="../Customer/afterlogin.aspx" class="text-decoration-none">
            <div class="d-grid gap-2 col-6 mx-auto my-4">
                <button class="btn btn-primary" type="button">Continue Ordering</button>
            </div>
        </a>
    </div>
    <footer class="container footer d-flex flex-wrap justify-content-between align-items-center py-3 mt-2 border-top">
        <p class="col-md-4 mb-0 text-muted">© 2022 Company, Inc , Created by SAHIL LADOLA</p>

        <a href="#" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            <img src="../Image/LOGO/foodive-logos_black.png" alt="LOGO" height="80" width="80">
        </a>

        <ul class="nav col-md-4 justify-content-end">
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted"></a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted"></a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted"></a></li>
        </ul>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
