<%@ Page Title="" Language="C#" MasterPageFile="~/NOTWWWROOT/MasterPage.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    string result = "";
    protected void Page_Load(object sender, EventArgs e)
    {


        using (var connection = SqlConnectionUtil.Create())
        {
            var cmdStr = string.Format("INSERT  INTO Users(name, password) VALUES( N'{0}', N'{1}') ", "asher", "1234");
            SqlCommand cmd = new SqlCommand(cmdStr, connection);
            cmd.ExecuteNonQuery();
           
            //using (var da = new SqlDataAdapter(cmdStr1, connection))
            //{
            //    using (DataSet ds = new DataSet())
            //    {
            //        da.Fill(ds);
            //        //var pass = ds.Tables[0].Rows[0]["Pass"].ToString();
            //    }
            //    
            //}
            SqlCommand cmd1 = new SqlCommand("SELECT * FROM Users", connection);
            using(SqlDataReader dr = cmd1.ExecuteReader())
            {
                if (dr.HasRows)
                {
                     result += "<table>";
                    while (dr.Read())
                    {
                        result += "<tr><td>" + dr["name"] + "</td><td>" + dr["password"] + "</td></tr>";
                    }
                    result += "</table>";
                }
                else
                {
                    result = "אין רשומות להצגה ";
                }
            }
            connection.Close();
        }
        //string.Format("SELECT  name, password, FROM   Users WHERE UserName = N'{0}'", Session["Login"]);

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%=result%>
</asp:Content>

