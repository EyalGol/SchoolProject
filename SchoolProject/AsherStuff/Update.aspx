<%@ Page Title="" Language="C#" MasterPageFile="~/AsherStuff/MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    string pass;
    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Login"] == "אורח")
        {
            Response.Redirect("login.aspx");
            Response.End();
        }
        else
        {
            string conStr = @"Data Source=.;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
            string cmdStr; // קדימה
            if (Request.Form["sub"] != null)
            {
                pass = Request.Form["pas"];
                string age = Request.Form["age"];
                cmdStr = string.Format("UPDATE UserTbl SET Pass=N'{0}', Age={1} WHERE Username=N'{2}'", pass, age, Session["Login"]);
                SqlConnection conObj = new SqlConnection(conStr);
                SqlCommand cmd = new SqlCommand(cmdStr, conObj);
                conObj.Open();
                cmd.ExecuteNonQuery();
                conObj.Close();
            }
            cmdStr = string.Format("SELECT  UserName, Pass, Age FROM   UserTbl WHERE UserName = N'{0}'", Session["Login"]);
            SqlDataAdapter da = new SqlDataAdapter(cmdStr, conStr);
            DataSet ds = new DataSet();
            da.Fill(ds);
            pass = ds.Tables[0].Rows[0]["Pass"].ToString();
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<center>
<form  action="Update.aspx" method="post">
     <table>
         <tr>
            <td><input type="text" name="txt" value="<%=Session["Login"] %>" disabled="disabled" /></td> 
            <td>רשום שם </td> 
         </tr>
         <tr> 
            <td><input type="text" name="pas" value="<%=pass %>"/></td>
            <td>רשום  סיסמה </td> 
         </tr>
        <tr> 
            <td>
                <select name="age">
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
            </td>
            <td>בחר גיל</td>
        </tr>
     </table>
     <input type="submit" name="sub" value="שלח" />
</form>
</center>

</asp:Content>

