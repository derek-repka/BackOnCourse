
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
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
          <div class="panel-heading">Panel heading</div>
          <div class="panel-body">
            <p>...</p>
          </div>

          <!-- List group -->
          <ul class="list-group">
            <li class="list-group-item">Cras justo odio</li>
            <li class="list-group-item">Dapibus ac facilisis in</li>
            <li class="list-group-item">Morbi leo risus</li>
            <li class="list-group-item">Porta ac consectetur ac</li>
            <li class="list-group-item">Vestibulum at eros</li>
          </ul>
        </div>
      </div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>
  </body>
</html>