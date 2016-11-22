
Partial Class corseListing3
    Inherits System.Web.UI.Page

    Private Sub searchButton_Click(sender As Object, e As EventArgs) Handles searchButton.Click
        Courses.Visible = True
        Courses.Enabled = True
    End Sub
End Class
