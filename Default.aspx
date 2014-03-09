<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
        <img src="images/4679557-LAS-iowa-arts-festival-06_06_2009-15.46.58.jpg" />
      <div class="carousel-caption">
        <h2>Arts Festival</h2>
          <p>Date</p>
      </div>
    </div>
    <div class="item">
        <img src="images/4743430-LAS-IOWA-CITY-JAZZ-FEST-07_04_2009-19.17.48.jpg" />
        <div class="carousel-caption">
            <h2>Jazz Festival</h2>
            <p>Date</p>
        </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
          <h1>Upcoming Events</h1>
                         <asp:DropDownList AutoPostBack="true" CssClass="btn btn-default dropdown-toggle" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="FestivalID"></asp:DropDownList>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT [name], [current], [FestivalID] FROM [Festival] WHERE ([current] = @current)">
                         <SelectParameters>
                             <asp:Parameter DefaultValue="1"  Name="current" Type="Byte" />
                         </SelectParameters>
                 </asp:SqlDataSource>
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <br />
                         <ul class="list-group">
                    </HeaderTemplate>
                    <ItemTemplate>
                       
                            <li class="list-group-item">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Expr5") %>'></asp:Label><br />
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                <span class="badge">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Time") %>' ></asp:Label>
                                </span>
                                <br />
                                <em><asp:Label ID="Label4" runat="server" Text='<%# Eval("Expr3", "{0:d}" ) %>'></asp:Label></em>
                                
                            </li>
                       
                    </ItemTemplate>
                    <FooterTemplate>
                         </ul>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k185Arts4ConnectionString %>" SelectCommand="SELECT Events.EventID, Events.FestivalID, Events.PersonID, Events.LocationID, Events.Time, Events.Date, Festival.festivalID AS Expr1, Festival.name, Festival.year, Location.LocationID AS Expr2, Location.Name AS Expr3, Person.PersonID AS Expr4, Person.Name AS Expr5, Person.Description, Person.imagename, Person.imagepath, Person.Type FROM Events INNER JOIN Festival ON Events.FestivalID = Festival.festivalID INNER JOIN Location ON Events.LocationID = Location.LocationID INNER JOIN Person ON Events.PersonID = Person.PersonID WHERE (Events.FestivalID = 5)"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

