<%@ Page Title="" Language="C#" MasterPageFile="~/shifu.master"  Debug="true"%>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:content ID="Content1" ContentPlaceHolderID="Categories" runat="server">

            <ul>
<li><a href="#">Signup</a></li>
        </ul>
    </asp:content>
<asp:content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        
        /*window.onbeforeunload = function() {
        return "Dude, are you sure you want to leave? Think of the kittens!";
        }*/
</script>
     <img id="myimg" src="password meter.png" />
    <form  name="myform" id="myform" method="post" onsubmit="return masterCheck()">
    <table>
        <tr><td>UserId: </td><td><input id="userId" type="text" name="username" /></td><td><p id="usererr">&nbsp</p></td><td></td></tr>
        <tr><td>Password: </td><td><input id="password" type="password" name="password"/></td><td><p id="passerr">&nbsp</p></td><td></td></tr>
        <tr><td>Confirm Password: </td><td><input id="confirmpass" type="password" /></td><td><p id="passconfirmerr">&nbsp</p></td></tr>
        <tr><td>Email:</td><td><input type="text" id="email" name="email"/></td><td><p id="mailerr"></p></td></tr>
        <tr><td>Male</td><td><input name="radio" type="radio" id="radio1" value="male"/></td><td><p id="sexerr">  </p></td></tr>
        <tr><td>Female</td><td><input name="radio" type="radio" id="radio2" value="female" /></td></tr>
        <tr><td>Enter Birth date</td><td><input id="date" type="text" name="date" /></td><td><p id="dateerr">&nbsp</p></td></tr>
        <tr><td>Which is your favorite starter pokemon</td>
            <td><select id="Starter" name="Select">
            <option value="1">Bulbasaur</option>
            <option value="2">Charamander</option>
            <option value="3">Squirtle</option>
            <option value="4">Pickachu</option>
            <option value="5">Cyndaquil</option>
            <option value="6">Chikaorita</option>
            <option value="7">Totodile</option>
            <option value="8">Treeko</option>
            <option value="9">Torchic</option>
            <option value="10">Mudkip</option>
            <option value="11">Turtwig</option>
            <option value="12">Chimichar</option>
            <option value="13">Piplup</option>
            <option value="14">Snivy</option>
            <option value="15">Tepig</option>
            <option value="16">Oshawott</option>
                                                                </select></td><td><p id="starterr">&nbsp</p></td></tr>
        <tr><td>Are we cool?</td><td><input type="checkbox" id="checkbox"/></td><td><p id="checkboxerr">&nbsp</p></td></tr>
        <tr><td><input type="submit" name="submit" onclick="return('!IsExistBool')" /></td></tr>
                <tr><td><%=Session["err"] %></td></tr>
    </table>
        </form>
        <script type="text/javascript">
            function emailcheck(value) {
                if (value == "") {
                    document.getElementById("mailerr").innerHTML = "enter email";
                    return false;
                }
                if (value.split('@').length != 2) {
                    document.getElementById("mailerr").innerHTML = "must have exactly one @";
                    return false;
                }
                else {
                    var parts = value.split('@');
                    var domain = parts[1];
                    if (parts[0].length < 6 || parts[0].length > 12) {
                        document.getElementById("mailerr").innerHTML = "must be 6-12 characters before @";
                        return false;
                    }
                    if (domain.indexOf('.') == -1) {
                        document.getElementById("mailerr").innerHTML = "there must be dot after @";
                        return false;
                    }
                    else {
                        var domainParts = domain.split('.');
                        var ext = domainParts[1];
                        if (domainParts[0].length < 2 || domainParts[0].length > 8) {
                            document.getElementById("mailerr").innerHTML = "must be 2-8 characters before the dot";
                            return false;
                        }
                        if (ext.length > 5 || ext.length < 2) {
                            document.getElementById("mailerr").innerHTML = "must be 2-5 characters after the dot";
                            return false;
                        }
                        else
                            document.getElementById("mailerr").innerHTML = "";
                    }
                    return true;
                }
            }
        var strength;
        function dateCheck(date) {
            var thistime = new Date();
            var year = thistime.getFullYear();
            var datearr = date.split('/');
            if (datearr.length != 3) {
                return false;
            }
            else if (parseInt(datearr[0]) > 31 || parseInt(datearr[0]) < 0) {
                return false;
            }
            else if (parseInt(datearr[1]) > 12 || parseInt(datearr[1]) < 0) {
                return false;
            }
            else if (parseInt(datearr[2]) > year || parseInt(datearr[2]) < 0) {
                return false;
            }
            else if (datearr[0].length != 2 || datearr[1].length != 2 || datearr[2].length != 4) {
                return false;
            }
            return true;
        }
        function masterCheck() {
            var userId = document.getElementById("userId");
            var password = document.getElementById("password");
            var passwordconfirm = document.getElementById("confirmpass");
            var email = document.getElementById("email");
            var radio1 = document.getElementById("radio1");
            var radio2 = document.getElementById("radio2");
            var date = document.getElementById("date");
            var checkbox = document.getElementById("checkbox");
            var select = document.getElementById("Starter");
            var usergood = usercheck(userId);
            var passgood = passcheck(password, passwordconfirm);
            var emailgood = emailcheck(email.value);
            var checkboxgood;
            if (checkbox.checked) {
                checkboxgood = true;
                checkboxerr.innerHTML = "";
            }
            else
                checkboxerr.innerHTML = "you must check this";
            var dategood;
            if (dateCheck(date.value)) {
                dategood = true;
                dateerr.innerHTML = "";
            }
            else {
                dateerr.innerHTML = "enter date of birth correctly (dd/mm/yyyy), full year only";
                dategood = false;
            }
            var sexgood;
            if (radio1.checked || radio2.checked) {
                sexgood = true;
                sexerr.innerHTML = "";
            }
            else
                sexerr.innerHTML = "enter sex";
            if (strength == -10) {
                myimg.src = "tooweak.png";
            }
            else if (strength == 0) {
                myimg.src = "weak.png";
            }
            else if (strength == 5) {
                myimg.src = "ok.png";
            }
            else if (strength == 8)
            {
                myimg.src = "strong.png";
            }
            else if (strength == 10)
            {
                myimg.src = "wow.png";
            }
            else {
                myimg.src = "password meter.png";
            }
            if (usergood && passgood && emailgood && checkboxgood && dategood && sexgood) {
                return true;
            }
            else
            {
                return false;
            }
        }
        function usercheck(userId)
        {
            if (userId.value == "")
            {
                document.getElementById("usererr").innerHTML = "<font style='color:red'>please enter username</font>";
                return (false);
            }
            else if(userId.value.length < 6 )
            {
                document.getElementById("usererr").innerHTML = "<font style='color:red'>username too short</font>";
                return (false);
            }
            else
            {
                document.getElementById("usererr").innerHTML = "&nbsp";
            }
            return (true);
        }
        function passcheck(password, passwordconfirm) {
            re = /[a-z]/;
            re2 = /[A-Z]/;
            re3 = /[!-&#47]/;
            re4 = /[:-@]/;
            re5 = /[1-9]/;
            if (password.value == "") {
                strength = -10;
                document.getElementById("passerr").innerHTML = "<font style='color:red'>Please enter password</font>"
                return false;
            }
            else if (password.value.length < 8) {
                strength = -10;
                document.getElementById("passerr").innerHTML = "<font style='color:red'>password too short</font>";
                return false;
            }
            else
                document.getElementById("passerr").innerHTML = "";
            if (password.value != passwordconfirm.value) {
                strength = -10;
                document.getElementById("passconfirmerr").innerHTML = "<font style='color:red'>passwords don't match</font>";
                return false;
            }
            else {
                document.getElementById("passconfirmerr").innerHTML = "";
            }
            if (password.value.toUpperCase() == password.value.toLowerCase()) {
                document.getElementById("passerr").innerHTML = "<font style='color:green'>add lower case or upper case letters</font>";
                strength = 0;
            }
            else if (!re5.test(password.value)) {
                document.getElementById("passerr").innerHTML = "<<font style='color:green'>add numbers</font>";
                strength = 0;
            }
            else if (!re.test(password.value) && !re2.test(password.value)) {
                strength = 5;
                document.getElementById("passconfirmerr").innerHTML = "<font style='color:green'>mix lower case letters and upper case letters</font>";
            }
            else if (!re3.test(password.value) && !re4.test(password.value)) {
                strength = 8;
                document.getElementById("passerr").innerHTML = "<font style='color:green'>add symobls (@!#$)</font>";
            }
            else {
                strength = 10;
                document.getElementById("passconfirmerr").innerHTML = "";
            }
            return true;
        }
            

        </script>
    
    </asp:content>
<script runat="server">
    bool IsExist(string username)
    {
        string ConString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True";
        SqlConnection conn = new SqlConnection(ConString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM mytable WHERE username=@USERNAME", conn);
        cmd.Parameters.AddWithValue("@USERNAME",username);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            Response.Redirect("err403.aspx");
            Response.End();
        }
        if (Request.Form["submit"] != null)
        {
            string username = Request.Form["username"];
            string password = Request.Form["password"];
            string email = Request.Form["email"];
            string date = Request.Form["date"];
            try
            {
                DateTime c = Convert.ToDateTime(date);
                string sqlFormattedDate = c.Date.ToString("yyyy-MM-dd");
                string sex1 = Request.Form["radio"];
                string select = Request.Form["Select"];
                if (IsExist(username))
                {
                    Session["err"] = "duplicate name";
                }
                else
                {
                    string ConString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True";
                    SqlConnection conn = new SqlConnection(ConString);
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        string[] name = Request.Form.AllKeys;
                        string comstr = "INSERT INTO mytable(username, password, email, sex,dob, starter) VALUES (@userid, @password, @email, @sex,@dob, @starter)";
                        cmd.Parameters.AddWithValue("@userid", username);
                        cmd.Parameters.AddWithValue("@password", password);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@sex", sex1);
                        cmd.Parameters.AddWithValue("@starter", select);
                        cmd.Parameters.AddWithValue("@dob", sqlFormattedDate);
                        cmd.CommandType = System.Data.CommandType.Text;
                        cmd.CommandText = comstr;
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            Session["err"] = "Success!";
                        }
                        else
                        {
                            Response.Redirect("signup.aspx");
                        }
                    }
                    conn.Close();

                }
            }
            catch
            {
            }

        }

    }
</script>