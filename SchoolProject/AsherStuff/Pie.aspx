<%@ Page Title="" Language="C#" MasterPageFile="~/AsherStuff/MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    int count10 = 0;
    int count11 = 0;
    int count12 = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"].ToString() != "admin")
        {
            Response.Redirect("Err.aspx");
            Response.End();
        }
        string conStr = @"Data Source=.;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = "SELECT  UserName, Pass, Age FROM   UserTbl";
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);

        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                int age = int.Parse(dr["Age"].ToString());
                if (age == 10)
                {
                    count10++;
                }
                if (age == 11)
                {
                    count11++;
                }
                if (age == 12)
                {
                    count12++;
                }
            }
        }
        conObj.Close();
    }
</script>

<asp:Content ID="Connt1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

        // Load the Visualization API and the piechart package.
        google.load('visualization', '1.0', { 'packages': ['corechart'] });

        // Set a callback to run when the Google Visualization API is loaded.
        google.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart() {

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows([
          ['10', <%=count10 %>],
          ['11', <%=count11 %>],
          ['12', <%=count12 %>]
        ]);

            // Set chart options
            var options = { 'title': 'How old are those weird people who signed to my website?',
                'width': 400,
                'height': 300
            };

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
    <!--Div that will hold the pie chart-->
    <center>
    <div id="chart_div"></div>
    </center>
</asp:Content>

