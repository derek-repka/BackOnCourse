﻿<%@ Page Title="Product" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CourseDetail.aspx.vb" Inherits="CourseDetail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top: 55px">
      <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-default">
          <div class="panel-heading"><h3 class="panel-title">eCourse Information</h3></div>
          <div class="panel-body">
            <div class="col-xs-3">
              &nbsp;<img alt="" src="images/chalk_board.png" style="width: 128px; height: 128px" /></div>

            <div class="col-xs-9">
              <h2 style="margin-top: 0;">  <asp:label ID="CourseName" runat="server" ></asp:label> </h2>
              <h5><strong>Topic:</strong> <asp:Label ID="TopicHolder" runat="server" ></asp:Label></h5>
              <h5><asp:Label ID="InstructorLabel" runat="server" Text="Instructor: " style="font-weight: 700"></asp:Label>
                  <asp:Label ID="Instructor" runat="server" ></asp:Label></h5>
              <h5><strong>Offered By: </strong> <asp:Label ID="Firm" runat="server" ></asp:Label></h5>
              <h5><strong>Currently Available:</strong> <asp:Label ID="Status" runat="server" ></asp:Label></h5>
              <h5>&nbsp;</h5>
              <hr>
              <p><strong>Description:</strong> <asp:Label ID="Description" runat="server" ></asp:Label></p>
            </div>
              <!-- We did not use the category information because we combined it with the style table -->
              <asp:SqlDataSource ID="courseSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformProduct.productName, platformFirm.firmName, platformInstructor.lastName, platformInstructor.firstName, platformTopic.topicCode, platformProduct.price, platformProduct.description, platformProduct.discontinued FROM platformProduct LEFT OUTER JOIN platformTopic ON platformProduct.topicID = platformTopic.topicID LEFT OUTER JOIN platformFirm ON platformProduct.firmID = platformFirm.firmID AND platformProduct.firmID = platformFirm.firmID LEFT OUTER JOIN platformInstructor ON platformProduct.instructorID = platformInstructor.instructorID WHERE (platformProduct.productID = @eCourseID)" InsertCommand="INSERT INTO platformOrderLine(orderID, productID, workshopID, quantity) VALUES (@orderID, @productID, @workshopID, @quantity)">
                  <InsertParameters>
                      <asp:Parameter Name="orderID" />
                      <asp:Parameter Name="productID" />
                      <asp:Parameter Name="workshopID" />
                      <asp:Parameter Name="quantity" />
                  </InsertParameters>
                  <SelectParameters>
                      <asp:Parameter Name="eCourseID" />
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
                <h4>Course Price: $<asp:Label ID="Price" runat="server" ></asp:Label></h4>
                <div class="form-group">
              
                </div>
                  <asp:Button CssClass="btn btn-primary" ID="CartCourseButton" runat="server" Text="Add to cart" />
                  <br />
                  <asp:Label ID="NonMember" runat="server"></asp:Label>
              </div>
            </div>
          </div>
        </div>
      
      </div>
    </div>
</asp:Content>