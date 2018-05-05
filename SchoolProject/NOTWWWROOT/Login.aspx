<%@ Page Title="" Language="C#" MasterPageFile="~/NOTWWWROOT/MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    public static bool IsExist(string email, string password)
    {
        bool flag = false;
        using(var connection = SqlUtil.CreateCon())
        {
        SqlCommand cmd = new SqlCommand(string.Format("SELECT * FROM Users WHERE email=N'{0}' AND password=N'{1}'", email, password), connection);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
            flag = true;
        connection.Close();
        return flag;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["sub"] != null)
        {
            string email = Request.Form["email"];
            string pass = Request.Form["password"];

            if (IsExist(email, pass))
            {
                Session["name"] = email;

            }
            else
            {
                Response.Redirect("insert.aspx");
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container jumbotron">
            <form novalidate="novalidate" class="form-horizontal" role="form" onsubmit="return MasterCheck()" action="SignUp.aspx" method="post">
                <h2>Sing In</h2>

                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email" id="email" name="email" placeholder="Email" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label" onblur="return CheckPassword()">Password</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" name="password" placeholder="Password" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <input type="submit" class="btn btn-primary" value="Login" name="Login">
                    </div>
                </div>
            </form>
     </div>
</asp:Content>