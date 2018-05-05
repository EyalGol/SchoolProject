using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class1
/// </summary>
public class SqlUtil
{
    static SqlUtil()
    {
    }

    public static SqlConnection CreateCon()
    {
        var con = new SqlConnection(@"AttachDbFilename=E:\SchoolProject\SchoolProject\App_Data\Database.mdf;Integrated Security=True;Connect Timeout=1;Trusted_Connection=Yes;");
        con.Open();
        return con;
        //return new SqlConnection(Properties.Settings.Default.TheConnectionString);
    }
            //INSET EXSAMPLE:
            //var cmdStr = string.Format("INSERT  INTO Users(name, email, password, birthdate, country, gender, metal_gener) VALUES( N'{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}', N'{6}')", "", "", "", "", "", "", "");
            //SqlCommand cmd = new SqlCommand(cmdStr, con);
            //cmd.ExecuteNonQuery();
}