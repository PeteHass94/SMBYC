
Partial Class PastEvents
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        ID = GridView1.SelectedRow.Cells(1).Text
        MsgBox(ID)

        Response.Redirect("selectedPastEvent.aspx?Data=" & Server.UrlEncode(ID))
    End Sub

End Class
