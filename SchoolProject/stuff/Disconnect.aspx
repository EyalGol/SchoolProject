<%@ Page Title="" Language="C#" MasterPageFile="~/shifu.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("err403.aspx");
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Categories" Runat="Server">
</asp:Content>

