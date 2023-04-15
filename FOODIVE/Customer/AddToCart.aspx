<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="FOODIVE.Customer.AddToCart1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE | Cart</title>
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
                    <li><a href="../Customer/Order.aspx" class="nav-link px-2 text-secondary">My Orders</a></li>
                    <li><a href="../Customer/Logout.aspx" class="nav-link px-2 text-secondary">Logout</a></li>
                </ul>

                <div class="text-end">
                    <div class="dropdown text-end">
                        <a href="profile.aspx" class="text-decoration-none">
                            <asp:Label ID="lblusername" class="px-2 text-secondary" runat="server" Text="Label"></asp:Label>
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
                <img src="../Image/Img/AddToCart.jpg" class="d-block w-100" alt="Slide 1" style="height: 70vh">
                <div class="carousel-caption d-none d-md-block v-center mb-5">
                    <h5 class="mb-5 display-3 fw-bolder text-white">Cart</h5>
                    <p class="mb-5 display-6 text-white"><small>Your cart list</small></p>
                </div>
            </div>
        </div>
    </div>
    <div class="container my-5">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Dish</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total</th>
                    <th scope="col">Delete</th>
                </tr>
            </thead>
            <tbody class="table-group-divider">
                <% if (atc_id.Count == 0)
                    {
                %>
                <tr class="align-middle text-center">
                    <td colspan="5" class="text-secondary">
                        <h3>No Cart</h3>
                    </td>
                </tr>
                <%

                    }
                    else
                    {
                        for (int i = 0; i <= atc_id.Count - 1; i++)
                        {
                %>

                <tr class="align-middle">
                    <td><% Response.Write("<img class='border rounded me-2' src='" + image[i] + "' width='70' height='70'>"); %><% Response.Write(dishname[i]);%></td>
                    <td><% Response.Write(price[i]); %>
                        <input type="hidden" class="dishprice" value="<% Response.Write(price[i]); %>">
                    </td>
                    <td>
                        <form action="modquan.aspx">
                            <input type="number" class="text-center dishquantity" onchange="this.form.submit();" name="modquantity" value="<% Response.Write(quantity[i]); %>" min="1" width="50px">
                            <input type="hidden" name="atc_id" value="<% Response.Write(atc_id[i]); %>">
                        </form>
                    </td>
                    <td class="subtotal">
                        <% int subtotal = Convert.ToInt32(quantity[i]) * Convert.ToInt32(price[i]);
                            Response.Write(subtotal); %>

                    </td>
                    <td>
                        <form action="deletecart.aspx">
                            <button class="btn btn-danger" name="cartremove">
                                <img src="../Image/Icon/delete.png" alt="Del" height="20" width="20">
                            </button>
                            <input type="hidden" name="atc_id" value="<% Response.Write(atc_id[i]); %>">
                        </form>
                    </td>
                </tr>
                <% }
                    } %>
            </tbody>
        </table>
    </div>
    <div class="container">
    </div>
    <div class="container">
        <div class="card w-100 shadow-sm">
            <div class="card-header text-muted">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            Total Amount :
                        </div>
                        <div class="col text-end" id="total">
                            <% int gt = 0;
                                for (int i = 0; i <= atc_id.Count - 1; i++)
                                {
                                    gt = gt + Convert.ToInt32(quantity[i]) * Convert.ToInt32(price[i]);
                                }
                                Response.Write(gt); %>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-grid gap-2">
                <%
                    if (atc_id.Count == 0)
                    {
                %>

                <button class="btn btn-danger btn-lg disabled">Checkout</button>
                <% }
                    else
                    { %>
                <a href="payment.aspx" class="btn btn-success btn-lg active">Checkout</a>
                <% } %>
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
