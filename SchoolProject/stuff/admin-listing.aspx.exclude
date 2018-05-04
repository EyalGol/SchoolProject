<%@ Page Title="" Language="C#" MasterPageFile="~/shifu.master" Debug="true" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    string Where = "";
    string Where2 = "";
    public string printstr = "";
    public bool WorkDone = false;
    protected void Delete(string username)
    {
        string cmdstr = "DELETE FROM mytable WHERE username=@USERNAME";
        string ConString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True";
        SqlConnection conn = new SqlConnection(ConString);
        conn.Open();
        SqlCommand mycomm = new SqlCommand(cmdstr, conn);
        mycomm.Parameters.AddWithValue("@USERNAME", username);
        int affect = mycomm.ExecuteNonQuery();
        if (affect > 0)
        {
            Response.Redirect("admin-listing.aspx");
        }
        else
            Response.Redirect("Default.aspx");
    }
    protected void Page_Load(object Source, EventArgs e)
    {

        if ((string)Session["username"] != "Admin")
        {
            Response.Redirect("err403.aspx");
            Response.End();
        }
        if (Request.Form["submit"] != null)
        {
            /*switch (int.Parse(Request.Form["select"]))
            {
                case 1:
                    Select = "*";
                    break;
                case 2:
                    Select = "password";
                    break;
                case 3:
                    Select = "email";
                    break;
                case 4:
                    Select = "sex";
                    break;
                case 5:
                    Select = "dob";
                    break;
                case 6:
                    Select = "starter";
                    break;
                default:
                    Select = "*";
                    break;
            }*/
            switch (int.Parse(Request.Form["Where"]))
            {
                default: Where = "";
                    break;
                case 1:
                    Where = "WHERE sex='male'";
                    break;
                case 2:
                    Where = "WHERE sex='female'";
                    break;
                case 3:
                    Where = "WHERE dob <= '1998-01-01'";
                    break;
                case 4:
                    Where = "WHERE dob >= '1998-01-01'";
                    break;
                case 5:
                    Where = "WHERE username LIKE '"+ Request.Form["text"].ToString() + "%'";
                    break;
                case 6:
                    Where = "WHERE starter=1";
                    break;
                case 7: Where = "WHERE username LIKE '%" + Request.Form["text"].ToString() + "'";
                    break;
            }
            if (Request.Form["Where2"] != null)
            {
                switch (int.Parse(Request.Form["Where2"]))
                {
                    default: Where2 = "";
                        break;
                    case 1:
                        Where2 = "AND sex='male'";
                        break;
                    case 2:
                        Where2 = "AND sex='female'";
                        break;
                    case 3:
                        Where2 = "AND dob <= '1998-01-01'";
                        break;
                    case 4:
                        Where2 = "AND dob >= '1998-01-01'";
                        break;
                    case 5:
                        Where2 = "AND username LIKE '" + Request.Form["text2"].ToString() + "%'";
                        break;
                    case 6:
                        Where2 = "AND starter=1";
                        break;
                    case 7: Where2 = "AND username LIKE '%" + Request.Form["text2"].ToString() + "'";
                        break;
                }
            }

            string cmdstr = "SELECT * FROM mytable " + Where + Where2;
;
            string ConString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True";
            SqlConnection conn = new SqlConnection(ConString);
            conn.Open();
            SqlCommand mycomm = new SqlCommand(cmdstr, conn);
            DataSet mySet = new DataSet();
            SqlDataAdapter adapt = new SqlDataAdapter(mycomm);
            adapt.Fill(mySet, "mytable");
            conn.Close();
            printstr = printstr + "<table border=1><tr><td>Username</td><td>password</td><td>email</td><td>sex</td><td>dob</td><td>starter</td></tr>";
            foreach (DataRow row in mySet.Tables[0].Rows)
            {
                printstr = printstr + "<tr>";
                printstr = printstr + "<td>" + row["username"] + "</td><td>" + row["password"] + "</td><td>" + row["email"] + "</td><td>" + row["sex"] + "</td><td>" + row["dob"] + "</td><td>" + row["starter"] + "</td>";
                printstr = printstr + "<td><button name='deletebuttons' type=submit value='" + row["username"].ToString() + "'>Delete</button></td>";
                printstr = printstr + "</tr>";
            }
            printstr = printstr + "</table>";
            WorkDone = true;
        }
        if (Request.Form["deletebuttons"] != null)
        {
            Delete(Request.Form["deletebuttons"].ToString());
        }
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form method=post>
        <!--
    <select name="select">s
        <option value="1">All</option>
        <option value="7">Username</option>
        <option value="2">Password</option>
        <option value="3">Email</option>
        <option value="4">Sex</option>
        <option value="5">Date</option>
        <option value="6">Starter</option>
        
    </select>
            -->
            <script type="text/javascript">
                function Change() {
                    if (document.getElementById("where1").value != "0") {
                        var e = document.getElementById("where2");
                        e.removeAttribute("disabled");
                    }
                }
            </script>
    <select name="Where" onchange="Change()" id="where1">
        <option value="0">All</option>
        <option value="1">Male Only</option>
        <option value="2">Female Only</option>
        <option value="3">Over 18</option>
        <option value="4">Under 18</option>
        
        <option value="6">Starter is bulbasaur</option>
        <option value="5">Username starts with</option>
        <option value="7">Username ends with</option>
    </select>
    <input type="text" maxlength=1 name="text" />
    <select name="Where2" id="where2" disabled="disabled">
        <option value="0">All</option>
        <option value="1">Male Only</option>
        <option value="2">Female Only</option>
        <option value="3">Over 18</option>
        <option value="4">Under 18</option>
        
        <option value="6">Starter is bulbasaur</option>
        <option value="5">Username starts with</option>
        <option value="7">Username ends with</option>
    </select>
     <input type="text" maxlength=1 name="text2" />
    <input type=submit name=submit value='populate'/>
    <%if (WorkDone)
  {
          
      Response.Write(printstr);
  }
    %>
    </form>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Categories" Runat="Server">
    <ul>
<li><a href="admin.aspx">Admin</a></li>
<li><a href="admin-listing.aspx">User Listing</a></li>
        <li><a href="admin-statistics.aspx">Stats</a></li>

</ul>
</asp:Content>

