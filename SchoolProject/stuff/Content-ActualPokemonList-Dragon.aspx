<%@ Page Title="" Language="C#" MasterPageFile="~/shifu.master" %>

<script runat="server">

</script>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <img src="http://assets19.pokemon.com/assets/cms2/img/pokedex/full//610.png"style="width:100%; height:100%" />
</asp:Content>
<asp:Content ContentPlaceHolderID="Categories" runat="server">
            <ul>
    <li><a href="Content.aspx">Home</a></li>         
<li><a href="Content-ActualPokemonListGen1.aspx">Pokemon list</a></li>
<li><a href="Content-PokemonList.aspx">Honorable mentions</a></li>
<li><a href="About-Pokemon Games.aspx">Trivia</a></li>
<li><a href="Content-Test.aspx">Test</a></li>
        </ul>
</asp:Content>
<%-- Add content controls here --%>
