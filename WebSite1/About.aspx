<%@ Page Title="About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.vb" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Back on Course</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
      <div class="col-md-1"><!--margin to the left--></div>
      <div class="col-md-6">
        <h2>About Us</h2>
    <hr>
        <p>
            <strong>Our story</strong></p>
          <p>
              We have been providing occupational health and safety training and consulting services for various industries at affordable prices since 1980. Our customers tell us that we have consistently exceeded their expectations in the development of their workplace health &amp; safety training programs as well as onsite and offsite health &amp; safety training.</p>

          <p>
              <strong>Our Value</strong></p>
          <p>
              You and your company&#39;s safety are our first priority.</p>
          <p>
              <asp:Image ID="Value1" runat="server" Height="210px" ImageUrl="~/images/AboutUs/AboutUs_Value1.png" Width="210px" />
              <asp:Image ID="Value2" runat="server" Height="210px" ImageUrl="~/images/AboutUs/AboutUs_Value2.jpg" Width="300px" />
        </p>
          <p>
              <strong>Our Clients</strong></p>
          <p>
              Our company provides an overview of emergency management including the systems and processes for preventing, mitigating, preparing for, responding to and recovering from emergencies and disasters. You will learn about the key provisions of the Emergency Management Act and have the opportunity to identify the roles and responsibilities of various levels of government and other key organizations involved in emergency management.</p>
          <p>
              <asp:Image ID="Client1" runat="server" EnableTheming="True" GenerateEmptyAlternateText="True" Height="100px" ImageUrl="~/images/AboutUs/AboutUs_Client1.jpg" Width="175px" />
&nbsp;&nbsp;&nbsp;
              <asp:Image ID="Client2" runat="server" Height="100px" ImageUrl="~/images/AboutUs/AboutUs_Client2.png" Width="175px" />
        </p>
          <p>
              <strong>Our People</strong></p>
          <p>
         &nbsp;
              <asp:Image ID="ProfilePic" runat="server" Height="100px" ImageUrl="~/images/AboutUs/AboutUs_Profile.png" Width="100px" />
&nbsp;&nbsp;&nbsp; Your Boss</p>
          <p>
              &nbsp;</p>
          <p>
              &nbsp;</p>
          <p>
              &nbsp;</p>
    <hr>
      </div>
      
      <div class="col-md-1"><!--margin to the right--></div>
    </div>
    <footer class="footer">
      <div class="container">
        <ul style="list-style-type: none;">
          <li style="display: inline; margin: 10px"><a href="About.aspx">About Us</a></li>
          <li style="display: inline; margin: 10px"><a href="#">Contact Information</a></li>
          <li style="display: inline; margin: 10px"><a href="PressPage.aspx">Press</a></li>
          <li style="display: inline; margin: 10px"><a href="#">Privacy</a></li>
        </ul>
      </div>
    </footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </body>
</html>

</asp:Content>
