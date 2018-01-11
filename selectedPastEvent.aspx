<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="selectedPastEvent.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <div class="jumbotron" id="SPEJumbo">
        <h1 id="bigHeading">Sperrin Mountain Bike Youth Club</h1>
        <p class="lead" id="bigHeading">Selected Past Events</p>
        <p><a href="PastEvents" class="btn btn-primary btn-lg">Return to Past Events &gt;&gt;</a>&nbsp; </p>
    </div>
    The Selected Past Event is as:<br />
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
    The Members who attended are:<br />
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
</asp:Content>

