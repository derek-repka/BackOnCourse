
Partial Class Purchase
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As EventArgs)
        Dim dv = finalPaymentDataSource.Select(DataSourceSelectArguments.Empty)
        finalPaymentLal.Text = dv(0)(0)
    End Sub

    Protected Sub Pay(sender As Object, e As EventArgs)
        paymentDataSource.Update()
        Response.Redirect("/Confirmation.aspx")
    End Sub

    Public Sub onPay(source As Object, e As EventArgs)
        If Page.IsValid Then
            'input valid 
        End If
    End Sub
End Class
