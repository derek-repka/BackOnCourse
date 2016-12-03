
Imports System.Data

Partial Class Cart
    Inherits System.Web.UI.Page
    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs)
        Dim dv As DataView = CType(totalPriceDataSource.Select(DataSourceSelectArguments.Empty), DataView)
        If dv(0)(0) = 0 Then
            btnCheckout.Disabled = True
        End If
        TotalPrice.Text = dv(0)(0)
    End Sub
    Protected Sub CartProductGridView_RowCommand(grid As GridView, e As GridViewCommandEventArgs)
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim row As GridViewRow = grid.Rows(index)
        Dim ordeLineId As Integer = grid.DataKeys(index).Value
        Dim quantity As Integer = Convert.ToInt32(row.Cells(4).Text)
        If e.CommandName.Equals("increaseQuantity") Then
            quantity += 1
        ElseIf e.CommandName.Equals("decreaseQuantity") And quantity > 1 Then
            quantity -= 1
        End If
        row.Cells(4).Text = quantity
        cartProductDataSource.UpdateParameters("orderLineId").DefaultValue = ordeLineId
        cartProductDataSource.UpdateParameters("quantity").DefaultValue = quantity
        cartProductDataSource.Update()
    End Sub

    Private Subtotal_Workshop As Decimal = 0.0
    Protected Sub CartWorkshopGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CartWorkshopGridView.RowDataBound
        'Check row type
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' if row type is DataRow, add subtotal
            Subtotal_Workshop += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "workshopPrice")) * Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "quantity"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            ' If row type is footer, show calculated total value
            e.Row.Cells(5).Text = String.Format("{0:c}", Subtotal_Workshop)
        End If
    End Sub

    Private Subtotal_eCourse As Decimal = 0.0
    Protected Sub CarteCourseGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CarteCourseGridView.RowDataBound
        'Check row type
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' if row type is DataRow, add subtotal
            Subtotal_eCourse += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "productPrice")) * Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "quantity"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            ' If row type is footer, show calculated total value
            e.Row.Cells(3).Text = String.Format("{0:c}", Subtotal_eCourse)
        End If
    End Sub

    Private Subtotal_Product As Decimal = 0.0
    Protected Sub CartProductGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CartProductGridView.RowDataBound
        'Check row type
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' if row type is DataRow, add subtotal
            Subtotal_Product += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "productPrice")) * Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "quantity"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            ' If row type is footer, show calculated total value
            e.Row.Cells(6).Text = String.Format("{0:c}", Subtotal_Product)
        End If
    End Sub
End Class
