<%@ Page Title="" Language="C#" MasterPageFile="~/AsherStuff/MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    public static bool IsExist(string username, string pass)
    {
        bool flag = false;

        string conStr = @"Data Source=.;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        SqlConnection conObj = new SqlConnection(conStr);
        string cmdStr = string.Format("SELECT * FROM UserTbl WHERE UserName=N'{0}' AND Pass=N'{1}'", username, pass);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();
       
        if (dr.HasRows)
            flag = true;
        
        conObj.Close();
        return flag;
            
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["sub"] != null)
        {
            string user = Request.Form["username"];
            string pass = Request.Form["pass"];

            if (IsExist(user, pass))// האם משתמש קיים 
            {
                Session["Login"] = user;// עדכון שם מש,NA 
                
            }
            else
            {
                Response.Redirect("insert.aspx");
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <center>
  
<form action="Login.aspx" method="post">
    <table> 
        <tr><td><input type="text" name="username" /></td><td>שם משתמש</td></tr> 
        <tr><td><input type="password" name="pass" /></td><td>סיסמה</td></tr>
    </table>
        <input type="submit" value="התחבר" name="sub" />
    </form>
</center>
</asp:Content>

