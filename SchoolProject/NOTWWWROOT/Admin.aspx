<%@ Page Title="" Language="C#" MasterPageFile="~/NOTWWWROOT/MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    string str = " ";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["name"].ToString() != "Admin")
        {
            Response.Redirect("HomePage.aspx");
            Response.End();
        }

        if (Request.Form["btn"] != null)
        {
            str = "<table class='table table-bordered'><tr><th>id</th><th>name</th><th>email</th><th>pass</th><th>birthdate</th><th>country</th><th>gender</th><th>metal_gener</th></tr>";
            using(var connection = SqlUtil.CreateCon())
            {
                string cmdStr = "SELECT * FROM Users ORDER BY name";
                SqlCommand cmdObj = new SqlCommand(cmdStr, connection);
                SqlDataReader dr = cmdObj.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        str += "<tr><td>" + dr["id"] + "</td><td>" + dr["name"] + "</td><td>" + dr["email"] + "</td><td>" + dr["password"] + "</td><td>" + dr["birthdate"] + "</td><td>" + dr["country"] + "</td><td>" + dr["gender"] + "</td><td>" + dr["metal_gener"] + "</td></tr>";
                    }
                    str += "</table>";
                }
                else
                {
                    str = "No Rows";
                }
                connection.Close();
            }
        }

        if (Request.Form["btn1"] != null)
        {
            str = "<table class='table table-bordered'><tr><th>id</th><th>name</th><th>email</th><th>pass</th><th>birthdate</th><th>country</th><th>gender</th><th>metal_gener</th></tr>";
            string country = Request.Form["country"];
            using(var connection = SqlUtil.CreateCon())
            {
                string cmdStr = string.Format("SELECT * FROM Users Where country = N'{0}'",country);
                SqlCommand cmdObj = new SqlCommand(cmdStr, connection);
                SqlDataReader dr = cmdObj.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        str += "<tr><td>" + dr["id"] + "</td><td>" + dr["name"] + "</td><td>" + dr["email"] + "</td><td>" + dr["password"] + "</td><td>" + dr["birthdate"] + "</td><td>" + dr["country"] + "</td><td>" + dr["gender"] + "</td><td>" + dr["metal_gener"] + "</td></tr>";
                    }
                    str += "</table>";
                }
                else
                {
                    str = "No Rows";
                }
                connection.Close();
            }
        }

        if (Request.Form["btn2"] != null)
        {
            str = "<table class='table table-bordered'><tr><th>id</th><th>name</th><th>email</th><th>pass</th><th>birthdate</th><th>country</th><th>gender</th><th>metal_gener</th></tr>";
            string country= Request.Form["country"];
            string gender = Request.Form["gender"];
            string cmdStr = string.Format("SELECT * FROM Users Where country = N'{0}' AND gender = N'{1}'",country, gender);
            using(var connection = SqlUtil.CreateCon())
            {
                SqlCommand cmdObj = new SqlCommand(cmdStr, connection);
                SqlDataReader dr = cmdObj.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        str += "<tr><td>" + dr["id"] + "</td><td>" + dr["name"] + "</td><td>" + dr["email"] + "</td><td>" + dr["password"] + "</td><td>" + dr["birthdate"] + "</td><td>" + dr["country"] + "</td><td>" + dr["gender"] + "</td><td>" + dr["metal_gener"] + "</td></tr>";
                    }
                    str += "</table>";
                }
                else
                {
                    str = "No Rows";
                }
                connection.Close();
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
    <form  action="Admin.aspx" method="post">
        <br/>
        <br/>
        <div class="row col-centered">
          <div class="col-sm">
            <input class="btn btn-dark" type="submit" value="Show by 1 factor" name="btn1" />
          </div>
          <div class="col-sm">
            <input class="btn btn-dark" type="submit" value="Show All" name="btn" />
            <hr />
            <input class="input-group" type="text" name="country" placeholder="Country"/>
            <input class="input-group" type="text" name="gender" placeholder="Gender"/>
          </div>
          <div class="col-sm">
            <input class="btn btn-dark" type="submit" value="Show by 2 factors" name="btn2" />
          </div>
        </div>
    </form>
    <hr />
    <%=str %>
</div>
</asp:Content>

