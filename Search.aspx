<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Search.aspx.vb" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="search">
                    <asp:TextBox ID="tbSearchTerm" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                    <asp:DropDownList AutoPostBack="true" ID="dropdownlistFestival" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="festivalID">
                         <asp:ListItem Selected="True" Text="All" Value="*">All</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT festivalID, name + ' - ' + CONVERT(nvarchar(12), year) AS name FROM [Festival]"></asp:SqlDataSource>
                    <asp:DropDownList AutoPostBack="true" ID="dropdownlistPerson" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource2" DataTextField="Type" DataValueField="Type">
                        <asp:ListItem Selected="True" Text="All" Value="All">All</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT DISTINCT [Type] FROM [Person]"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownListOrderBy" runat="server" AutoPostBack="true">
                        <asp:ListItem>Date - Newest First</asp:ListItem>
                        <asp:ListItem>Date - Oldest First</asp:ListItem>
                        <asp:ListItem>Name A-z</asp:ListItem>
                        <asp:ListItem>Name Z-a</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:DataList ID="DataList1" runat="server" GridLines="None" RepeatLayout="Flow">
                    <HeaderTemplate>

                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="media">
                            <a class="pull-left">
                                <img class="media-object" src="" />
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading"><%# Container.DataItem("Expr5") %></h4>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
</asp:Content>

