<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update profile.aspx.cs" Inherits="FOODIVE.Customer.update_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FOODIVE | Update Profile</title>
    <link rel="shortcut icon" href="/Project_demo/Image/Favicon/Favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
    <div class="container">
        <header class="p-3 border-bottom">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="/Project_demo/Customer/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                    <img class="bi me-2" width="40" height="40" role="img" src="/Project_demo/Image/LOGO/foodive-logos_black.png" alt="FOODIVE">
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link text-decoration-none text-muted" href="/Project_demo/Customer/afterlogin.php">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-decoration-none text-muted" href="/Project_demo/Customer/Order.php">My Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-decoration-none text-muted" href="/Project_demo/Customer/Logout.php">Logout</a>
                    </li>
                </ul>
                <div class="text-end">

                    <div class="dropdown text-end">
                        <a href="/Project_demo/Customer/AddToCart.php" class="text-decoration-none mx-2">
                            <img src="/Project_demo/Image/Icon/Cart.png" alt="cart" height="20" width="20">
                        </a>
                    </div>
                </div>
            </div>

        </header>
    </div>
    <%--<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">Edogaru</span><span class="text-black-50">edogaru@mail.com.my</span><span> </span></div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Name</label><input type="text" class="form-control" placeholder="first name" value=""></div>
                    <div class="col-md-6"><label class="labels">Surname</label><input type="text" class="form-control" value="" placeholder="surname"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" class="form-control" placeholder="enter phone number" value=""></div>
                    <div class="col-md-12"><label class="labels">Address Line 1</label><input type="text" class="form-control" placeholder="enter address line 1" value=""></div>
                    <div class="col-md-12"><label class="labels">Address Line 2</label><input type="text" class="form-control" placeholder="enter address line 2" value=""></div>
                    <div class="col-md-12"><label class="labels">Postcode</label><input type="text" class="form-control" placeholder="enter address line 2" value=""></div>
                    <div class="col-md-12"><label class="labels">State</label><input type="text" class="form-control" placeholder="enter address line 2" value=""></div>
                    <div class="col-md-12"><label class="labels">Area</label><input type="text" class="form-control" placeholder="enter address line 2" value=""></div>
                    <div class="col-md-12"><label class="labels">Email ID</label><input type="text" class="form-control" placeholder="enter email id" value=""></div>
                    <div class="col-md-12"><label class="labels">Education</label><input type="text" class="form-control" placeholder="education" value=""></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6"><label class="labels">Country</label><input type="text" class="form-control" placeholder="country" value=""></div>
                    <div class="col-md-6"><label class="labels">State/Region</label><input type="text" class="form-control" value="" placeholder="state"></div>
                </div>
                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">Save Profile</button></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center experience"><span>Edit Experience</span><span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;Experience</span></div><br>
                <div class="col-md-12"><label class="labels">Experience in Designing</label><input type="text" class="form-control" placeholder="experience" value=""></div> <br>
                <div class="col-md-12"><label class="labels">Additional Details</label><input type="text" class="form-control" placeholder="additional details" value=""></div>
            </div>
        </div>
    </div>
</div>--%>
<%--</div>
</div>--%>
    <div class="container my-5">
        <form class="row g-3 " method="post">
            <div class="form-floating col-md-6">
                <input type="text" class="form-control" id="floatingInput" placeholder="First Name" name="fname" value="<?php echo $row['Fname'] ?>">
                <label for="floatingInput">First Name</label>
            </div>
            <div class="form-floating col-md-6">
                <input type="text" class="form-control" id="floatingInput" placeholder="Last Name" name="lname" value="<?php echo $row['Lname'] ?>">
                <label for="floatingInput">Last Name</label>
            </div>
            <div class="input-group input-group-lg">
                <span class="input-group-text" id="inputGroup-sizing-lg">+91</span>
                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" placeholder="Mobile Number" maxlength="10" name="mobnum" value="<?php echo $row['Mobile_num'] ?>">
            </div>
            <div class="form-floating col-12">
                <input type="text" class="form-control" id="floatingInputAddress" placeholder="Address" name="address" value="<?php echo $row['Address'] ?>">
                <label for="floatingInputAddress">Address</label>
            </div>
            <div class="form-floating col-12">
                <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email" value="<?php echo $row['Email'] ?>">
                <label for="floatingInput">Email address</label>
            </div>
            <div class="d-grid gap-2">
                <input type="submit" class="btn btn-primary" name="Update" value="Update">
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>
