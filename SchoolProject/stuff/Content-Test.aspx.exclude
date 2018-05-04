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
    <form onsubmit="return checkquiz()">
    <ol>
          <li>
            <p>The cartoon originates from..</p> <p id="radioerr1"></p>
            
              <label>
                <input type="radio" value="radio" name="radio1">
                U.S.A.</label>
              <br>
              <label>
                <input type="radio" value="radio" name="radio1">
                Europe</label>
              <br>
              <label>
                <input type="radio" id = "true1" name="radio1">
                Japan</label>
            </blockquote>
          </li>
          <li>
            <p>Which of these statements is true?</p> <p id="radioerr2"></p>
            <blockquote>
              <label>
                <input type="radio" value="radio" name="radio2">
                The
                cartoon show came before the video game.</label>
              <br>
              <label>
                <input type="radio" id = "true2" name="radio2">
                The video came
                came before the cartoon show.</label>
            </blockquote>
          </li>
          <li>
            <p>Who is the hero of the show?</p> <p id="radioerr3"></p>
            <blockquote>
              <label>
                <input type="radio" id = "true3" name="radio3">
                Ash</label>
              <br>
              <label>
                <input type="radio" value="radio" name="radio3">
                Gary</label>
              <br>
              <label>
                <input type="radio" value="radio" name="radio3">
                Misty</label>
            </blockquote>
          </li>
          <li>
            <p>How can you capture a Pokémon?</p> <p id="radioerr4"></p>
            <blockquote>
              <label>
                <input type="radio" value="radio" name="radio4">
                calling
                it by name.</label>
              <br>
              <label>
                <input type="radio" value="radio" name="radio4">
                singing to it.</label>
              <br>
              <label>
                <input type="radio" id = "true4" name="radio4">
                capturing it in
                a pokéball.</label>
            </blockquote>
          </li>
          <li>
            <p>Are Gary and Ash friends?</p> <p id="radioerr5"></p>
            <blockquote>
              <label>
                <input type="radio" value="radio" name="radio5">
                Yes</label>
              <br>
              <label>
                <input type="radio" id = "true5" name="radio5">
                No</label>
            </blockquote>
          </li>
          <li>
            <p>How do Ash and Misty first meet?</p> <p id="radioerr6"></p>
            <blockquote>
              <label>
                <input type="radio" value="radio" name="radio6">
                They
                are both trying to catch Pikachu</label> 
              <br>
              <label>
                <input type="radio" id = "true6" name="radio6">
                Ash wrecks her
                bike while trying to escape the spearows.</label>
              <br>
              <label>
                <input type="radio" value="radio" name="radio6">
                They are both
                in the same class in school.</label>
            </blockquote>
          </li>
          <li>
            <p>Pikachu and Ash become instant friends?</p> <p id="radioerr7"></p>
            <blockquote>
              <label>
                <input type="radio" value="radio" name="radio7">
                True</label>
              <br>
              <label>
                <input type="radio" id = "true7" name="radio7">
                False</label>
            </blockquote>
          </li>
          <li>
            <p>What are the three (main) kinds of Pokémon?</p> <p id="radioerr8"></p>
            <blockquote>
              <label>
                <input type="radio" id = "true8" name="radio8">
                Fire,
                water and electric.</label>
              <br>
              <label>
                <input type="radio" value="radio" name="radio8">
                Earth, wind and
                fire.</label>
              <br>
              <label>
                <input type="radio" value="radio" name="radio8">
                Body,
                soul and mind.</label>
            </blockquote>
          </li>
          <li>
            <p>What are the names of the villians in the show?</p> <p id="radioerr9"></p>
            <blockquote>
              <label>
                <input type="radio" value="radio" name="radio9">
                Peter,
                Paul and Ratattat</label>
              <br>
              <label>
                <input type="radio" value="radio" name="radio9">
                Steve, Joe and
                Pikachu</label>
              <br>
              <label>
                <input type="radio" id = "true9" name="radio9">
                Jessy, James and
                Meowth</label>
            </blockquote>
          </li>
          <li>
            <p>Ash wants to become a Pokémon Master.</p> <p id="radioerr10"></p>
            <blockquote>
              <label>
                <input type="radio" id = "true10" name="radio10">
                True</label>
              <br>
              <label>
                <input type="radio" value="radio" name="radio10">
                False</label>
          </li>
        </ol>
        <br />
        <input type="submit" />
        
        </form>
    <script type="text/javascript">
        function checkquiz()
        {
            var radio1 = document.getElementById("true1");
            var radio2 = document.getElementById("true2");
            var radio3 = document.getElementById("true3");
            var radio4 = document.getElementById("true4");
            var radio5 = document.getElementById("true5");
            var radio6 = document.getElementById("true6");
            var radio7 = document.getElementById("true7");
            var radio8 = document.getElementById("true8");
            var radio9 = document.getElementById("true9");
            var radio10 = document.getElementById("true10");
            if (radio1.checked == true)
            {
                document.getElementById("radioerr1").innerHTML = "<font style='color:green'>Correct</font>";
            }
            else
            {
                document.getElementById("radioerr1").innerHTML = "<font style='color:red'>Incorrect</font>"
            }
            if (radio2.checked == true) {
                document.getElementById("radioerr2").innerHTML = "<font style='color:green'>Correct</font>";
            }
            else {
                document.getElementById("radioerr2").innerHTML = "<font style='color:red'>Incorrect</font>"
            }
            if (radio3.checked == true) {
                document.getElementById("radioerr3").innerHTML = "<font style='color:green'>Correct</font>";
            }
            else {
                document.getElementById("radioerr3").innerHTML = "<font style='color:red'>Incorrect</font>"
            }
            if (radio3.checked == true) {
                document.getElementById("radioerr3").innerHTML = "<font style='color:green'>Correct</font>";
            }
            else {
                document.getElementById("radioerr3").innerHTML = "<font style='color:red'>Incorrect</font>"
            }
            if (radio4.checked == true) {
                document.getElementById("radioerr4").innerHTML = "<font style='color:green'>Correct</font>";
            }
            else {
                document.getElementById("radioerr4").innerHTML = "<font style='color:red'>Incorrect</font>"
            }
            if (radio5.checked == true) {
                document.getElementById("radioerr5").innerHTML = "<font style='color:green'>Correct</font>";
            }
            else {
                document.getElementById("radioerr5").innerHTML = "<font style='color:red'>Incorrect</font>"
            }
            if (radio6.checked == true) {
                document.getElementById("radioerr6").innerHTML = "<font style='color:green'>Correct</font>";
            }
            else {
                document.getElementById("radioerr6").innerHTML = "<font style='color:red'>Incorrect</font>"
            }
            if (radio7.checked == true) {
                document.getElementById("radioerr7").innerHTML = "<font style='color:green'>Correct</font>";
            }
            else {
                document.getElementById("radioerr7").innerHTML = "<font style='color:red'>Incorrect</font>"
            }
            if (radio8.checked == true) {
                document.getElementById("radioerr8").innerHTML = "<font style='color:green'>Correct</font>";
            }
            else {
                document.getElementById("radioerr8").innerHTML = "<font style='color:red'>Incorrect</font>"
            }
            if (radio9.checked == true) {
                document.getElementById("radioerr9").innerHTML = "<font style='color:green'>Correct</font>";
            }
            else {
                document.getElementById("radioerr9").innerHTML = "<font style='color:red'>Incorrect</font>"
            }
            if (radio10.checked == true) {
                document.getElementById("radioerr10").innerHTML = "<font style='color:green'>Correct</font>";
            }
            else {
                document.getElementById("radioerr10").innerHTML = "<font style='color:red'>Incorrect</font>"
            }
            return false;
        }

    </script>
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
