<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="artistdetails.aspx.vb" Inherits="artistdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT * FROM [Person] WHERE ([PersonID] = @PersonID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="PersonID" QueryStringField="PersonID" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="NameLbl" runat="server" Text=""></asp:Label>
    <asp:Image ID="ArtistImage" runat="server" />
    <asp:DetailsView ID="ArtistDetailsView" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="PersonID" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Hometown" HeaderText="Hometown" SortExpression="Hometown" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
        </Fields>
    </asp:DetailsView>




</asp:Content>

