<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subrest.aspx.cs" Inherits="FOODIVE.Customer.subrest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE | Restaurant</title>
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
                <a href="../Customer/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                    <img class="bi me-2" width="40" height="40" role="img" src="../Image/LOGO/foodive-logos_black.png" alt="FOODIVE">
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link text-decoration-none text-muted" href="../Customer/afterlogin.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-decoration-none text-muted" href="../Customer/Order.aspx">My Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-decoration-none text-muted" href="../Customer/Logout.aspx">Logout</a>
                    </li>
                </ul>
                <div class="text-end">
                    <div class="dropdown text-end">
                        <a href="../Customer/AddToCart.aspx" class="text-decoration-none mx-2 text-info">
                            <img src="../Image/Icon/Cart.png" alt="cart" height="20" width="20">
                            (
                            <asp:Label ID="quanatc" Text="0" runat="server"></asp:Label>
                            )
                        </a>
                        <a href="../Customer/profile.aspx" class="link-dark text-decoration-none">
                            <asp:Label ID="lblusername" class="px-2 text-secondary" runat="server" Text="Username"></asp:Label>
                            <img src="../Image/Icon/User.png" id="User" alt="User" width="32" height="32" class="rounded-circle">
                        </a>
                    </div>
                </div>
            </div>
        </header>
    </div>
    <div class="container-fluid">
        <div class="container">
            <h1 class="display-5 fw-bold mt-5 text-center">Restaurant in different area</h1>
            <div class="col-lg-6 mx-auto mb-5 text-center">
                <p class="lead text-muted">Choose your restaurant</p>
            </div>
            <div class="row g-4">
                <%
                    for (int i = 0; i <= rest_id.Count - 1; i++)
                    {
                %>
                <center>
                    <div class="col-4">
                        <div class="card shadow" style="width: 22rem;">
                            <% Response.Write("<a href='../Customer/menu.aspx?rest_id=" + rest_id[i].ToString() + "' class='text-decoration-none text-body'>"); %>
                            <% Response.Write("<img src='" + image[i] + "' class='card-img-top' alt='" + title[i] + " image' height='280' width='350' />"); %>
                            <div class="card-body">
                                <h5 class="card-title">
                                    <center><% Response.Write(title[i]); %></center>
                                </h5>
                                <p class="text-muted mb-0"><% Response.Write(address[i]); %></p>
                            </div>
                            <% Response.Write("</a>"); %>
                        </div>
                    </div>
                </center>
                <%
                    } %>
                <% if (subrest_id.Count != 0)
                    {%>
                <div class="row g-4">
                    <%
                        for (int i = 0; i <= subrest_id.Count - 1; i++)
                        {
                    %>
                    <div class="col-4">
                        <div class="card shadow" style="width: 22rem;">
                            <% Response.Write("<a href='../Customer/menu.aspx?rest_id=" + srest_id[i].ToString() + "&subrest_id=" + subrest_id[i].ToString() + "' class='text-decoration-none text-body'>"); %>
                            <% Response.Write("<img src='" + subimage[i] + "' class='card-img-top' alt='" + subtitle[i] + " image' height='280' width='350' />"); %>
                            <div class="card-body">
                                <center>
                                    <h5 class="card-title">
                                        <% Response.Write(subtitle[i]); %>
                                    </h5>
                                    <p class="text-muted mb-0"><% Response.Write(subaddress[i]); %></p>
                                </center>
                            </div>
                            <% Response.Write("</a>"); %>
                        </div>
                    </div>
                    <%}
                        } %>
                </div>
            </div>
            <footer class="container footer d-flex flex-wrap justify-content-between align-items-center py-3 mt-5 border-top">
                <p class="col-md-4 mb-0 text-muted">© 2023, Created by SAHIL LADOLA</p>
                <asp:HyperLink class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none" runat="server" NavigateUrl="~/Visitor/index.aspx">
        <img src="../Image/LOGO/foodive-logos_black.png" alt="LOGO" height="80" width="80">
                </asp:HyperLink>
                <ul class="nav col-md-4 justify-content-end"></ul>
            </footer>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
