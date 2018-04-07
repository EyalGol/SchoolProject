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
    <img src="http://s2.quickmeme.com/img/af/af0dfac98060e9edb9d7812a9f41acaae0e12b1aa0fad0d2399985aaa54e3ad5.jpg"style="width:100%; height:100%" />
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
