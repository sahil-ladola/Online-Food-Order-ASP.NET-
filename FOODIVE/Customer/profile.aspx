<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="FOODIVE.Customer.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE</title>
    <style>
        body {
            background: #eee;
        }

        .card {
            border: none;
            position: relative;
            overflow: hidden;
            border-radius: 8px;
            cursor: pointer;
        }

            .card:before {
                content: "";
                position: absolute;
                left: 0;
                top: 0;
                width: 4px;
                height: 100%;
                background-color: #87CEFA;
                transform: scaleY(1);
                transition: all 0.5s;
                transform-origin: bottom
            }

            .card:after {
                content: "";
                position: absolute;
                left: 0;
                top: 0;
                width: 4px;
                height: 100%;
                background-color: #0d6efd;
                transform: scaleY(0);
                transition: all 0.5s;
                transform-origin: bottom
            }

            .card:hover::after {
                transform: scaleY(1);
            }


        .fonts {
            font-size: 11px;
        }

        .social-list {
            display: flex;
            list-style: none;
            justify-content: center;
            padding: 0;
        }

            .social-list li {
                padding: 10px;
                color: #8E24AA;
                font-size: 19px;
            }


        .buttons button:nth-child(1) {
            border: 1px solid #8E24AA !important;
            color: #8E24AA;
            height: 40px;
        }

            .buttons button:nth-child(1):hover {
                border: 1px solid #8E24AA !important;
                color: #fff;
                height: 40px;
                background-color: #8E24AA;
            }

        .buttons button:nth-child(2) {
            border: 1px solid #8E24AA !important;
            background-color: #8E24AA;
            color: #fff;
            height: 40px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" />


    <link rel="shortcut icon" href="../Image/Favicon/Favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

    <div class="container">
        <header class="p-3 border-bottom">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <asp:HyperLink ID="HyperLink1" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none" runat="server" NavigateUrl="~/Customer/afterlogin.aspx">
                    <img class="bi me-2" width="40" height="40" role="img" src="../Image/LOGO/foodive-logos_black.png" alt="FOODIVE">
                </asp:HyperLink>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink2" class="nav-link text-decoration-none text-muted" runat="server" NavigateUrl="~/Customer/afterlogin.aspx">Home</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink3" class="nav-link text-decoration-none text-muted" runat="server" NavigateUrl="~/Customer/order.aspx">My Orders</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink4" class="nav-link text-decoration-none text-muted" runat="server" NavigateUrl="~/Logout.aspx">Logout</asp:HyperLink>
                    </li>
                </ul>
                <div class="text-end">

                    <div class="dropdown text-end">
                        <asp:HyperLink ID="HyperLink5" class="text-decoration-none mx-2 text-info" runat="server" NavigateUrl="~/Customer/AddToCart.aspx">
                            <img src="../Image/Icon/Cart.png" alt="cart" height="20" width="20">
                        </asp:HyperLink>
                        <asp:HyperLink ID="HyperLink6" class="text-decoration-none" runat="server" NavigateUrl="~/Customer/profile.aspx">
                            <asp:Label ID="lbluser" class="px-2 text-secondary" runat="server" Text="Label"></asp:Label>
                            <img src="../Image/Icon/User.png" id="User" alt="User" width="32" height="32" class="rounded-circle">
                        </asp:HyperLink>
                    </div>
                </div>
            </div>

        </header>
    </div>
    <div class="container mt-5">

        <div class="row d-flex justify-content-center">

            <div class="col-md-7">

                <div class="card p-3 py-4">

                    <div class="text-center">
                        <img src="../Image/Icon/User.png" width="100" class="rounded-circle">
                    </div>

                    <div class="text-center mt-3">
                        <span class="bg-secondary p-1 px-4 rounded text-white">
                            <asp:Label ID="Username" runat="server" Text="Label"></asp:Label></span>
                        <h5 class="mt-2 mb-0">
                            <asp:Label ID="Email" runat="server"></asp:Label></h5>
                        <span>Contact Number :
                            <asp:Label ID="ContactNumber" runat="server"></asp:Label></span>

                        <div class="px-4 mt-1">
                            <p class="fonts">Address :
                                <asp:Label ID="Address" runat="server"></asp:Label></p>

                        </div>

                        <%--<ul class="social-list">
                            <li></li>
                            <li></li>
                        </ul>--%>

                        <div class="buttons">
                            <form runat="server">
                                <asp:Button ID="Button1" class="btn btn-outline-primary px-4" runat="server" PostBackUrl="~/Customer/update profile.aspx" Text="Update Profile" />
                                <asp:Button ID="Button2" class="btn btn-primary px-4 ms-3" runat="server" PostBackUrl="~/Customer/change password.aspx" Text="Change Password" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--
    <div class="container my-5">
            <form class="row g-3" runat="server">
                <div class="form-floating col-md-6">
                    <asp:TextBox name="fname" class="form-control" placeholder="First Name" runat="server" ID="txtFname"></asp:TextBox>
                                                    <label for="floatingInput">First Name</label>
                </div>
                <div class="form-floating col-md-6">
                    <asp:TextBox name="lname" class="form-control" placeholder="Last Name" runat="server" ID="txtLname"></asp:TextBox>
                                                   <label for="floatingInput">Last Name</label>
                </div>
                <div class="input-group input-group-lg">
                    <span class="input-group-text" id="inputGroup-sizing-lg">+91</span>
                                                <asp:TextBox class="form-control" TextMode="Number" name="mobnum" placeholder="Mobile Number" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"  maxlength="10"  runat="server" ID="txtMobileNum"></asp:TextBox>
                </div>
                <div class="form-floating col-12">
                    <asp:TextBox class="form-control" name="address" placeholder="Address" runat="server" ID="txtAddress"></asp:TextBox>
                                            <label for="floatingInputAddress">Address</label>
                </div>
                <div class="form-floating col-12">
                    <asp:TextBox class="form-control" TextMode="Email" name="email" placeholder="name@example.com" runat="server" ID="txtEmail"></asp:TextBox>
                                                <label for="floatingInput">Email address</label>
                </div>
                                            <div class="form-floating col-md-6">
                                                <div class="form-floating">
                                                    <asp:TextBox class="form-control" name="city" placeholder="City" runat="server" ID="txtCity"></asp:TextBox>
                                                    <label for="floatingInputCity">City</label>
                                                </div>
                                            </div>
                                            <div class="form-floating col-md-6">
                                                <div class="form-floating">
                                                    <asp:TextBox class="form-control" TextMode="Number" name="pincode" placeholder="Pincode" runat="server" ID="txtPincode"></asp:TextBox>
                                                    <label for="floatingInputPincode">Pincode</label>
                                                </div>
                                            </div>

                <div class="form-floating col-md-6">
                        <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Customer/update profile.aspx">
                        <div class="d-grid gap-2">
                            <button class="btn btn-primary" type="button">Update Profile</button>
                        </div>
                        </i>
                    </asp:HyperLink>
                </div>
                <div class="form-floating col-md-6">
                    <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Customer/change password.aspx">
                        <div class="d-grid gap-2">
                            <button class="btn btn-primary" type="button">Change Password</button>
                        </div>
                        </i>
                    </asp:HyperLink>
                </div>
            </form>
        
    </div>--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>
