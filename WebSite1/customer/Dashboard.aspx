<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="customer_Dashboard2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="Dashboard.aspx">Dashboard <span class="sr-only">(current)</span></a></li>
            <li><a href="Courses.aspx">Courses</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="Settings.aspx">Settings</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="col-md-5">
                <div class="panel panel-primary">
                    <div class="panel-heading">News & Announcements</div>
                    <ul class="list-group">
                        <li class="list-group-item">New course is avaliable</li>
                        <li class="list-group-item">New course is avaliable</li>
                        <li class="list-group-item">New course is avaliable</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-5">
                <div class="panel panel-primary">
                    <div class="panel-heading">Your Courses</div>
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
      </div>
    </div>
</asp:Content>