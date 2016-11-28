
Partial Class CartPage
    Inherits System.Web.UI.Page

    'Declare variable used to store value of Subtotal
    Private Subtotal_Product As Decimal = 0.0
    Protected Sub CartProductGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CartProductGridView.RowDataBound
        'Check row type
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' if row type is DataRow, add subtotal
            Subtotal_Product += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "productPrice")) * Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "quantity"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            ' If row type is footer, show calculated total value
            e.Row.Cells(4).Text = String.Format("{0:c}", Subtotal_Product)
        End If
    End Sub

    Private Subtotal_Workshop As Decimal = 0.0

    Protected Sub CartWorkshopGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CartWorkshopGridView.RowDataBound
        'Check row type
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' if row type is DataRow, add subtotal
            Subtotal_Workshop += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "workshopPrice")) * Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "quantity"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            ' If row type is footer, show calculated total value
            e.Row.Cells(6).Text = String.Format("{0:c}", Subtotal_Workshop)
        End If
    End Sub
End Class
