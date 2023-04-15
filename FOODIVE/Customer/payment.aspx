<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="FOODIVE.Customer.payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FOODIVE | Checkout</title>
    <link rel="shortcut icon" href="../Image/Favicon/Favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: whitesmoke;">
        <div class="container">
            <a class="navbar-brand">
                <img src="../Image/LOGO/foodive-logos_black.png" alt="FOODIVE" height="40" width="40">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-lg-0">
                </ul>
            </div>
        </div>
    </nav>

    <body class="bg-light">

        <div class="container">
            <main>
                <div class="py-5 text-center">
                    <img class="d-block mx-auto mb-4" src="../Image/LOGO/foodive-logos_black.png" alt="" width="100" height="100">
                    <h2>Checkout Details</h2>
                </div>

                <div class="row g-5">
                    <div class="col-md-5 col-lg-4 order-md-last">

                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-primary">Your cart</span>
                            <span class="badge bg-primary rounded-pill">
                                <asp:Label ID="countcart" runat="server" Text="0"></asp:Label>
                            </span>
                        </h4>
                        <ul class="list-group mb-3">
                            <%
                                int item_total = 0;
                                for (int i = 0; i <= atc_id.Count - 1; i++)
                                {
                                    item_total += (Convert.ToInt32(price[i]) * Convert.ToInt32(quantity[i]));
                            %>
                            <li class="list-group-item d-flex justify-content-between lh-sm">
                                <div>
                                    <h6 class="my-0"><% Response.Write(dishname[i]); %></h6>
                                </div>
                                <span class="text-muted"><% Response.Write(Convert.ToInt32(price[i]) * Convert.ToInt32(quantity[i])); %></span>
                            </li>
                            <%
                                }
                            %>

                            <li class="list-group-item d-flex justify-content-between">
                                <span>Total (INR) : </span>
                                <strong>
                                    <% Response.Write(item_total);
                                        Session["amount"] = item_total;%>
                                </strong>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Billing address</h4>
                        <form class="needs-validation" method="POST" runat="server" novalidate="">
                            <div class="row g-3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFname" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="validationfirstname" runat="server" ControlToValidate="txtFname" ErrorMessage="Invalid First name" ValidationExpression="[a-zA-Z][a-zA-Z]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                <div class="col-sm-6">
                                    <label for="firstName" class="form-label">First name</label>
                                    <asp:TextBox name="fname" class="form-control" placeholder="First Name" runat="server" ID="txtFname"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLname" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="validationlastname" runat="server" ControlToValidate="txtLname" ErrorMessage="Invalid Last name" ValidationExpression="[a-zA-Z][a-zA-Z]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                <div class="col-sm-6">
                                    <label for="lastName" class="form-label">Last name</label>
                                    <asp:TextBox name="lname" class="form-control" placeholder="Last Name" runat="server" ID="txtLname"></asp:TextBox>
                                </div>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email address" ValidationExpression="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                <div class="col-sm-6">
                                    <label for="email" class="form-label">Email</label>
                                    <asp:TextBox class="form-control" TextMode="Email" name="email" placeholder="name@example.com" runat="server" ID="txtEmail"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtMobileNum" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMobileNum" ErrorMessage="Invalid Contact number" Display="Dynamic" ValidationExpression="[6789][0-9]{9}" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                <div class="col-sm-6">
                                    <label for="Mobnumber" class="form-label">Contact Number</label>
                                    <asp:TextBox class="form-control" name="mobnum" placeholder="Contact Number" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" MaxLength="10" runat="server" ID="txtMobileNum"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                <div class="col-4">
                                    <label for="address" class="form-label">Address</label>
                                    <asp:TextBox class="form-control" name="address" placeholder="Address" runat="server" ID="txtAddress"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCity" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="validationcity" runat="server" ControlToValidate="txtCity" ErrorMessage="Invalid City" ValidationExpression="[a-zA-Z][a-zA-Z]{2,}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                <div class="col-4">
                                    <label for="city" class="form-label">City</label>
                                    <asp:TextBox class="form-control" name="city" placeholder="City" runat="server" ID="txtCity"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPincode" ErrorMessage="All field must be filled" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="validationPincode" runat="server" ControlToValidate="txtPincode" ErrorMessage="Invalid Pincode" ValidationExpression="[0-9]{6}" Display="Dynamic" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:RegularExpressionValidator>
                                <div class="col-4">
                                    <label for="pincode" class="form-label">Pincode</label>
                                    <asp:TextBox class="form-control" name="pincode" placeholder="Pincode" runat="server" ID="txtPincode" MaxLength="6"></asp:TextBox>
                                </div>
                            </div>
                            <hr class="my-4">
                            <button class="w-100 mb-3 btn btn-primary btn-lg" name="checkout" id="Button1" type="submit">Continue to checkout</button>
                        </form>
                    </div>
                </div>
            </main>
        </div>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>
            <% int amount = Convert.ToInt32(Session["amount"]) * 100; %>
            var amount = "<% Response.Write(amount); %>";

            var options = {
                "key": "rzp_test_4fdfSU1OCN3pbQ",
                "amount": amount,
                "currency": "INR",
                "name": "FOODIVE",
                "description": "Online food order",
                
                "image": "",
                "handler": function (response) {
                    <% 
            Session["FN"] = txtFname.Text;
            Session["LN"] = txtLname.Text;
            Session["EM"] = txtEmail.Text;
            Session["MN"] = txtMobileNum.Text;
            Session["ADD"] = txtAddress.Text;
            Session["DATE"] = DateTime.Now.ToString("yyyy-MM-dd");


            %>
                    window.location.href = "<% Response.Write("checkout.aspx"); %>";
                },

                "theme": {
                    "color": "#3399cc"  
                }
            };

            var rzp1 = new Razorpay(options);

            rzp1.on('payment.failed', function (response) {
                alert("Payment failed. Please try again later.");
            });

            document.getElementById('Button1').onclick = function (e) {
                rzp1.open();
                e.preventDefault();
            };
        </script>

        <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

        <script src="form-validation.js"></script>


    </body>
</html>
