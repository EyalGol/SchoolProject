<%@ Page Title="" Language="C#" MasterPageFile="~/shifu.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["username"] != "Admin")
        {
            Response.Redirect("err403.aspx");
            Response.End();
        }
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src=http://www.cute-calendar.com/images/en/teaser/system-administrator-appreciation-day.jpg />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Categories" Runat="Server">
    <ul>
<li><a href="admin.aspx">Admin</a></li>
<li><a href="admin-listing.aspx">User Listing</a></li>
        <li><a href="admin-statistics.aspx">Stats</a></li>
</ul>
</asp:Content>

