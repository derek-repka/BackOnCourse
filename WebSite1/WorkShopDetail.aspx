<%@ Page Title="Product" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="WorkShopDetail.aspx.vb" Inherits="WorkShopDetail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top: 55px">
      <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-default">
          <div class="panel-heading"><h3 class="panel-title">Workshop Information</h3></div>
          <div class="panel-body">
            <div class="col-xs-3">
              &nbsp;<img alt="" class="modal-sm" src="images/Workshop.png" style="height: 100px; width: 140px" /></div>

            <div class="col-xs-9">
              <h2 style="margin-top: 0;">  <asp:label ID="PlaceHolder" runat="server" ></asp:label> </h2>
              <h5><strong>Topic: </strong> <asp:Label ID="Topic" runat="server" ></asp:Label></h5>
              <h5><strong>Instructor:</strong> <asp:Label ID="Instructor" runat="server" ></asp:Label></h5>
              <h5><strong>Offered by:</strong> <asp:Label ID="Firm" runat="server" ></asp:Label></h5>
              <h5><strong>Location:</strong> <asp:Label ID="Location" runat="server" ></asp:Label></h5>
              <h5><strong>City:</strong> <asp:Label ID="City" runat="server" ></asp:Label></h5>
              <h5><strong>Schedule:</strong> <asp:Label ID="Schedule" runat="server" ></asp:Label></h5>
              <hr>
              <p><strong>Description:</strong> <asp:Label ID="Description" runat="server" ></asp:Label></p>
            </div>
              <!-- We did not use the category information because we combined it with the style table -->
              
              <asp:SqlDataSource ID="workshopSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformWorkshop.workshopID, platformWorkshop.city, platformWorkshop.location, platformWorkshop.dateTime, platformWorkshop.price, platformTopic.topicCode, platformInstructor.lastName, platformInstructor.firstName, platformFirm.firmName FROM platformWorkshop INNER JOIN platformInstructor ON platformWorkshop.instructorID = platformInstructor.instructorID INNER JOIN platformTopic ON platformWorkshop.topicID = platformTopic.topicID INNER JOIN platformFirm ON platformWorkshop.firmID = platformFirm.firmID WHERE (platformWorkshop.workshopID = @workshopID)" InsertCommand="INSERT INTO platformOrderLine(orderID, productID, workshopID, quantity) VALUES (@orderID, @productID, @workshopID, @quantity)">
                  <InsertParameters>
                      <asp:Parameter Name="orderID" />
                      <asp:Parameter Name="productID" />
                      <asp:Parameter Name="workshopID" />
                      <asp:Parameter Name="quantity" />
                  </InsertParameters>
                  <SelectParameters>
                      <asp:QueryStringParameter DefaultValue="2" Name="workshopID" QueryStringField="workshopID" />
                  </SelectParameters>
              </asp:SqlDataSource>
              
              <asp:SqlDataSource ID="userSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" EnableCaching="True" InsertCommand="INSERT INTO platformOrder(orderDate, userID, orderStatusID) VALUES (@orderDate, @userID, @orderStatusID)" SelectCommand="SELECT orderID, orderDate, userID, orderStatusID FROM platformOrder WHERE (userID = @userID) AND (orderStatusID = 1)">
                  <InsertParameters>
                      <asp:Parameter Name="orderDate" />
                      <asp:Parameter Name="userID" />
                      <asp:Parameter Name="orderStatusID" />
                  </InsertParameters>
                  <SelectParameters>
                      <asp:SessionParameter Name="userID" SessionField="id" />
                  </SelectParameters>
              </asp:SqlDataSource>
              
          </div>
           <div class="panel-footer">
            <div class="text-right">
              <div class="form-inline">
                <h4>Course Price: $<asp:Label ID="Price" runat="server" ></asp:Label></h4>
                <div class="form-group" id="WorkShopCartButton">
                    <asp:Button CssClass="btn btn-primary" ID="workshopCartButton" runat="server" Text="Add to Cart" />
                    <br />
                    <asp:Label ID="Nonmember" runat="server"></asp:Label>
                </div>
              </div>
            </div>
          </div>
        </div>
      
      </div>
    </div>
</asp:Content>