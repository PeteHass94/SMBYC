Imports System.Data
Imports System.Data.OleDb


Partial Class EventDetails
    Inherits System.Web.UI.Page

    Protected Sub AddMember_Click(sender As Object, e As EventArgs) Handles AddMember.Click
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

                If ds.Tables(0).Rows(i).Item(0) = MemberNumber.Text And ds.Tables(0).Rows(i).Item(3) = MemberPassword.Text Then
                    PassUn = True
                    Exit Try
                End If
            Next

            adptr.Dispose()
            cnn.Close()
        Catch ex As Exception
            MsgBox("Please Try Again")

        End Try

        Dim JoinDate As Date
        Dim EventNo As Integer

        JoinDate = Now()
        EventNo = HttpUtility.UrlDecode(Request.QueryString("Data"))

        If PassUn = True Then
            Dim cnn1 As OleDbConnection
            Dim cmm As OleDbCommand
            cmm = New OleDbCommand()

            cnn1 = New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\SMBYC.mdb;Persist Security Info=True")
            cmm.Connection = cnn1
            cnn1.Open()

            cmm.CommandText = "INSERT INTO tblApplicant(EventNo,MemberRef,Pssword,DateJoined) Values('" & EventNo & "', '" & MemberNumber.Text & "', '" & MemberPassword.Text & "', '" & JoinDate & "')"
            cmm.ExecuteNonQuery()
            cnn1.Close()
        Else
            MsgBox("UserName is Incorrect")


        End If

        Response.Redirect("EventDetails.aspx?Data=" & EventNo)

    End Sub
End Class
