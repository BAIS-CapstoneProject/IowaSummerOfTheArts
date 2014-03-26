﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Search.aspx.vb" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="form-inline search">
                    <div class="form-group">
                        <div class="input-group input-group-lg searchTerm">
                            <asp:TextBox ID="tbSearchTerm" runat="server" PlaceHolder="Search by name or place" CssClass="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="removeSearchBtn" runat="server" CssClass="btn btn-default" Text="Search" /></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Festival:</label>
                        <asp:DropDownList AutoPostBack="true" CssClass="form-control btn btn-default dropdown-toggle" ID="dropdownlistFestival" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="festivalID">
                             <asp:ListItem Selected="True" Text="All" Value="*">All</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT festivalID, name + ' - ' + CONVERT(nvarchar(12), year) AS name FROM [Festival]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <label>Person Type:</label>
                        <asp:DropDownList AutoPostBack="true"  CssClass="form-control btn btn-default dropdown-toggle" ID="dropdownlistPerson" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource2" DataTextField="Type" DataValueField="Type">
                            <asp:ListItem Selected="True" Text="All" Value="All">All</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT DISTINCT [Type] FROM [Person]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <label>Order By:</label>
                        <asp:DropDownList ID="DropDownListOrderBy"  CssClass="form-control btn btn-default dropdown-toggle" runat="server" AutoPostBack="true">
                            <asp:ListItem>Date - Newest First</asp:ListItem>
                            <asp:ListItem>Date - Oldest First</asp:ListItem>
                            <asp:ListItem>Name A-z</asp:ListItem>
                            <asp:ListItem>Name Z-a</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:DataList ID="DataList1" runat="server" GridLines="None" RepeatLayout="Flow">
                    <HeaderTemplate>
                        <h1>Search Results</h1>
                        <hr />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="media">
                            <div class="pull-left">
                                 <asp:Image ID="Image1" CssClass="img-responsive media-object gridviewimages" runat="server" ImageUrl='<%# Bind("ImagePath") %>' AlternateText='<%# Bind("ImageName") %>'></asp:Image>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading"><%# Container.DataItem("Expr5") %> <span class="label label-default"><%# Container.DataItem("Category") %></span> </h4><br />
                                <div class="pull-right details">
                                     <%# DataBinder.Eval(Container.DataItem, "StartTime", "{0:D}")%>
                                    <br />
                                    <em><%# DataBinder.Eval(Container.DataItem, "Expr3", "{0:D}")%></em>
                                    <br />
                                    <span class="badge">
                                        <%# DataBinder.Eval(Container.DataItem, "StartTime", "{0:hh:mm tt}")%> - <%# DataBinder.Eval(Container.DataItem, "EndTime", "{0:hh:mm tt}")%>
                                    </span>
                                    <br /><br />
                                    <asp:HyperLink ID="HyperLink1" runat="server">View Details</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                        <hr />
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>

</asp:Content>

