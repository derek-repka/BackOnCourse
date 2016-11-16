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
                <!-- button group end -->
              </div>
            </li>
            <li class="list-group-item">Dapibus ac facilisis in
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
                <!-- button group end -->
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="container" style="margin-top: 20px">
      <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-default">
          <!-- Default panel contents -->
          <div class="panel-heading">Your Total</div>
            <ul class="list-group">
                <li class="list-group-item">Your subtotal:</li>
                <li class="list-group-item">Your Total:</li>
                </ul>
          </div>
          <div class="text-right"> 
             <button type="submit" class="btn btn-primary">Checkout</button>
          </div>
       </div>
     </div>
</asp:Content>

