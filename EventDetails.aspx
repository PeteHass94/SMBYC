<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="EventDetails.aspx.vb" Inherits="EventDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="jumbotron" id="EDJumbo">
        <h1 id="bigHeading">Sperrin Mountain Bike Youth Club</h1>
        <p class="lead" id="bigHeading">Event Details</p>
        <p><a href="EventsCalendar" class="btn btn-primary btn-lg">Return to Events Calendar &gt;&gt;</a>&nbsp; </p>
    </div>
    The Selected Future Event is as:<br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="EventNo" HeaderText="EventNo" InsertVisible="False" SortExpression="EventNo" />
        <asp:BoundField DataField="DetailsofEvent" HeaderText="DetailsofEvent" SortExpression="DetailsofEvent" />
        <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" />
        <asp:BoundField DataField="Leader" HeaderText="Leader" ReadOnly="True" SortExpression="Leader" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT tblEvent.EventNo, tblEvent.DetailsofEvent, tblEvent.EventDate, tblMember.FirstName &amp; ' ' &amp; tblMember.LastName AS Leader FROM (tblEvent INNER JOIN tblMember ON tblEvent.LeaderRef = tblMember.MemberRef) WHERE (tblEvent.EventNo = ?)">
    <SelectParameters>
        <asp:QueryStringParameter Name="?" QueryStringField="Data" />
    </SelectParameters>
</asp:SqlDataSource>
    <br />
    The Members who will attend are:<br />
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="EventNo" HeaderText="EventNo" InsertVisible="False" SortExpression="EventNo" />
            <asp:BoundField DataField="MemberRef" HeaderText="MemberRef" SortExpression="MemberRef" />
            <asp:BoundField DataField="Member Name" HeaderText="Member Name" ReadOnly="True" SortExpression="Member Name" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT tblEvent.EventNo, tblApplicant.MemberRef, tblMember.FirstName &amp; ' ' &amp; tblMember.LastName AS [Member Name] FROM ((tblEvent INNER JOIN tblApplicant ON tblEvent.EventNo = tblApplicant.EventNo) INNER JOIN tblMember ON tblApplicant.MemberRef = tblMember.MemberRef) WHERE (tblEvent.EventNo = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="?" QueryStringField="Data" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <h2>Event Number is
        <asp:Label ID="EventNumberText" runat="server" Text="Above"></asp:Label>
    </h2>
    <h2>To Join This Event We Need your:</h2>
    <h2>
        <asp:Label ID="Label1" runat="server" Text="Your Member Number: "></asp:Label>
        <asp:TextBox ID="MemberNumber" runat="server"></asp:TextBox>
    </h2>
    <h2>
        Your Password:
    <asp:TextBox ID="MemberPassword" runat="server"></asp:TextBox>
    </h2>
    <h2>
        <asp:Button ID="AddMember" runat="server" Text="Submit" />
    </h2>
    

</asp:Content>

