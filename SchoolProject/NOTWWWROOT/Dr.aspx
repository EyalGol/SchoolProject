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

            string conStr = @"AttachDbFilename=E:\SchoolProject\SchoolProject\App_Data\Database.mdf;Integrated Security=True;Connect Timeout=1;Trusted_Connection=Yes;";
            string cmdStr = "SELECT * FROM Users ORDER BY name";
            SqlConnection conObj = new SqlConnection(conStr);
            SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);

            conObj.Open();
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
            conObj.Close();
        }

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
    <form  action="Dr.aspx" method="post">
        <br/>
        <br/>
        <div class="row">
            <div class="col-xs-4">

            </div>
            <div class="col-xs-4">
                <input class="btn btn-dark" type="submit" value="Show " name="btn" />
            </div>
            <div class="col-xs-4">

            </div>
        </div>
    </form>
    <%=str %>
</div>
</asp:Content>

