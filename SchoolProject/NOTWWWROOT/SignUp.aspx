﻿<%@ Page Title="" Language="C#" MasterPageFile="~/NOTWWWROOT/MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    bool IsExists(string email)
    {
        using (var connection = SqlUtil.CreateCon())
        {
            var cmd = new SqlCommand(string.Format("SELECT * FROM Users WHERE (email = N'{0}')", email), connection);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
                return true;
            connection.Close();
            return false;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["err"] = "";
        if (Request.Form["Register"] != null)
        {
            string name = Request.Form["firstName"];
            string email = Request.Form["email"];
            string password = Request.Form["password"];
            string birthdate = Request.Form["birthDate"];
            string country = Request.Form["country"];
            string gender = Request.Form["gender"];
            string gener = "";
            if (Request.Form["deathMetal"] != null)
            {
                gener += "DeathMetal";
            }
            if (Request.Form["powerMetal"] != null)
            {
                gener += "PowerMetal";
            }
            if (Request.Form["heavyMetal"] != null)
            {
                gener += "HeavyMetal";
            }

            if (IsExists(email))
            {
                Session["errEmail"] = "Email Already Taken";
            }
            else
            {
                using (var connection = SqlUtil.CreateCon())
                {
                    var cmdString = string.Format("INSERT  INTO Users(name, email, password, birthdate, country, gender, metal_gener) VALUES( N'{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}', N'{6}')", name, email, password, birthdate, country, gender, gener);
                    SqlCommand cmd = new SqlCommand(cmdString, connection);
                    cmd.ExecuteNonQuery();
                    connection.Close();
                    Session["err"] = "You Have Successfully Registered";
                    Session["errEmail"] = "";
                }
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container jumbotron">
            <form novalidate="novalidate" class="form-horizontal" role="form" onsubmit="return MasterCheck()" action="SignUp.aspx" method="post">
                <h2>Registration Form</h2>

                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">First Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" name="firstName" placeholder="First Name" class="form-control">
                        <span class="help-block" id="errFirstName"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email" id="email" name="email" placeholder="Email" class="form-control">
                        <span class="help-block" id="errEmail"><%=Session["errEmail"]%></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" name="password" placeholder="Password" class="form-control">
                        <span class="help-block" id="errPassword"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password</label>
                    <div class="col-sm-9">
                        <input type="password" id="passwordConfirm" placeholder="Confirm Password" class="form-control">
                        <span class="help-block" id="errPasswordConfirm"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="birthDate" class="col-sm-3 control-label">Date of Birth</label>
                    <div class="col-sm-9">
                        <input type="date" id="birthDate" name="birthDate" class="form-control">
                        <span class="help-block" id="errBirthDate"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="country" class="col-sm-3 control-label">Country</label>
                    <div class="col-sm-9">
                        <select id="country" name="country" class="form-control">
                            <option value="0">Choose a country</option>
                            <option value="Afghanistan">Afghanistan</option>
                            <option value="Bahamas">Bahamas</option>
                            <option value="Cambodia">Cambodia</option>
                            <option value="Denmark">Denmark</option>
                            <option value="Ecuador">Ecuador</option>
                            <option value="Fiji">Fiji</option>
                            <option value="Gabon">Gabon</option>
                            <option value="Haiti">Haiti</option>
                        </select>
                        <span class="help-block" id="errCountry"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3">Gender</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="female" value="female">Female
                                </label>
                            </div>

                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="male" value="male">Male
                                </label>
                            </div>

                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="unknown" value="unknown">Unknown
                                </label>
                            </div>
                        </div>
                        <span class="help-block" id="errGender"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3">What metal geners do you enjoy</label>
                    <div class="col-sm-9">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="heavyCheckbox" value="heavyMetal" name="heavyMetal">Heavy
                            </label>
                        </div>

                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="powerCheckbox" value="powerMetal" name="powerMetal">Power
                            </label>
                        </div>

                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="deathCheckbox" value="deathMetal" name="deathMetal">Death
                            </label>
                        </div>
                        <span class="help-block" id="errMetalGener"></span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <div class="checkbox">
                            <div class="checkbox">
                            <label>
                                <input type="checkbox" id="terms">I accept <a href="https://www.wikihow.com/Be-Human">terms</a>
                            </label>
                        </div>
                        <span class="help-block" id="errTerms"></span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <input type="submit" class="btn btn-primary" value="Register" name="Register">
                        <span class="help-block"><%=Session["err"]%></span>
                    </div>
                </div>
            </form>
     </div>


    <script type="text/javascript">
        function CheckUserName() {
            var n = document.getElementById("firstName").value
            if (n == "") {
                document.getElementById("errFirstName").innerHTML = "must enter a name"
                return false
                }
            else if (n.length < 2) {
                document.getElementById("errFirstName").innerHTML = "name must be longer then one letter"
                return false
            }
            else if (/[^a-zA-Z]/.test(n)) {
                document.getElementById("errFirstName").innerHTML = "name must contain only english letters"
                return false
            }
            else {
                document.getElementById("errFirstName").innerHTML = ""
            }
            return true
        }
        function CheckEmail() {
            var n = document.getElementById("email").value
            if (n == "") {
                document.getElementById("errEmail").innerHTML = "must enter a email"
                return false
            }
            else if (/[^a-zA-Z0-9$&+,:;=?@#|'<>.^*()%!-]/.test(n)) {
                document.getElementById("errEmail").innerHTML = "email must contain only english letters numbers and spacial characters"
            }
            else if (n.split("@").length != 2) {
                document.getElementById("errEmail").innerHTML = "must be excecly one @"
                return false
            }
            else if (n.split("@")[0] == "") {
                document.getElementById("errEmail").innerHTML = "must enter a character before @"
                return false
            }
            else if (/[^a-zA-Z]/.test(n.split("@")[1].split(".")[0])) {
                document.getElementById("errEmail").innerHTML = "must enter proper @address"
                return false
            }
            else if (n.split("@")[1].indexOf(".") == -1 || n.split("@")[1].indexOf(".") < 2) {
                document.getElementById("errEmail").innerHTML = "must have a dot after at least 2 character after the @"
                return false
            }
            else if (n.split("@")[1].split(".")[1].length < 2) {
                document.getElementById("errEmail").innerHTML = "must have at least 2 character after the dot"
                return false
            }
            else {
                document.getElementById("errEmail").innerHTML = ""
            }
            return true
        }
        function CheckPassword() {
            var n = document.getElementById("password").value
            if (n == "") {
                document.getElementById("errPassword").innerHTML = "must enter a password"
                return false
            }
            else if (n.match(document.getElementById("firstName").value)) {
                document.getElementById("errPassword").innerHTML = "password must not contain the user name"
                return false
            }
            else if (n.length < 6) {
                document.getElementById("errPassword").innerHTML = "must be at least 6 digits long"
                return false
            }
            else if (!(/[0-9]/.test(n))) {
                document.getElementById("errPassword").innerHTML = "must have at least 1 number"
                return false
            }
            else if (!(/[^0-9a-zA-Z]/.test(n))) {
                document.getElementById("errPassword").innerHTML = "must have at least 1 spacial character"
                return false
            }
            else {
                document.getElementById("errPassword").innerHTML = ""
            }
            return true
        }
        function CheckConfirmedPassword() {
            var n1 = document.getElementById("password").value
            var n2 = document.getElementById("passwordConfirm").value
            if (n2 == "") {
                document.getElementById("errPasswordConfirm").innerHTML = "must enter password confirmation"
                return false
            }
            else if (n1 != n2) {
                document.getElementById("errPasswordConfirm").innerHTML = "password must match"
                return false
            }
            else {
                document.getElementById("errPasswordConfirm").innerHTML = ""
            }
            return true
        }
        function CheckDate() {
            var year = new Date();
            var n = document.getElementById("birthDate").value.split("-");
            if (n == "") {
                document.getElementById("errBirthDate").innerHTML = "must enter a date"
                return false
            }
            else if (parseInt(n[2]) > 31) {
                document.getElementById("errBirthDate").innerHTML = "enter correct date"
                return false
            }
            else if (parseInt(n[1]) > 12) {
                document.getElementById("errBirthDate").innerHTML = "enter correct date"
                return false
            }
            else if (parseInt(n[0]) > year.getFullYear() && parseInt(n[0]) < 1900) {
                document.getElementById("errBirthDate").innerHTML = "enter correct date"
                return false
            }
            else if (parseInt(n[1]) == 2 && parseInt(n[2]) > 28) {
                document.getElementById("errBirthDate").innerHTML = "enter correct date"
                return false
            }
            else {
                document.getElementById("errBirthDate").innerHTML = ""
            }
            return true
        }
        function CheckCountry() {
            var n = document.getElementById("country").value
            if (n == "0") {
                document.getElementById("errCountry").innerHTML = "must choose a country"
                return false
            }
            else {
                document.getElementById("errCountry").innerHTML = ""
            }
            return true
        }
        function CheckGender() {
            var m = document.getElementById("male").checked
            var f = document.getElementById("female").checked
            var u = document.getElementById("unknown").checked
            if (m || f || u) {
                document.getElementById("errGender").innerHTML = ""
                return true
            }
            else {
                document.getElementById("errGender").innerHTML = "must choose a gender"
                return false
            }
        }
        function CheckMetalGener() {
            var cbh = document.getElementById("heavyCheckbox").checked
            var cbp = document.getElementById("powerCheckbox").checked
            var cbd = document.getElementById("deathCheckbox").checked
            if (cbh || cbp || cbd) {
                document.getElementById("errMetalGener").innerHTML = ""
                return true
            }
            else {
                document.getElementById("errMetalGener").innerHTML = "must check at least 1 checkbox"
                return false
            }
        }
        function CheckTerms() {
            var n = document.getElementById("terms").checked
            if (!n) {
                document.getElementById("errTerms").innerHTML = "must agree to terms"
                return false
            }
            else {
                document.getElementById("errTerms").innerHTML = ""
            }
            return true
        }
        function MasterCheck() {
            if (CheckUserName() && CheckEmail() && CheckPassword() && CheckConfirmedPassword() && CheckDate() && CheckCountry() && CheckGender() && CheckMetalGener() && CheckTerms()) {
               return true
            }
            return false
        }
    </script>
</asp:Content>