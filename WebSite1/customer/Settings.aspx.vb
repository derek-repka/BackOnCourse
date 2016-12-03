
Imports System.Data

Partial Class customer_Settings
    Inherits System.Web.UI.Page

    Protected Sub restButton_Click(sender As Object, e As EventArgs) Handles restButton.Click
        Dim currPass As String = TryCast(Me.Master, SiteMaster).Hash(currentPassword.Value)
        Dim newPass As String = TryCast(Me.Master, SiteMaster).Hash(newPassword.Value)
        Dim reEnteredNewPass As String = TryCast(Me.Master, SiteMaster).Hash(reEnterNewPassword.Value)
        Dim dv As DataView = CType(resetPasswordDataSource.Select(DataSourceSelectArguments.Empty), DataView)
        Dim dbPass As String = dv(0)(0)
        If dbPass = currPass Then
            If newPass = reEnteredNewPass Then
                resetPasswordDataSource.UpdateParameters("userID").DefaultValue = Session("id")
                resetPasswordDataSource.UpdateParameters("password").DefaultValue = newPass
                resetPasswordDataSource.Update()
                warningLabel.Text = "Your password has been updated"
            Else
                warningLabel.Text = "New password is not matched"
            End If
        Else
            warningLabel.Text = "Current passward is incorrect"
        End If
    End Sub
End Class
