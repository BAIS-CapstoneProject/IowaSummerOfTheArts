﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Performers.aspx.vb" Inherits="Performers_Performers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br /><br />
    <div class="container">
        <div class="col-md-8 col-md-offset-2">
            <div class="row">
                <div class="input-group input-group-lg">
                     <asp:TextBox ID="tbSearch" AutoPostBack="true" Placeholder="Search by name" CssClass="form-control" runat="server"></asp:TextBox>
                    <span class="input-group-btn">
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default"  Text="Button" />
                    </span>
                    
                </div>
                <br /><br />
            </div>
        </div>
        <div class="col-md-12">
            <div class="row">
                <div class="table-responsive">
                     <asp:GridView CssClass="table" ID="GridView1" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="PersonID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="PersonID" HeaderText="PersonID" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="PersonID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="Hometown" HeaderText="Hometown" SortExpression="Hometown" />
                        <asp:TemplateField HeaderText="Image" SortExpression="imagepath">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imagepath") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImagePath") %>' AlternateText='<%# Bind("ImageName") %>'></asp:Image>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    </Columns>
                         <EmptyDataTemplate>
                             <h1>Sorry, we could not find this person</h1>
                         </EmptyDataTemplate>

                </asp:GridView>
                </div>
               
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT [PersonID], [Name], [Description], [Hometown], [imagename], [imagepath], [Category], [Type] FROM [Person] WHERE ([Type] = 'Performer')">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Performer" Name="Type" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

