<%@ Page Title="About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.vb" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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
              <img alt="" src="images/AboutUs/AboutUs_Client3.JPG" style="width: 232px; height: 59px" /></p>
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

</asp:Content>
