<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="PastEvents.aspx.vb" Inherits="PastEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="jumbotron" id="PEJumbo">
        <h1 id="bigHeading">Sperrin Mountain Bike Youth Club</h1>
        <p class="lead" id="bigHeading">Past Events</p>
        <p><a href="Default" class="btn btn-primary btn-lg">Return to Homepage &gt;&gt;</a>&nbsp; </p>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="EventNum" HeaderText="EventNum" InsertVisible="False" SortExpression="EventNum" />
        <asp:BoundField DataField="Event Date" HeaderText="Event Date" SortExpression="Event Date" />
        <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
        <asp:BoundField DataField="Leader" HeaderText="Leader" SortExpression="Leader" ReadOnly="True" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT tblEvent.EventNo AS EventNum, tblEvent.EventDate AS [Event Date], tblEvent.DetailsofEvent AS Details, tblMember.FirstName &amp; ' ' &amp; tblMember.LastName AS Leader FROM (tblEvent INNER JOIN tblMember ON tblEvent.LeaderRef = tblMember.MemberRef) WHERE (tblEvent.EventDate &lt; NOW())"></asp:SqlDataSource>
</asp:Content>

