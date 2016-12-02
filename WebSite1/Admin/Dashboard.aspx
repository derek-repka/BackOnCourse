<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class = "active"><a href="Dashboard.aspx">Dashboard <span class="sr-only">(current)</span></a></li>
            <li><a href="ManageProduct.aspx">Manage Products</a></li>
            <li><a href="ManageWorkshop.aspx">Manage Workshops</a></li>
            <li><a href="ManageCourse.aspx">Manage eCourses</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="Settings.aspx">Settings</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="left: 0px; top: 0px">
          <div class="col-md-5">
                <div class="panel panel-primary">
                    <div class="panel-heading">Legislation Updates </div>
                      <strong>October 1st, 2016</strong><br />
                    <br />
                    <strong>The Reporting of Injuries, Diseases and Dangerous Occurrences Regulations 2016 (RIDDOR 2013) replaced RIDDOR 1995<br />
                    The main changes made by these Regulations are:</strong><br />
&nbsp; • A simplified and shortened list of specified reportable injuries (“major injuries”) to workers sustained as a result of a work-related accident.
                    <br />
&nbsp; • A clarified and shortened list of reportable dangerous occurrences (near-miss events).
                    <br />
&nbsp; • A simplified and significantly shortened list of reportable ill-health conditions inworkers<br />
                    <br />
                    <strong>No changes are being made to:</strong><br />
&nbsp;• Recording requirements<br />
&nbsp;• Reports of fatal accidents<br />
&nbsp;• Reports of accidents involving non-workers including members of the public<br />
&nbsp;• Reports of accidents which incapacitate workers for more than seven days<br />
        </div>
      </div>
    </div>
</asp:Content>