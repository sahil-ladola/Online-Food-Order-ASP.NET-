<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Razorpay.aspx.cs" Inherits="FOODIVE.Customer.Razorpay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form action="RazorpayCallback.aspx" method="post">
        <script
            src="https://checkout.razorpay.com/v1/checkout.js"
            data-key="rzp_test_4fdfSU1OCN3pbQ"
            data-amount="<% Response.Write(Convert.ToInt32(Session["amount"]) * 100); %>"
    </form>
</body>
</html>
