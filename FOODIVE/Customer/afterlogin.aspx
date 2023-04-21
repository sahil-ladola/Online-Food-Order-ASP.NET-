<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="afterlogin.aspx.cs" Inherits="FOODIVE.Customer.afterlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE | Home</title>
    <link rel="shortcut icon" href="../Image/Favicon/Favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        *{
            font-family:'Open Sans', sans-serif;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: whitesmoke;">
        <div class="container">
            <asp:HyperLink ID="HyperLink1" class="navbar-brand" runat="server" NavigateUrl="~/Customer/afterlogin.aspx">
                <img src="../Image/LOGO/foodive-logos_black.png" alt="FOODIVE" height="40" width="40">
            </asp:HyperLink>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink3" class="nav-link" runat="server" NavigateUrl="~/Customer/order.aspx">My Orders</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink class="nav-link" runat="server" NavigateUrl="~/Restaurant/Registration.aspx">Register Restaurant</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink4" class="nav-link" runat="server" NavigateUrl="~/Customer/Logout.aspx">Logout</asp:HyperLink>
                    </li>
                </ul>
                <div class="text-end">
                    <div class="dropdown text-end">
                        <asp:HyperLink ID="HyperLink5" class="text-decoration-none mx-2 text-info" runat="server" NavigateUrl="~/Customer/AddToCart.aspx">
                            <img src="../Image/Icon/Cart.png" alt="cart" height="20" width="20"> ( <asp:Label ID="quanatc" runat="server"></asp:Label> )
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink6" class="text-decoration-none" runat="server" NavigateUrl="~/Customer/profile.aspx">
                            <asp:Label ID="lblusername" class="px-2 text-secondary" runat="server" Text="Label"></asp:Label>
                            <img src="../Image/Icon/User.png" id="User" alt="User" width="32" height="32" class="rounded-circle">
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div id="carouselExampleDark" class="carousel carousel-dark slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner hero">
            <div class="carousel-item active" data-bs-interval="3000">
                <asp:Image class="d-block w-100" alt="Slide 1" Style="height: 70vh; opacity: 0.9;" runat="server" ImageUrl="~/Image/Img/Index-Slide2.jpg" />
                <div class="carousel-caption d-none d-md-block v-center mb-5">
                    <h5 class="mb-5 display-3 fw-bolder text-dark">Eat healthy</h5>
                    <p class="mb-5 text-dark" style="font-size: 30px;">Stay healthy</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="3000">
                <asp:Image class="d-block w-100" alt="Slide 2" Style="height: 70vh; opacity: 0.9;" runat="server" ImageUrl="~/Image/Img/Index-Slide1.jpg" />
                <div class="carousel-caption d-none d-md-block v-center mb-5">
                    <h5 class="mb-5 pb-5 display-3 fw-bolder text-dark">Fresh Ingredients</h5>
                    <p class="mb-5 text-dark" style="font-size: 30px;"></p>
                </div>
            </div>
            <div class="carousel-item " data-bs-interval="3000">
                <asp:Image class="d-block w-100" alt="Slide 3" Style="height: 70vh; opacity: 0.9;" runat="server" ImageUrl="~/Image/Img/Index-Slide3.jpg" />
                <div class="carousel-caption d-none d-md-block v-center mb-5">
                    <h5 class="mb-5 display-3 fw-bolder text-dark">Better world with</h5>
                    <p class="mb-5 text-dark" style="font-size: 30px;">Better food.</p>
                </div>
            </div>

        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div class="container-fluid">
        <div class="container">
            <h1 class="display-5 fw-bold mt-5 text-center">Our Restaurants</h1>
            <div class="col-lg-6 mx-auto mb-5 text-center">
                <p class="lead text-muted">Our restaurants at different locations.</p>
            </div>
            <% 
                if (rest_id.Count == 0)
                {
                                            %>
            <div class="row g-4">
                <div class="col-12 text-center">
                    <div class="card shadow" style="width: 22rem;">
                        <h1>No Restaurant Available!!!Right Now...</h1>
                    </div>
                </div>
                </div>
                <%
                }
                else
                {
                        %>
            <div class="row g-4">
                <%
                    for (int i = 0; i <= rest_id.Count - 1; i++)
                    {
                        %>
                <div class="col-4">
                    <div class="card shadow" style="width: 22rem;">
                        <% Response.Write("<a href='../Customer/menu.aspx?rest_id="+ rest_id[i].ToString() +"' class='text-decoration-none text-body'>"); %>
                        <% Response.Write("<img src='"+ image[i] +"' class='card-img-top' alt='"+ title[i] +" image' height='280' width='350' />"); %>
                                <div class="card-body">
                                    <h5 class="card-title"><% Response.Write(title[i]); %></h5>
                                    <p class="text-muted mb-0"><% Response.Write(address[i] + " , " + city[i] + " , " + pincode[i]); %></p>
                                </div>
                        <% Response.Write("</a>"); %>
                    </div>
                </div><%
                              }
                          }%>
                <div class="container px-4 py-5 text-center " id="Works">
                    <h1 class="display-5 fw-bold my-5">How FOODIVE works?</h1>
                    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
                        <div class="col d-flex align-items-start">
                            <div class="icon-square rounded text-dark flex-shrink-0 me-3">
                                <asp:Image Height="80" Width="80" class="bi" alt="Restro-icon" runat="server" ImageUrl="~/Image/Icon/Cart.png" />
                            </div>
                            <div class="mb-4">
                                <h2>Step 1</h2>
                                <h5>Add your food</h5>
                                <p><small>Set custom minimum food online order values for different delivery location.</small></p>
                            </div>
                        </div>
                        <div class="col d-flex align-items-start">
                            <div class="icon-square rounded text-dark flex-shrink-0 me-3">
                                <asp:Image Height="80" Width="80" class="bi" alt="Payment-icon" runat="server" ImageUrl="~/Image/Icon/Payment.png" />
                            </div>
                            <div class="mb-4">
                                <h2>Step 2</h2>
                                <h5>Make payment</h5>
                                <p><small>Order Online page is completely secure and your payment makes through payment gateways.</small></p>
                            </div>
                        </div>
                        <div class="col d-flex align-items-start">
                            <div class="icon-square rounded text-dark flex-shrink-0 me-3">
                                <asp:Image Height="80" Width="80" class="bi" alt="Delivery-icon" runat="server" ImageUrl="~/Image/Icon/restaurant.png" />
                            </div>
                            <div class="mb-4">
                                <h2>Step 3</h2>
                                <h5>Take out</h5>
                                <p><small class="text-muted">Customers order their food online and food is ready by the time customer reached at Restaurant for take out.</small> </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="container footer d-flex flex-wrap justify-content-between align-items-center py-3 mt-2 border-top">
        <p class="col-md-4 mb-0 text-muted">© 2023, Created by SAHIL LADOLA</p>
        <asp:HyperLink class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none" runat="server" NavigateUrl="~/Visitor/index.aspx">
        <img src="../Image/LOGO/foodive-logos_black.png" alt="LOGO" height="80" width="80">
        </asp:HyperLink>
        <ul class="nav col-md-4 justify-content-end"></ul>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
