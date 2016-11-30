
Partial Class Purchase
    Inherits System.Web.UI.Page

    Protected Sub Pay(sender As Object, e As EventArgs)
        paymentDataSource.Update()
        Response.Redirect("/Confirmation.aspx")
    End Sub
End Class
