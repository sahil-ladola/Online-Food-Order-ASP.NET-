<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="afterlogin.aspx.cs" Inherits="FOODIVE.Customer.afterlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE | Home</title>
    <link rel="shortcut icon" href="/Project_demo/Image/Favicon/Favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .hero::before {
            content: "";
            display: block;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1;
            background-color: rgba(7, 6, 29, 0.37);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color:whitesmoke;">
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
                        <asp:HyperLink ID="HyperLink2" class="nav-link" runat="server" NavigateUrl="~/Customer/afterlogin.aspx">Home</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink3" class="nav-link" runat="server" NavigateUrl="~/Customer/order.aspx">My Orders</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink4" class="nav-link" runat="server" NavigateUrl="~/Customer/Logout.aspx">Logout</asp:HyperLink>
                    </li>
                </ul>
                <div class="text-end">
                    <div class="dropdown text-end">
                        <asp:HyperLink ID="HyperLink5" class="text-decoration-none mx-2 text-info" runat="server" NavigateUrl="~/Customer/AddToCart.aspx">
                            <img src="../Image/Icon/Cart.png" alt="cart" height="20" width="20"> ( 0 )
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
                <asp:Image class="d-block w-100" alt="Slide 1" style="height:70vh; opacity:0.9;" runat="server" ImageUrl="~/Image/Img/Index-Slide2.jpg" />
                <div class="carousel-caption d-none d-md-block v-center mb-5">
                    <h5 class="mb-5 display-3 fw-bolder text-dark">Eat healthy</h5>
                    <p class="mb-5 text-dark" style="font-size: 30px;">Stay healthy</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="3000">
                <asp:Image class="d-block w-100" alt="Slide 2" style="height:70vh; opacity:0.9;" runat="server" ImageUrl="~/Image/Img/Index-Slide1.jpg" />
                <div class="carousel-caption d-none d-md-block v-center mb-5">
                    <h5 class="mb-5 pb-5 display-3 fw-bolder text-dark">Fresh Ingredients</h5>
                    <p class="mb-5 text-dark" style="font-size: 30px;"></p>
                </div>
            </div>
            <div class="carousel-item " data-bs-interval="3000">
                <asp:Image class="d-block w-100" alt="Slide 3" style="height:70vh; opacity:0.9;" runat="server" ImageUrl="~/Image/Img/Index-Slide3.jpg" />
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
            <div class="row g-4">
                    <div class="col-4">
                        <div class="card shadow" style="width: 22rem;">
                            <asp:HyperLink runat="server" class="text-decoration-none text-body">
                                <asp:Image class="card-img-top" alt="FOODIES" height="280" width="350" runat="server" ImageUrl="~/admin/Res_img/632e9058ec62a.jpg" />
                                <div class="card-body">
                                    <h5 class="card-title">FOODIES</h5>
                                    <p class="text-muted mb-0">UTU</p>
                                </div>
                            </asp:HyperLink>
                            <!-- <ul class="list-group list-group-flush text-center">
                                    <li class="list-group-item">
                                        <img src="/Project_demo/Image/Icon/5star.png" alt="5" height="50" width="50">
                                    </li>
                                    <li class="list-group-item">
                                        <div class="d-grid">
                                            <button class="btn btn-outline-danger" type="button">Add to favorite</button>
                                        </div>
                                    </li>
                                </ul> -->
                        </div>
                    </div>
                <div class="col-4">
                        <div class="card shadow" style="width: 22rem;">
                            <asp:HyperLink runat="server" class="text-decoration-none text-body">
                                <asp:Image class="card-img-top" alt="LEAF" height="280" width="350" runat="server" ImageUrl="~/admin/Res_img/632e914a15bf1.jpg" />
                                <div class="card-body">
                                    <h5 class="card-title">LEAF CAFE</h5>
                                    <p class="text-muted mb-0">CITYLIGHT</p>
                                </div>
                            </asp:HyperLink>
                            <!-- <ul class="list-group list-group-flush text-center">
                                    <li class="list-group-item">
                                        <img src="/Project_demo/Image/Icon/5star.png" alt="5" height="50" width="50">
                                    </li>
                                    <li class="list-group-item">
                                        <div class="d-grid">
                                            <button class="btn btn-outline-danger" type="button">Add to favorite</button>
                                        </div>
                                    </li>
                                </ul> -->
                        </div>
                    </div>
                <div class="col-4">
                        <div class="card shadow" style="width: 22rem;">
                            <asp:HyperLink runat="server" class="text-decoration-none text-body">
                                <asp:Image class="card-img-top" alt="" height="280" width="350" runat="server" ImageUrl="~/admin/Res_img/dishes638f38229dcb1.jpg" />
                                <div class="card-body">
                                    <h5 class="card-title">GATE TO GOA CAFE</h5>
                                    <p class="text-muted mb-0">VESU</p>
                                </div>
                            </asp:HyperLink>
                            <!-- <ul class="list-group list-group-flush text-center">
                                    <li class="list-group-item">
                                        <img src="/Project_demo/Image/Icon/5star.png" alt="5" height="50" width="50">
                                    </li>
                                    <li class="list-group-item">
                                        <div class="d-grid">
                                            <button class="btn btn-outline-danger" type="button">Add to favorite</button>
                                        </div>
                                    </li>
                                </ul> -->
                        </div>
                    </div>
                <div class="container px-4 py-5 text-center " id="Works">
                    <h1 class="display-5 fw-bold my-5">How FOODIVE works?</h1>
                    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
                        <div class="col d-flex align-items-start">
                            <div class="icon-square rounded text-dark flex-shrink-0 me-3">
                                <asp:Image height="80" width="80" class="bi" alt="Restro-icon" runat="server" ImageUrl="~/Image/Icon/Cart.png" />
                            </div>
                            <div class="mb-4">
                                <h2>Step 1</h2>
                                <h5>Add your food</h5>
                                <p><small>Set custom minimum food online order values for different delivery location.</small></p>
                            </div>
                        </div>
                        <div class="col d-flex align-items-start">
                            <div class="icon-square rounded text-dark flex-shrink-0 me-3">
                                <asp:Image height="80" width="80" class="bi" alt="Payment-icon" runat="server" ImageUrl="~/Image/Icon/Payment.png" />
                            </div>
                            <div class="mb-4">
                                <h2>Step 2</h2>
                                <h5>Make payment</h5>
                                <p><small>Order Online page is completely secure and your payment makes through payment gateways.</small></p>
                            </div>
                        </div>
                        <div class="col d-flex align-items-start">
                            <div class="icon-square rounded text-dark flex-shrink-0 me-3">
                                <asp:Image height="80" width="80" class="bi" alt="Delivery-icon" runat="server" ImageUrl="~/Image/Icon/restaurant.png" />
                            </div>
                            <div class="mb-4">
                                <h2>Step 3</h2>
                                <h5>Take out</h5>
                                <p><small class="text-muted">Customers order their food online and food is ready by the time customer reached at Restaurant for take out.</small> </p>
                            </div>
                        </div>
                    </div>
                    <!-- <hr> -->
                </div>
                <!-- <div class="px-4 text-center" id="Locations">
        <h1 class="display-5 fw-bold my-5">Popular localities in SURAT</h1>
        <div class="col-lg-6 mx-auto my-5">
            <p class="lead">Browse through city to find places in Surat
                that provides Delivery</p>
        </div>
        <div class="container">
            <div class="container ">
                <div class="row row-cols-2 row-cols-lg-3 g-2 g-lg-3 ">
                    <div class="col">
                        <div class="pt-2 border rounded shadow-sm bg-light">
                            <h5>Vesu</h5>
                            <p><small>400 Places</small></p>
                        </div>
                    </div>

                    <div class="col">
                        <div class="pt-2 border rounded shadow-sm bg-light">
                            <h5>Piplod</h5>
                            <p><small>200 Places</small></p>
                        </div>
                    </div>


                    <div class="col">
                        <div class="pt-2 border rounded shadow-sm bg-light">
                            <h5>Adajan</h5>
                            <p><small>350 Places</small></p>
                        </div>
                    </div>


                    <div class="col">
                        <div class="pt-2 border rounded shadow-sm bg-light">
                            <h5>City Light</h5>
                            <p><small>140 Places</small></p>
                        </div>
                    </div>


                    <div class="col">
                        <div class="pt-2 border rounded shadow-sm bg-light">
                            <h5>Athwa</h5>
                            <p><small>170 Places</small></p>
                        </div>
                    </div>


                    <div class="col">
                        <div class="pt-2 border rounded shadow-sm bg-light">
                            <h5>Katargam</h5>
                            <p><small>100 Places</small></p>
                        </div>
                    </div>


                    <div class="col">
                        <div class="pt-2 border rounded shadow-sm bg-light">
                            <h5>Nana Varachha</h5>
                            <p><small>100 Places</small></p>
                        </div>
                    </div>


                    <div class="col">
                        <div class="pt-2 border rounded shadow-sm bg-light">
                            <h5>Pal Gam</h5>
                            <p><small>120 Places</small></p>
                        </div>
                    </div>


                    <div class="col">
                        <div class="pt-2 border rounded shadow-sm bg-light">
                            <h5>Hirabaug</h5>
                            <p><small>10 Places</small></p>
                        </div>
                    </div>


                    <div class="col">
                        <div class="pt-2 border rounded shadow-sm bg-light">
                            <h5>Sarthana</h5>
                            <p><small>39 Places</small></p>
                        </div>
                    </div>


                    <div class="col">
                        <div class="pt-2 border rounded shadow-sm bg-light">
                            <h5>Mota Varachha</h5>
                            <p><small>197 Places</small></p>
                        </div>
                    </div>

                    <div class="col">
                        <div class="pt-2 border rounded shadow-sm bg-light">
                            <h5>Amroli</h5>
                            <p><small>70 Places</small></p>
                        </div>
                    </div>

                </div>-->
            </div> 
        </div>
    </div>

        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
