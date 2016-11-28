<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.vb" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Back on Course</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="jumbotron">
        <h2 style="font-family: Arial, Helvetica, sans-serif">Contact us:</h2>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <p>
                    <head>
                        <style type="text/css">
                            .auto-style4 {
                                width: 699px;
                                height: 63px;
                            }

                            .auto-style5 {
                                width: 697px;
                                height: 31px;
                            }

                            .auto-style3 {
                                width: 694px;
                                height: 315px;
                            }

                            .auto-style6 {
                                width: 155px;
                            }

                            .auto-style2 {
                                width: 218px;
                            }

                            .auto-style1 {
                                width: 603px;
                                height: 167px;
                            }
                        </style>
                    </head>


                    <!DOCTYPE html>

                    <style type="text/css">
                        .auto-style1 {
                            width: 603px;
                            height: 167px;
                        }

                        .auto-style2 {
                            width: 218px;
                        }

                        .auto-style3 {
                            width: 694px;
                            height: 315px;
                        }

                        .auto-style4 {
                            width: 699px;
                            height: 63px;
                        }

                        .auto-style5 {
                            width: 697px;
                            height: 31px;
                        }

                        .auto-style6 {
                            width: 155px;
                        }
                    </style>

                <p class="auto-style4" style="font-family: Arial, Helvetica, sans-serif">
                    Problems? Concerns? We are here to answer &quot;any&quot; questions you may have about ____. &quot;Any &quot; incldues techincal, customer support or even if you just wanted to just have a chat! Free feel to reach out to us and we will respond as soon as possible!
                </p>
                <p class="auto-style5" style="font-family: arial, Helvetica, sans-serif">
                    If we can&#39;t answer your question, we will do our best to find an answer for you!
                </p>
                <form action="mailto:someone@example.com" class="auto-style3" enctype="text/plain" method="post" style="font-family: Arial, Helvetica, sans-serif">
                    Name:<br />
                    <input class="auto-style6" name="name" type="text" /><br />
                    E-mail:<br />
                    <input class="auto-style2" name="mail" type="text" /><br />
                    Comment:<br />
                    <input class="auto-style1" name="comment" size="400" type="text" /><br />
                    <br />
                    <input class="btn btn-primary" type="submit" value="Send"/>
                    <input class="btn btn-primary" type="reset" value="Reset"/>
                </form></p>
            </div>
            <div class="col-md-4">
                <aside id="contact-info">
                    <dl>
                        <dt>Email</dt>
                        <dd><a href="mailto:example@gmail.com" title="Click to send us an email">example@gmail.com</a></dd>
                        <dt>Telephone</dt>
                        <dd>(780)123-4567</dd>
                        <dt>Address</dt>
                        <dd>
                            <address>
                                Back on Course<br />
                                116st & 85 Ave<br />
                                Edmonton, Alberta<br />
                                Canada<br />
                                T6G 2R3<br /><br />

                            </address>
                        </dd>


                </aside>
            </div>
        </div>
</body>
</html>
</asp:Content>
