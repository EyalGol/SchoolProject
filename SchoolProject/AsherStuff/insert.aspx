<%@ Page Title="" Language="C#" MasterPageFile="~/AsherStuff/MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    bool IsExists(string name)
    {

        bool b = false;
        // מחרוזת החיבור 
        string connString = @"Data Source=.;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        // אובייקט קישור המקבל כפרמטר את מחרוזת הקישור 
        SqlConnection conn = new SqlConnection(connString);
        //  מחרוזת הוראה לביצוע 
        string cmdString = string.Format("SELECT * FROM UserTbl WHERE (UserName = N'{0}')", name);
        // אובייקט פקודה המקבל כקלט את ההוראה לביצוע ואת אובייקט הקישור 
        SqlCommand cmd = new SqlCommand(cmdString, conn);
        // פתיחת קשר 
        conn.Open();
        //  הפעלת הפקודה ויצירת דאטה רידר 
        SqlDataReader dr = cmd.ExecuteReader();
        // אם יש שורות בדאטה רידר המשמעות שיש שם כזה 
        if (dr.HasRows)
            b = true;
        // סגור קשר 
        conn.Close();
        // החזר ערך 
        return b;
    }
    
    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.Form["sub"] != null)
        {
            
            
            string userName = Request.Form["txt"];
            string pass = Request.Form["pas"];
            int age = int.Parse(Request.Form["age"]);

            if (IsExists(userName))
            {
                Session["err"] = "שם כפול ";

            }
            else
            {
                string conStr = @"Data Source=.;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                string cmdStr = string.Format("INSERT INTO UserTbl (UserName, Pass, Age) VALUES  (N'{0}', N'{1}', {2})", userName, pass, age);
                SqlConnection conObj = new SqlConnection(conStr);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                conObj.Open();
                cmdObj.ExecuteNonQuery();
                conObj.Close();
                Session["err"] = "נרשמת בהצלחה ";
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<center>
  <form  action="insert.aspx" method="post">
     <table>
     
      <tr> <td><input type="text" name="txt" /></td> <td>רשום שם </td> </tr>
       <tr> <td><input type="text" name="pas" /></td><td>רשום  סיסמה </td> </tr>
        <tr> <td><select name="age"><option value="10">10</option><option value="11">11</option><option value="12">12</option></select></td><td>בחר גיל  </td></tr>
     </table>
  <input type="submit" name="sub" value="שלח" />
  <br />
  <span style="background-color:Yellow; color:Red"><%=Session["err"] %></span>
    </form>
</center>
</asp:Content>

