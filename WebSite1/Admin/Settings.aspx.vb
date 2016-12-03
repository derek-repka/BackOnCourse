Imports System.Data
Partial Class Admin_Settings
    Inherits System.Web.UI.Page

    Protected Sub passChange_Click(sender As Object, e As EventArgs) Handles passChange.Click
        Dim adminpass As String = TryCast(Me.Master, SiteMaster).Hash(adminPassText.Text)
        Dim userDV As DataView = CType(sqlAdminPass.Select(DataSourceSelectArguments.Empty), DataView)

        If newPass.Text = newPassConfirm.Text Then
            If newPass.Text.Length > 6 Then
                If adminpass = userDV(0)(0) Then
                    Dim userID As Integer = Convert.ToInt32(gvUsers.SelectedRow.Cells(0).Text)
                    sqldsUsers.UpdateParameters("userID").DefaultValue = userID
                    sqldsUsers.UpdateParameters("pass").DefaultValue = TryCast(Me.Master, SiteMaster).Hash(newPass.Text)
                    sqldsUsers.Update()
                ElseIf adminpass <> userDV(0)(0) Then
                    adminPassWrong.Text = "Admin password is not correct."
                End If
            ElseIf newPass.Text.Length <= 6 Then
                wronglength.Text = "Password is not long enough."
            End If
        ElseIf newPass.Text <> newPassConfirm.Text Then
            mismatch.Text = "Passwords do not match."
        End If
    End Sub
End Class
