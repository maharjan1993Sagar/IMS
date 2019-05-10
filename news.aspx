<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="news.aspx.cs" Inherits="newsAndEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        function hideImage(img) {
            img.style.display = "none";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong class="text-center">News</strong>
                    </div>
                    <div class="panel-body">
                        <asp:Label ID="lblMesPanel" runat="server"></asp:Label>
                        <asp:Repeater ID="repNews" runat="server">
                            <ItemTemplate>
                                <a href='<%#"news.aspx?nid="+Eval("id") %>' id="lbTitle" runat="server"><strong style="color: #264f87;">
                                    <%# Eval("title")%></strong></a>
                                <br />
                                <small><i class="fa fa-calendar-o">&nbsp;<%# Eval("postedDate")%></i></small>&nbsp;<small><i
                                    class="fa fa-user"> &nbsp;<%# Eval("postedBy")%></i></small><br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <asp:Label ID="lblMes" runat="server"></asp:Label>
                <asp:Repeater ID="repLatest" runat="server">
                    <ItemTemplate>
                        <h4 class="text-primary" style="margin-bottom: 0px;">
                            <strong>
                                <%# Eval("title")%></strong></h4>
                        <small><i class="fa fa-calendar">&nbsp;<%# Eval("postedDate") %>&nbsp;</i>&nbsp;<i
                            class="fa fa-user">&nbsp;<%# Eval("postedBy")%></i></small>
                            <div class="text-center">
                        <img src='image/news/<%# Eval("image")%>' onerror="hideImage(this);" width="550px"
                            alt="Avatar" /></div>
                                <%# Eval("description")%>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
