Imports System.Collections.Generic
Imports System.Security.Claims
Imports System.Security.Principal
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography

Partial Public Class SiteMaster
    Inherits MasterPage
    Private Const AntiXsrfTokenKey As String = "__AntiXsrfToken"
    Private Const AntiXsrfUserNameKey As String = "__AntiXsrfUserName"
    Private _antiXsrfTokenValue As String

    Protected Sub Page_Init(sender As Object, e As EventArgs)
        ' The code below helps to protect against XSRF attacks
        Dim requestCookie = Request.Cookies(AntiXsrfTokenKey)
        Dim requestCookieGuidValue As Guid
        If requestCookie IsNot Nothing AndAlso Guid.TryParse(requestCookie.Value, requestCookieGuidValue) Then
            ' Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value
            Page.ViewStateUserKey = _antiXsrfTokenValue
        Else
            ' Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N")
            Page.ViewStateUserKey = _antiXsrfTokenValue

            Dim responseCookie = New HttpCookie(AntiXsrfTokenKey) With {
                .HttpOnly = True,
                .Value = _antiXsrfTokenValue
            }
            If FormsAuthentication.RequireSSL AndAlso Request.IsSecureConnection Then
                responseCookie.Secure = True
            End If
            Response.Cookies.[Set](responseCookie)
        End If

        AddHandler Page.PreLoad, AddressOf master_Page_PreLoad
    End Sub

    Protected Sub master_Page_PreLoad(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            ' Set Anti-XSRF token
            ViewState(AntiXsrfTokenKey) = Page.ViewStateUserKey
            ViewState(AntiXsrfUserNameKey) = If(Context.User.Identity.Name, [String].Empty)
        Else
            ' Validate the Anti-XSRF token
            If DirectCast(ViewState(AntiXsrfTokenKey), String) <> _antiXsrfTokenValue OrElse DirectCast(ViewState(AntiXsrfUserNameKey), String) <> (If(Context.User.Identity.Name, [String].Empty)) Then
                Throw New InvalidOperationException("Validation of Anti-XSRF token failed.")
            End If
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub

    Protected Sub Unnamed_LoggingOut(sender As Object, e As LoginCancelEventArgs)
        Context.GetOwinContext().Authentication.SignOut()
    End Sub

    Protected Sub Validate_User(sender As Object, e As EventArgs)
        Dim email As String = txtEmail.Value
        Dim password As String = txtPassword.Value
        If Not email.Equals("") And Not password.Equals("") Then
            loginDataSource.SelectParameters("email").DefaultValue = email
            loginDataSource.SelectParameters("password").DefaultValue = Hash(password)

            Dim dv As DataView = CType(loginDataSource.Select(DataSourceSelectArguments.Empty), DataView)
            If dv.Count > 0 Then
                Session("id") = dv(0)(0)
                Session("firstName") = dv(0)(4).trim()
                Session("lastName") = dv(0)(5).trim()
                Session("email") = dv(0)(3).trim()
                Session("type") = dv(0)(6).trim()
                Session("firmID") = dv(0)(7)
                If Session("type") Like "customer" Then
                    Response.Redirect("customer/Dashboard.aspx")
                ElseIf Session("type") Like "admin" Then
                    Response.Redirect("Admin/Dashboard.aspx")
                ElseIf Session("type") Like "contentmanager" Then
                    Response.Redirect("ContentManager/Dashboard.aspx")
                End If
            End If
        End If
    End Sub

    Protected Sub Logout(sender As Object, e As EventArgs)
        Session.Abandon()
        Response.Redirect("/Default.aspx")
    End Sub

    Public Function Hash(password As String) As String
        Dim salt As String = "MIS418"
        Dim convertedToBytes As Byte() = Encoding.UTF8.GetBytes(password & salt)
        Dim hashType As HashAlgorithm = New SHA512Managed()
        Dim hashBytes As Byte() = hashType.ComputeHash(convertedToBytes)
        Dim hashedResult As String = Convert.ToBase64String(hashBytes)
        Return hashedResult
    End Function
End Class
