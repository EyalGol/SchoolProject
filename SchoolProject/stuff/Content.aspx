<%@ Page Title="" Language="C#" MasterPageFile="~/shifu.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("err403.aspx");
            Response.End();
        }
    }
</script>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <img src="http://i.makeagif.com/media/5-05-2016/gc-vEA.gif" alt="content"/>
</asp:Content>
<asp:Content ContentPlaceHolderID="Categories" runat="server">
            <ul>
    <li><a href="Content.aspx">Home</a></li>         
<li><a href="Content-ActualPokemonListGen1.aspx">Pokemon list</a></li>
<li><a href="Content-PokemonList.aspx">Honorable mentions</a></li>
<li><a href="Content-Trivia.aspx">Trivia</a></li>
<li><a href="Content-Test.aspx">Test</a></li>
        </ul>
</asp:Content>
<%-- Add content controls here --%>
