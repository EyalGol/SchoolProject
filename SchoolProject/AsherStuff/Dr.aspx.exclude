<%@ Page Title="" Language="C#" MasterPageFile="~/AsherStuff/MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    string str = " ";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Login"].ToString() != "admin")
        {
            Response.Redirect("Err.aspx");
            Response.End();
        }        
        

        if (Request.Form["btn"] != null)
        {
            str = " <table border='1'><tr><td>שם משתמש</td><td>סיסמה</td><td>גיל</td></tr>";

            string conStr = @"Data Source=.;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
            string cmdStr = "SELECT  UserName, Pass, Age FROM   UserTbl ORDER BY Pass ";
            SqlConnection conObj = new SqlConnection(conStr);
            SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);

            conObj.Open();
            SqlDataReader dr = cmdObj.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    str += "<tr><td>" + dr["username"] + "</td><td>" + dr["pass"] + "</td><td>" + dr["age"] + "</td></tr>";
                }
                str += "</table>";
            }
            else
            {
                str = "אין רשומות להצגה ";
            }
            conObj.Close();
        }

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<center>
 <form  action="Dr.aspx" method="post">
     <input type="submit" value="הצג " name="btn" />
    </form>
  
  <%=str %>
  </center>
</asp:Content>

