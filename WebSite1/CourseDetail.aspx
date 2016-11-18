<%@ Page Title="About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.vb" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top: 20px">
      <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-default">
          <div class="panel-heading"><h3 class="panel-title">Course Information</h3></div>
          <div class="panel-body">
            <div class="col-xs-3">
              <img src="assets/vince.jpg" alt="140x140" class="img-thumbnail">
            </div>
            <div class="col-xs-9">
              <h2 style="margin-top: 0;">  <asp:label ID="PlaceHolder" runat="server" ></asp:label> </h2>
              <h5>Topic: <asp:Label ID="TopicHolder" runat="server" ></asp:Label></h5>
              <h5>Instructor:<asp:Label ID="Instructor" runat="server" ></asp:Label></h5>
              <h5>Offered By:<asp:Label ID="Location" runat="server" ></asp:Label></h5>
              <h5>Course Status: <asp:Label ID="Status" runat="server" ></asp:Label></h5>
              <h5>Schedule: <asp:Label ID="Schedule" runat="server" ></asp:Label></h5>
              <hr>
              <p>Description: <asp:Label ID="Description" runat="server" ></asp:Label></p>
            </div>
          </div>
          <div class="panel-footer">
            <div class="text-right">
              <form class="form-inline">
                <h4>Course Price: <asp:Label ID="Price" runat="server" ></asp:Label></h4>
                <div class="form-group">
                  <div class="input-group">
                    <div class="input-group-addon">-</div>
                    <input style="width: 4em" type="text" class="form-control" id="exampleInputAmount" placeholder="Qty">
                    <div class="input-group-addon">+</div>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary">Add to Cart</button>
              </form>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <!-- Default panel contents -->
          <div class="panel-heading">Course Materials</div>
          <div class="panel-body">
            <p>...</p>
          </div>

          <!-- List group -->
          <ul class="list-group">
            
          </ul>
        </div>
      </div>
    </div>

</asp:Content>