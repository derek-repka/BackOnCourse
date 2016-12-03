
Imports System.Data

Partial Class _Default
    Inherits Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub signUpButton_Click(sender As Object, e As EventArgs) Handles signUpButton.Click
        Dim company As String = txtRegCompany.Value
        Dim email As String = txtRegEmail.Value
        Dim password As String = txtRegPassword.Value
        Dim reEnteredPassword As String = txtRegReEnterPassword.Value
        Dim lastName As String = txtRegLastName.Value
        Dim firstName As String = txtRegFirstName.Value

        Dim dict As New Dictionary(Of String, String)
        dict.Add("Company", company)
        dict.Add("Email", email)
        dict.Add("Password", password)
        dict.Add("ReEnteredPassword", reEnteredPassword)
        dict.Add("Last Name", lastName)
        dict.Add("First Name", firstName)

        registrationDataSource.SelectParameters("email").DefaultValue = email
        Dim dv As DataView = CType(registrationDataSource.Select(DataSourceSelectArguments.Empty), DataView)

        If dv.Count() Then
            duplicateEmailWarningLabel.Visible = True
            Return
        End If

        For Each kv As KeyValuePair(Of String, String) In dict
            If Len(kv.Value) = 0 Then
                signUpWarningLabel.Visible = True
                Return
            End If
        Next

        If password <> reEnteredPassword Then
            signUpWarningLabel.Visible = True
            Return
        End If

        If Len(password) < 6 Then
            signUpWarningLabel.Visible = True
            Return
        End If

        registrationDataSource.InsertParameters("companyName").DefaultValue = company
        registrationDataSource.InsertParameters("email").DefaultValue = email
        registrationDataSource.InsertParameters("password").DefaultValue = TryCast(Me.Master, SiteMaster).Hash(password)
        registrationDataSource.InsertParameters("lastName").DefaultValue = lastName
        registrationDataSource.InsertParameters("firstName").DefaultValue = firstName
        registrationDataSource.InsertParameters("type").DefaultValue = "customer"
        If registrationDataSource.Insert() > 0 Then
            Response.Redirect("Account/Register.aspx")
        End If
    End Sub
End Class