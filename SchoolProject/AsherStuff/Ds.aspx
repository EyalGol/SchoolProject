<%@ Page Title="" Language="C#" MasterPageFile="~/AsherStuff/MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    string str = " ";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["login"] == "אורח")
            Response.Redirect("Err.aspx");
                    
        if (Request.Form["btn"] != null)
        {
            str = " <table border='1'><tr><td>שם משתמש</td><td>סיסמה</td><td>גיל</td></tr>";

            string conStr = @"Data Source=.;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
            string cmdStr = "SELECT  UserName, Pass, Age FROM   UserTbl";

            SqlDataAdapter da = new SqlDataAdapter(cmdStr, conStr);
            DataSet ds = new DataSet();
            da.Fill(ds);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                str += "<tr><td>" + ds.Tables[0].Rows[i]["username"] + "</td><td>" + ds.Tables[0].Rows[i]["pass"] + "</td><td>" + ds.Tables[0].Rows[i]["age"] + "</td></tr>";
            }
            str += "</table>";

        }

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<center>
 <form  action="Ds.aspx" method="post">
     <input type="submit" value="הצג " name="btn" />
    </form>
  
  <%=str %>
  </center>
</asp:Content>

