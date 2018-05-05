<%@ Page Title="" Language="C#" MasterPageFile="~/AsherStuff/MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    string str = " ";
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (Session["Login"].ToString() != "admin")
        //{
        //    Response.Redirect("Err.aspx");
        //    Response.End();
        //}        
        

        if (Request.Form["btn"] != null)
        {
            str = " <div class='container'><table class='table'><tr><td>שם משתמש</td><td>סיסמה</td><td>גיל</td></tr>";

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
                    str += "<tr><td>" + dr["name"] + "</td><td>" + dr["email"] + "</td><td>" + dr["password"] + "</td><td>" + dr["birthdate"] + "</td><td>" + dr["country"] + "</td><td>" + dr["gender"] + "</td><td>" + dr["gender"] + "</td><td>" + dr["metal_gener"] + "</td></tr>";
                }
                str += "</table></div>";
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

