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
            int age = int.Parse(Request.Form["age"].ToString());
            string pass = Request.Form["pass"].ToString();
            string conStr = @"Data Source=.;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
            string cmdStr = string.Format("SELECT  UserName, Pass, Age FROM   UserTbl Where age = {0} AND pass = '{1}'",age, pass);
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
 <form  action="SelectByAgeAndPass.aspx" method="post">
 <select name="age">
 <option>10</option>
  <option>11</option>
   <option>12</option>
 </select>
 <input type="text" name="pass" />
     <input type="submit" value="הצג " name="btn" />
    </form>
  
  <%=str %>
  </center>
</asp:Content>

