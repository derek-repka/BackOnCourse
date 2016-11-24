<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="CartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container" style="margin-top: 20px">
      <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-default">
          <!-- Default panel contents -->
          <div class="panel-heading">Your Shopping Cart</div>
          <!-- List group -->
          <ul class="list-group">
            <li class="list-group-item">Cras justo odio
              <!-- button group start -->
              <div class="text-right form-inline">
                <div class="form-group">
                  <div class="input-group">
                    <div class="input-group-addon">-</div>
                    <input style="width: 4em" type="text" class="form-control" id="exampleInputAmount" placeholder="Qty">
                    <div class="input-group-addon">+</div>
                  </div>
                </div>
                <button type="submit" class="btn btn-danger">Delete</button>
              </div>
             <!-- button group end -->
            </li>
            <li class="list-group-item">Dapibus ac facilisis in
              <!-- button group start -->
                <asp:SqlDataSource ID="cartDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT platformOrderLine.quantity, platformProduct.productName, platformWorkshop.city AS workshopCity, platformWorkshop.location AS worshopLocation, platformWorkshop.dateTime AS workshopDateTime, platformWorkshop.price AS workshopPrice, platformProduct.price AS productPrice, platformStyle.styleDescription, platformTopic.topicCode FROM platformUser INNER JOIN platformOrder ON platformUser.userID = platformOrder.userID INNER JOIN platformOrderLine ON platformOrder.orderID = platformOrderLine.orderID INNER JOIN platformProduct ON platformOrderLine.productID = platformProduct.productID INNER JOIN platformTopic ON platformProduct.topicID = platformTopic.topicID LEFT OUTER JOIN platformWorkshop ON platformTopic.topicID = platformWorkshop.topicID AND platformOrderLine.workshopID = platformWorkshop.workshopID LEFT OUTER JOIN platformStyle ON platformProduct.styleID = platformStyle.styleID WHERE (platformOrder.orderStatusID = 1) AND (platformUser.userID = @userID)">
                    <SelectParameters>
                        <asp:Parameter Name="userID" />
                    </SelectParameters>
                </asp:SqlDataSource>
              <div class="text-right form-inline">
                <div class="form-group">
                  <div class="input-group">
                    <div class="input-group-addon">-</div>
                    <input style="width: 4em" type="text" class="form-control" id="exampleInputAmount" placeholder="Qty">
                    <div class="input-group-addon">+</div>
                  </div>
                </div>
                <button type="submit" class="btn btn-danger">Delete</button>
               </div>
                <!-- button group end -->
            </li>
            <li class="list-group-item">Morbi leo risus
              <!-- button group start -->
              <div class="text-right form-inline">
                <div class="form-group">
                  <div class="input-group">
                    <div class="input-group-addon">-</div>
                    <input style="width: 4em" type="text" class="form-control" id="exampleInputAmount" placeholder="Qty">
                    <div class="input-group-addon">+</div>
                  </div>
                </div>
                <button type="submit" class="btn btn-danger">Delete</button>
                <!-- button group end -->
            </li>
            <li class="list-group-item">Porta ac consectetur ac
              <!-- button group start -->
              <div class="text-right form-inline">
                <div class="form-group">
                  <div class="input-group">
                    <div class="input-group-addon">-</div>
                    <input style="width: 4em" type="text" class="form-control" id="exampleInputAmount" placeholder="Qty">
                    <div class="input-group-addon">+</div>
                  </div>
                </div>
                <button type="submit" class="btn btn-danger">Delete</button>
               </div>
               <!-- button group end -->
            </li>
            <li class="list-group-item">Vestibulum at eros
              <!-- button group start -->
              <div class="text-right form-inline">
                <div class="form-group">
                  <div class="input-group">
                    <div class="input-group-addon">-</div>
                    <input style="width: 4em" type="text" class="form-control" id="exampleInputAmount" placeholder="Qty">
                    <div class="input-group-addon">+</div>
                  </div>
                </div>
                <button type="submit" class="btn btn-danger">Delete</button>
               </div>
               <!-- button group end -->
            </li>
          </ul>
           <div class="panel-footer">
            <div class="text-right">
              <!--<form class="form-inline">-->
                <h4>Course Price: $CDN 1,600</h4>
                <button type="submit" class="btn btn-primary">Checkout</button>
              <!--</form>-->
            </div>
          </div>
        </div>
      </div>
    </div>
</asp:Content>

