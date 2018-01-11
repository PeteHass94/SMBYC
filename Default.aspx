<%--The name of the page--%>
<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %> 
<%--Content of the page--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
    <%--The Jumbotron/big image--%>
    <div class="jumbotron">
        <h1 id="bigHeading">Sperrin Mountain Bike Youth Club</h1> <%--h1 is a big heading--%>
        <p class="lead" id="bigHeading">Non-profit Organisation that run annual events to promote the health benefits of cycling!</p>
        <p><a href="EventsCalendar" class="btn btn-primary btn-lg">Go to Future Events &gt;&gt;</a>&nbsp; </p> <%--adding a button to help prompt user to visit future events--%>
    </div>

    <div class="row"> 
        <div class="col-md-4" id="subHeading">
            <h2>Website Introduction</h2>
            <p class="MsoNormal">
                A club leader will upload details of an event and display them to the required club members.<o:p></o:p></p>
            <p class="MsoNormal">
                The club members can also view the past events and see all who attended.<o:p></o:p></p>
            <p class="MsoNormal">
                The club members can join an event when they want to sign up, then an event that passes the present date is called a past event.<o:p></o:p></p>
            <p>
                &nbsp;</p>
            <p>
                <a class="btn btn-default" href="Default">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4" id="subHeading">
            <h2>Past Events</h2>
            <p>
                We have had a number  past events including:
                <ul>
                    <li>Intro to easy trails</li>
                    <li>Downhill Control</li>
                    <li>Skills Events</li>
                    <li>Attempt to hack the system</li>
                </ul>
            </p>
            <p>
                <a class="btn btn-default" href="PastEvents">Find out More! &raquo;</a>
            </p>
        </div>
        <div class="col-md-4" id="subHeading">
            <h2>Future Events</h2>
            <p>
                We have had a number of upcoming past events including:
                <ul>
                    <li>Intro to easy trails</li>
                    <li>Downhill Control</li>
                    <li>Skills Events</li>
                    <li>Attempt to hack the system</li>
                </ul>
            </p>
            <p>
                <a class="btn btn-default" href="EventsCalendar">Find out More! &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
