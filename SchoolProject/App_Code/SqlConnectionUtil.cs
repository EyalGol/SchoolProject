using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class1
/// </summary>
public class SqlConnectionUtil
{
    static SqlConnectionUtil()
    {
    }

    public static SqlConnection Create()
    {
        var con = new SqlConnection(@"Data Source=.;AttachDbFilename=E:\SchoolProject\SchoolProject\App_Data\Database.mdf;Integrated Security=True;Connect Timeout=1;");
        con.Open();
        return con;
        //return new SqlConnection(Properties.Settings.Default.TheConnectionString);
    }
}