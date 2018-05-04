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
    <h1 style="text-align:center">some trivia</h1>
    <ol>
        <li>Hitmonchan and Hitmonlee are based on Jackie Chan and Bruce Lee, respectively.</li>
        <li> If a Pokemon existed that had every type, it would be weak only to Rock types.</li>
        <li>Ekans spells "Snake" backwards, and Arbok "Kobra."</li>
        <li>Poliwag’s swirls actually resemble a real-life tadpole’s intestines.</li>
        <li>Every Spinda has a unique pattern of spots; there are over 4 billion combinations in-game.</li>
        <li>The names for each of the three legendary birds ends in Spanish: ArticUNO, ZapDOS and MolTRES</li>
        <li>Mr. Mime can also be a girl, even though the female Pokemon's name would still include "Mr."</li>
        <li>Pikachu (Mouse Pokemon) has a pokedex number of 25, while Meowth (Cat Pokemon) has one of 52. Reverse those, and you can see that they are the opposite of one another, just like cats and mice.</li>
    </ol>
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
