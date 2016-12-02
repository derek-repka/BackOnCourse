
Partial Class _Default
    Inherits Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub signUpButton_Click(sender As Object, e As EventArgs) Handles signUpButton.Click
        Dim company As String = txtRegCompany.Value
        Dim email As String = txtRegEmail.Value
        Dim password As String = txtRegPassword.Value
        Dim lastName As String = txtRegLastName.Value
        Dim firstName As String = txtRegFirstName.Value
        registrationDataSource.InsertParameters("companyName").DefaultValue = company
        registrationDataSource.InsertParameters("email").DefaultValue = email
        registrationDataSource.InsertParameters("password").DefaultValue = TryCast(Me.Master, SiteMaster).Hash(password)
        registrationDataSource.InsertParameters("lastName").DefaultValue = lastName
        registrationDataSource.InsertParameters("firstName").DefaultValue = firstName
        If registrationDataSource.Insert() > 0 Then
            Response.Redirect("Account/Register.aspx")
        End If
    End Sub
End Class