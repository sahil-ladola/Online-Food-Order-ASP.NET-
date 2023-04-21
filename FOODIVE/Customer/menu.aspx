<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="FOODIVE.Customer.menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE | Menu</title>
    <style>
        *{
            font-family:'Open Sans', sans-serif;
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
                            ( <asp:Label ID="quanatc" Text="0" runat="server"></asp:Label> )
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
    <div id="carouselExampleDark" class="carousel carousel-dark slide " data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../Image/Img/Menu.jpg" class="d-block w-100" alt="Slide 1" style="height: 70vh">
            </div>
        </div>
    </div>
    <div class="container text-center mt-3">
        <div class="row justify-content-md-center">
            <div class="col-md-auto">
                <h1 class="border-bottom p-3">Menu</h1>
                <%--<nav class="navbar bg-white">
                    <div class="container-fluid">
                        <h5 class="navbar-brand">Category </h5>
                        <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Search Food" aria-label="Search">
                            <button class="btn btn-secondary" type="submit">Search</button>
                        </form>
                    </div>
                </nav>--%>
                <div class="container text-center">
                    <%--<h5 class="border-bottom p-3 text-start text-secondary">Italian</h5>--%>
                    <div class="row">
                        <div class="col-12">
                            <div class="container text-center m-3">
                                <%--<div class="row m-3">
                                    <div class="col-3"><h6 class="text-secondary border-bottom">Dish Image</h6></div>
                                    <div class="col-3"><h6 class="text-secondary border-bottom">Dish Name</h6></div>
                                    <div class="col-3"><h6 class="text-secondary border-bottom">Price</h6></div>
                                    <div class="col-3"></div>
                                </div>--%>
                                <% 
                                    if (d_id.Count == 0)
                                    {
                                            %>
                                <div class="row m-3">
                                    <div class="col-12 text-center">
                                        <h1>No Dishes Available!!!Right Now...</h1>
                                    </div>
                                </div>
                                <%
                                    }
                                    else
                                    {
                        %>
                                <div class="row m-3">
                                    <%
                                        for (int i = 0; i <= d_id.Count - 1; i++)
                                        {
                        %>
                                    <div class="col-3">
                                        <% Response.Write("<img src='"+ image[i] +"' alt='"+ dishname[i] +"' class='shadow border rounded-2' height='100' width='100'>"); %>
                                            
                                    </div>
                                    <div class="col-3 text-start">
                                        <h4><% Response.Write(dishname[i]); %></h4>
                                        <p class="text-secondary small"><% Response.Write(description[i]); %></p>
                                    </div>
                                    <div class="col-3 fw-bold"><% Response.Write(price[i]); %></div>
                                    <div class="col-3">
                                        <% Response.Write("<a href='cart.aspx?d_id=" + d_id[i] + "' class='btn btn-primary'>Add to cart</a>"); %>
                                    </div>
                                    <%
                                            }
                                        }%>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
