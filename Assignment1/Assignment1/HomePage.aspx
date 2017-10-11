<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Assignment1.HomePage" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="page-header text-primary">
                <h3>
                    <asp:Label ID="Label1" runat="server" Text="Assignment No.: 1"></asp:Label>
                </h3>
                <br />
                <h3>
                    <asp:Label ID="Label2" runat="server" Text="Name: Simon McNeil"></asp:Label>
                </h3>
                <br />
                <h3>
                    <asp:Label ID="Label3" runat="server" Text="Section: PROG 30000 - P01 27575 / 1"></asp:Label>
                </h3>
                <br />
                <h3>
                    <asp:Label ID="Label4" runat="server" Text="Student ID: 991426860"></asp:Label>
                </h3>
                <br />
                <h3>
                    <asp:Label ID="Label5" runat="server" Text="Professor: Syed Tanbeer"></asp:Label>
                 </h3>
                <p>
                    &nbsp;</p>
                <p>
                    <asp:LinkButton class="btn btn-primary btn-lg" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Go To Book Store Database</asp:LinkButton>
                 </p>
            </div>
        </div>
    </form>
</body>
</html>
