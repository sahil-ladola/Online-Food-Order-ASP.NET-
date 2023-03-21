<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FOODIVE.Restaurant.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FOODIVE | Restaurant Registration</title>
    <link rel="shortcut icon" href="../Image/Favicon/Favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="Registration/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="Registration/vendor/nouislider/nouislider.min.css">
    <link rel="stylesheet" href="Registration/css/style.css">
</head>
<body>
    <div class="main">
        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                    <img src="../Image/Img/restro_mng.jpg" alt="" style="height: 100%">
                    <%--<div class="signup-img-content">
                        <h2>Register now </h2>
                        <p>while seats are available !</p>
                    </div>--%>
                </div>
                <div class="signup-form">
                    <form method="POST" class="register-form" id="register-form">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-select">
                                    <div class="label-flex">
                                        <h3>RESTAURANT MANAGER DETAILS</h3>
                                        <%--<a href="#" class="form-link">Lunch detail</a>--%>
                                    </div>
                                    <div class="form-input">
                                        <label for="name">Full Name</label>
                                        <input type="text" name="name" id="name" />
                                    </div>
                                </div>
                                <div class="form-input">
                                    <label for="phone_number">Phone number</label>
                                    <input type="text" name="phone_number" id="phone_number" />
                                </div>
                                <div class="form-input">
                                    <label for="email">Email</label>
                                    <input type="email" name="email" id="email" />
                                </div>
                                <div class="form-input">
                                    <label for="password">Password</label>
                                    <input type="password" name="password" id="password" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-select">
                                    <div class="label-flex">
                                        <h3>ID PROOF</h3>
                                        <%--<a href="#" class="form-link">Lunch detail</a>--%>
                                    </div>
                                    <div class="form-input">
                                        <label for="Aadhaar">Aadhaar card photo</label>
                                        <input type="file" name="Aadhaar" id="Aadhaar" />
                                    </div>
                                    <%--<div class="select-list">
                                        <select name="meal_preference" id="meal_preference">
                                            <option value="Vegetarian">Vegetarian</option>
                                            <option value="Kosher">Kosher</option>
                                            <option value="Asian Vegetarian">Asian Vegetarian</option>
                                        </select>
                                    </div>--%>
                                </div>
                                <div class="form-select">
                                    <div class="label-flex">
                                        <h3 for="payment">RESIDENTIAL INFORMATION</h3>
                                        <%--<a href="#" class="form-link">Payment Detail</a>--%>
                                    </div>
                                    <div class="form-input">
                                        <label for="address">Address</label>
                                        <input type="text" name="address" id="address" />
                                    </div>
                                </div>
                                <div class="form-input">
                                    <label for="city">City</label>
                                    <input type="text" name="city" id="city" />
                                </div>
                                <div class="form-input">
                                    <label for="pincode">Pincode</label>
                                    <input type="text" name="pincode" id="pincode" />
                                </div>
                            </div>
                        </div>
                        <%--<div class="donate-us">
                            <label>Donate us</label>
                            <div class="price_slider ui-slider ui-slider-horizontal">
                                <div id="slider-margin"></div>
                                <span class="donate-value" id="value-lower"></span>
                            </div>
                        </div>--%>
                        <div class="form-submit">
                            <input type="submit" value="Next" class="submit" id="submit" name="submit" />
                            <input type="reset" value="Reset" class="submit" id="reset" name="reset" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="Registration/vendor/jquery/jquery.min.js"></script>
    <script src="Registration/vendor/nouislider/nouislider.min.js"></script>
    <script src="Registration/vendor/wnumb/wNumb.js"></script>
    <script src="Registration/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="Registration/vendor/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="Registration/js/main.js"></script>
</body>
</html>
