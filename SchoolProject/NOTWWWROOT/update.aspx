<%@ Page Title="" Language="C#" MasterPageFile="~/NOTWWWROOT/MasterPage.master" %>
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
        if ((string)(Session["name"]) == "Login")
        {
            Response.Redirect("HomePage.aspx");
        }
        else if (Request.Form["Update"] != null)
        {
            string email = Request.Form["email"];
            string password = Request.Form["password"];
            if (IsExists(email))
            {
                Session["errEmail"] = "Email Already Taken";
            }
            else
            {
                using (var connection = SqlUtil.CreateCon())
                {
                    SqlCommand cmd1;
                    if (email != null)
                    {
                        cmd1 = new SqlCommand(string.Format("UPDATE Users SET email = N'{0}', password = N'{1}'  WHERE email = N'{2}'", email, password, Session["name"]), connection);
                        cmd1.ExecuteNonQuery();
                        Session["err"] = "You Have Successfully Updated";
                    }
                    if (password != null)
                    {
                        cmd1 = new SqlCommand(string.Format("UPDATE Users SET password = N'{0}' WHERE email = N'{1}'", password, Session["name"]), connection);
                        cmd1.ExecuteNonQuery();
                        Session["err"] = "You Have Successfully Updated";
                    }
                    if (password == null && email == null)
                    {
                        Session["err"] = "Please enter information";
                    }
                    connection.Close();
                    Session["errEmail"] = "";
                }
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container jumbotron">
            <form novalidate="novalidate" class="form-horizontal" role="form" onsubmit="return MasterCheck()" action="Update.aspx" method="post">
                <h2>Update</h2>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">NEW Email</label>
                    <div class="col-sm-9">
                        <input type="email" id="email" name="email" placeholder="Email" class="form-control">
                        <span class="help-block" id="errEmail"><%=Session["errEmail"]%></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">NEW Password</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" name="password" placeholder="Password" class="form-control">
                        <span class="help-block" id="errPassword"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">NEW Password</label>
                    <div class="col-sm-9">
                        <input type="password" id="passwordConfirm" placeholder="Confirm Password" class="form-control">
                        <span class="help-block" id="errPasswordConfirm"></span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <input type="submit" class="btn btn-primary" value="Update" name="Update">
                        <span class="help-block"><%=Session["err"]%></span>
                    </div>
                </div>
            </form>
     </div>

    <script type="text/javascript">
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
            if (n1 != n2) {
                document.getElementById("errPasswordConfirm").innerHTML = "password must match"
                return false
            }
            else {
                document.getElementById("errPasswordConfirm").innerHTML = ""
            }
            return true
        }
        function MasterCheck() {
            if (CheckEmail() && CheckPassword() && CheckConfirmedPassword()) {
               return true
            }
            return false
        }
    </script>
</asp:Content>