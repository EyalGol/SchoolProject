<%@ Page Title="" Language="C#" MasterPageFile="~/shifu.master" %>

<script runat="server">

</script>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<iframe width="560" height="315" src="https://www.youtube.com/embed/4nsKDJlpUbA" frameborder="0" allowfullscreen></iframe>
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
