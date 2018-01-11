<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="EventsCalendar.aspx.vb" Inherits="EventsCalendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="jumbotron" id="FEJumbo">
        <h1 id="bigHeading">Sperrin Mountain Bike Youth Club</h1>
        <p class="lead" id="bigHeading">Future Events</p>
        <p><a href="Default" class="btn btn-primary btn-lg">Return to Homepage &gt;&gt;</a>&nbsp; </p>
    </div>
    <p>
        The upcoming Events for Sperrin Mountain Bike Youth Club is:</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="EventNum" HeaderText="EventNum" InsertVisible="False" SortExpression="EventNum" />
                <asp:BoundField DataField="Event Date" HeaderText="Event Date" SortExpression="Event Date" />
                <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
                <asp:BoundField DataField="Leader" HeaderText="Leader" ReadOnly="True" SortExpression="Leader" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT tblEvent.EventNo AS EventNum, tblEvent.EventDate AS [Event Date], tblEvent.DetailsofEvent AS Details, tblMember.FirstName &amp; ' ' &amp; tblMember.LastName AS Leader FROM (tblEvent INNER JOIN tblMember ON tblEvent.LeaderRef = tblMember.MemberRef) WHERE (tblEvent.EventDate &gt;= NOW())"></asp:SqlDataSource>
    </p>
    
        <h2>Only a Leader can Create an Event. <br />Fill in your details to add an event!</h2>
    <p>
        Select the date:</p>
    <p>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    </p>
    <h4>
        Date Selected:</h4>
    <p>
        <asp:Label ID="futureDate" runat="server" AssociatedControlID="futureDate" Text="00/00/0000"></asp:Label>
    <h3>Details:</h3>
        <asp:TextBox ID="EventDetails" runat="server"></asp:TextBox>
    </p>
    <p>
        <h3>Leader Ref:</h3>
        <asp:TextBox ID="LeaderRef" runat="server"></asp:TextBox>
    </p>
    <p>
        <h3>Password:</h3>
        <asp:TextBox ID="LeaderPassword" runat="server"></asp:TextBox>
    <asp:Button ID="SubmitFE" runat="server" Text="Submit New Event" />
    </p>
</asp:Content>

