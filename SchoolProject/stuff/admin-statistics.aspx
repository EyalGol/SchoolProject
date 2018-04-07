<%@ Page Title="" Language="C#" MasterPageFile="~/shifu.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.Configuration" %>
<script runat="server">
    public int over18 = 0, under18 = 0, starta = 0, male = 0, female = 0;
    public int[] starters = new int[17];
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["username"] != "Admin")
        {
            Response.Redirect("err403.aspx");
            Response.End();
        }
            string cmdstr = "SELECT * FROM mytable ";
            string ConString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True";
            SqlConnection conn = new SqlConnection(ConString);
            conn.Open();
            SqlCommand mycomm = new SqlCommand(cmdstr, conn);
            DataSet mySet = new DataSet();
            SqlDataAdapter adapt = new SqlDataAdapter(mycomm);
            adapt.Fill(mySet, "mytable");
            conn.Close();
            
            for (int i = 0; i < starters.Length; i++)
            {
                starters[i] = 0;//WHY DO I HAVE TO DO THIS, THATS FUCKING DUMB
            }
            foreach (DataRow row in mySet.Tables[0].Rows)
            {
                DateTime dob = (DateTime)row["dob"];
                if (dob.Year > 1998)
                {
                    over18++;
                }
                else
                    under18++;
                if (row["sex"].ToString() == "male")
                {
                    male++;
                }
                else
                    female++;
                if (row["username"].ToString()[0] == 'a')
                {
                    starta++;
                }
                starters[int.Parse(row["starter"].ToString())]++;
                
            }
        }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
 <script type="text/javascript">
     google.load('visualization', '1.0', { 'packages': ['corechart'] });
     google.setOnLoadCallback(drawChart);
     function drawChart() {
         var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows([
          ['over 18', <%=over18 %>],
          ['under 18', <%=under18 %>]
        ]);

            var data2 = new google.visualization.DataTable();
            data2.addColumn('string', 'Topping');
            data2.addColumn('number', 'Slices');
            data2.addRows([
          ['men', <%=male %>],
          ['women', <%=female %>]
          ]);
            var data3 = new google.visualization.DataTable();
            data3.addColumn('string', 'Topping');
            data3.addColumn('number', 'Slices');
            data3.addRows([
            ['Bulbasaur', <%=starters[1] %>],
            ['Charamander', <%=starters[2] %>],
            ['Squirtle', <%=starters[3] %>],
            ['Pickachu', <%=starters[4] %>],
            ['Cyndaquil', <%=starters[5] %>],
            ['Chikaorita', <%=starters[6] %>],
            ['Totodile', <%=starters[7] %>],
            ['Treeko', <%=starters[8] %>],
            ['Torchic', <%=starters[9] %>],
            ['Mudkip', <%=starters[10] %>],
            ['Turtwig', <%=starters[11] %>],
            ['Chimichar', <%=starters[12] %>],
            ['Piplup', <%=starters[13] %>],
            ['Snivy', <%=starters[14] %>],
            ['Tepig', <%=starters[15] %>],
            ['Oshawott', <%=starters[16] %>]
            ]);
            
            var options = { 'title': 'Age Distribution?',
                'width': 400,
                'height': 300
            };
            
          var options2 = {'title': 'Sex Destribution',
                'width': 400,
                'height': 300
            };
            var options3={'title': 'Starter Destribution',
                'width': 400,
                'height': 300
            };

            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
            var chart2 = new google.visualization.PieChart(document.getElementById('chart_div2'));
            chart2.draw(data2, options2);
            var chart3 = new google.visualization.PieChart(document.getElementById('chart_div3'));
            chart3.draw(data3, options3);
     }
 </script>
    <div id="chart_div"></div>
    <br />
    <div id="chart_div2"></div>
    <br />
    <div id="chart_div3"></div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Categories" Runat="Server">
    <ul>
<li><a href="admin.aspx">Admin</a></li>
<li><a href="admin-listing.aspx">User Listing</a></li>
        <li><a href="admin-statistics.aspx">Stats</a></li>
</ul>
</asp:Content>

