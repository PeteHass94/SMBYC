Imports System.Data
Imports System.Data.OleDb


Partial Class EventsCalendar
    Inherits System.Web.UI.Page

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        futureDate.Text = (Calendar1.SelectedDate.ToShortDateString()).ToString()


    End Sub
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        ID = GridView1.SelectedRow.Cells(1).Text
        MsgBox(ID)

        Response.Redirect("EventDetails.aspx?Data=" & Server.UrlEncode(ID))

    End Sub
    Protected Sub SubmitFE_Click(sender As Object, e As EventArgs) Handles SubmitFE.Click


        Dim strConnection As String
        Dim cnn As oledbconnection
        Dim adptr As oledbdataadapter
        Dim ds As New DataSet
        Dim sql1 As String
        Dim i As Integer
        Dim PassUn As Boolean

        PassUn = False

        strConnection = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\SMBYC.mdb;Persist Security Info=True"
        sql1 = "Select MemberRef,FirstName, LastName, Pssword, Leader from tblMember "
        cnn = New OleDbConnection(strConnection)

        Try
            cnn.Open()
            adptr = New OleDbDataAdapter(sql1, cnn)
            adptr.Fill(ds)

            For i = 0 To ds.Tables(0).Rows.Count - 1

                If ds.Tables(0).Rows(i).Item(0) = LeaderRef.Text And ds.Tables(0).Rows(i).Item(3) = LeaderPassword.Text And ds.Tables(0).Rows(i).Item(4) = "True" Then

                    PassUn = True
                    Exit Try
                End If
            Next
            adptr.Dispose()
            cnn.Close()
        Catch ex As Exception
            MsgBox("Username, Password or Leader status not correct")

        End Try

        If PassUn = True Then
            Dim cnn1 As OleDbConnection
            Dim cmm As OleDbCommand
            cmm = New OleDbCommand()

            cnn1 = New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\SMBYC.mdb;Persist Security Info=True")
            cmm.Connection = cnn1
            cnn1.Open()

            cmm.CommandText = "INSERT INTO tblEvent(EventDate,DetailsofEvent,LeaderRef,Pssword) Values('" & futureDate.Text & "', '" & EventDetails.Text & "', '" & LeaderRef.Text & "', '" & LeaderPassword.Text & "')"
            cmm.ExecuteNonQuery()
            cnn1.Close()
        Else
            MsgBox("UserName is Incorrect")


        End If

        Response.Redirect("EventsCalendar.aspx")






    End Sub
End Class
