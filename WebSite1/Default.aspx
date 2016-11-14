<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container">
      <div class="col-md-1"><!--margin to the left--></div>
      <div class="col-md-6">
        <h2>Welcome to Back on Course</h2>
        <p>
          Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
        </p>
      </div>
      
      <div class="col-md-4">
        <h1>Sign Up</h1>
        <div class="form-group row">
          <div class="col-xs-5">
            <input type="text" class="form-control" id="inputKey" placeholder="First Name">
          </div>
          <div class="col-xs-5">
            <input type="text" class="form-control" id="inputKey" placeholder="Last Name">
          </div>
        </div>
        <div class="form-horizontal">
          <div class="col-xs-12">
            <div class="form-group"> 
              <input type="text" class="form-control" id="inputKey" placeholder="Company">
            </div>
            <div class="form-group">
                <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="inputPassword3" placeholder="New Password">
            </div>
          </div>
          <h5><small>By clicking Sign Up, you agree to our Terms and that you have read our Data Policy, including our Cookie Use.</small></h5>
          <div class="form-group row">
            <div class="col-xs-6">
              <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-1"><!--margin to the right--></div>
    </div>
    <footer class="footer">
      <div class="container">
        <ul style="list-style-type: none;">
          <li style="display: inline; margin: 10px"><a href="#">About Us</a></li>
          <li style="display: inline; margin: 10px"><a href="#">Contact Information</a></li>
          <li style="display: inline; margin: 10px"><a href="#">Press</a></li>
          <li style="display: inline; margin: 10px"><a href="#">Privacy</a></li>
        </ul>
      </div>
    </footer>
</asp:Content>
