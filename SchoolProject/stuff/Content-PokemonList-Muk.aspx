<%@ Page Title="" Language="C#" MasterPageFile="~/shifu.master" %>

<script runat="server">

</script>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <img src="http://cdn.memestache.com/2012/8/15/2dc8afca640a29d4ae4c21bc72f5d699.jpg"style="width:100%; height:100%" />
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
