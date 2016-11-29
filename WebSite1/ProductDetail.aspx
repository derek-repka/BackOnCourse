<%@ Page Title="Product" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.vb" Inherits="ProductDetail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top: 20px">
      <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-default">
          <div class="panel-heading"><h3 class="panel-title">Product Information</h3></div>
          <div class="panel-body">
            <div class="col-xs-3">
              <img src="assets/vince.jpg" alt="140x140" class="img-thumbnail">
            </div>

            <div class="col-xs-9">
              <h2 style="margin-top: 0;">  <asp:label ID="ProductName" runat="server" ></asp:label> </h2>
              <h5>Topic: <asp:Label ID="TopicHolder" runat="server" ></asp:Label></h5>
              <h5><asp:Label ID="StyleLabel" runat="server" Text="Style: "></asp:Label>
                  <asp:Label ID="Style" runat="server" ></asp:Label></h5>
              <h5>Offered By: <asp:Label ID="Firm" runat="server" ></asp:Label></h5>
              <h5>Currently Available: <asp:Label ID="Status" runat="server" ></asp:Label></h5>
              <h5>&nbsp;</h5>
              <hr>
              <p>Description: <asp:Label ID="Description" runat="server" ></asp:Label></p>
            </div>
              <!-- We did not use the category information because we combined it with the style table -->
              <asp:SqlDataSource ID="productSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformProduct.productName, platformFirm.firmName, platformTopic.topicCode, platformStyle.styleDescription, platformProduct.price, platformProduct.description, platformProduct.discontinued, platformProduct.unitsInStock FROM platformProduct INNER JOIN platformStyle ON platformProduct.styleID = platformStyle.styleID LEFT OUTER JOIN platformTopic ON platformProduct.topicID = platformTopic.topicID LEFT OUTER JOIN platformFirm ON platformProduct.firmID = platformFirm.firmID WHERE (platformProduct.productID = @productID)" InsertCommand="INSERT INTO platformOrderLine(orderID, productID, workshopID, quantity) VALUES (@orderID, @productID, @workshopID, @quantity)">
                  <InsertParameters>
                      <asp:Parameter Name="orderID" />
                      <asp:Parameter Name="productID" />
                      <asp:Parameter Name="workshopID" />
                      <asp:Parameter Name="quantity" />
                  </InsertParameters>
                  <SelectParameters>
                      <asp:Parameter DefaultValue="" Name="productID" />
                  </SelectParameters>
              </asp:SqlDataSource>
              <asp:SqlDataSource ID="userSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" InsertCommand="INSERT INTO platformOrder(orderDate, userID, orderStatusID) VALUES (@orderDate, @userID, @orderStatusId)" SelectCommand="SELECT orderID, orderDate, userID, orderStatusID FROM platformOrder WHERE (userID = @userID) AND (orderStatusID = 1)">
                  <InsertParameters>
                      <asp:Parameter Name="orderDate" />
                      <asp:Parameter Name="userID" />
                      <asp:Parameter Name="orderStatusId" />
                  </InsertParameters>
                  <SelectParameters>
                      <asp:SessionParameter Name="userID" SessionField="id" />
                  </SelectParameters>
              </asp:SqlDataSource>
          </div>
           <div class="panel-footer">
            <div class="text-right">
              <div class="form-inline">
                <h4>Course Price:<asp:Label ID="Price" runat="server" ></asp:Label></h4>
                <div class="form-group">
                </div>
                  <p>
                      <asp:Label ID="amtRemaining" runat="server" Text="Amount Remaining:"></asp:Label>
&nbsp;<asp:Label ID="qtyAvailable" runat="server"></asp:Label></p>
                  <asp:Button CssClass="btn btn-primary" ID="CartCourseButton" runat="server" Text="Add to cart" />
                  <br />
                  <br />
                  <asp:Label ID="NonMember" runat="server"></asp:Label>
              </div>
            </div>
          </div>
        </div>
      
      </div>
    </div>
</asp:Content>