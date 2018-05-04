<%@ Page Title="" Language="C#" MasterPageFile="~/AsherStuff/MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
     
            if (Session["Login"].ToString() != "admin")
            {
                Response.Redirect("Err.aspx");
                Response.End();
            }
        
        if (Request.Form["sub"] != null)
        {
        //    if (Session["Login"] == "
            string userName = Request.Form["UserName"];
            string conStr = @"Data Source=.;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
            string cmdStr = string.Format("DELETE FROM UserTbl WHERE UserName=N'{0}'", userName);
            SqlConnection conObj = new SqlConnection(conStr);
            SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
            conObj.Open();
            cmdObj.ExecuteNonQuery();
            conObj.Close();
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <center><form action="Delete.aspx" method="post">
<input type="text" name="UserName"/>הקש שם משתמש למחיקה<br />
<input type="submit" name="sub" value="Delete" />
</form></center>
</asp:Content>

