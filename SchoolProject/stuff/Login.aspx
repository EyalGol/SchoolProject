<%@ Page Title="" Language="C#" MasterPageFile="~/shifu.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<asp:content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form method="post" onclick="return('wronguser')">
        <h3>Username: </h3><input type="text" name="username"/>
        <h3>Password: </h3><input type="password" name="password" />
        <br />
        <% if (wronguser)
           {
               Response.Write("Wrong username/password combo <br/>");
           } %>
        <input type="submit" name="submit" />
    </form>
    </asp:content>
<asp:content ContentPlaceHolderID="Categories" runat="server">
            <ul>
<li><a href="#">Login</a></li>
        </ul>
    </asp:content>
<script runat="server">
    bool wronguser = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            Response.Redirect("AlreadyLoginError.aspx");
        }
        if (Request.Form["submit"] != null)
        {
            string cmdstr = "SELECT * FROM mytable ";
            string ConString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True";
            SqlConnection conn = new SqlConnection(ConString);
            conn.Open();
            SqlCommand mycomm = new SqlCommand(cmdstr, conn);
            string username = Request.Form["username"];
            string password = Request.Form["password"];
            DataSet usernameSet = new DataSet();
            SqlDataAdapter adapt = new SqlDataAdapter(mycomm);
            adapt.Fill(usernameSet, "mytable");
            conn.Close();
            bool foundusr = false;
            string sex = "";
            foreach (DataRow row in usernameSet.Tables[0].Rows)
            {
                if (row["username"].ToString() == username && row["password"].ToString() == password)
                {
                    foundusr = true;
                    sex = row["sex"].ToString();
                }
            }
            if (foundusr)
            {
                Session["username"] = username;
                Session["sex"] = sex;
                Response.Redirect("Default.aspx");
            }
            else
            {
                wronguser = true;
            }
            
            
        }
    }
</script>

<%-- Add content controls here --%>
