<%@ Page Title="" Language="C#" MasterPageFile="~/NOTWWWROOT/MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["name"].ToString() != "Admin")
        //{
        //    Response.Redirect("HomePage.aspx");
        //    Response.End();
        //}
        //
        if (Request.Form["delete"] != null)
        {
            int id = int.Parse(Request.Form["id"]);
            using (var connection = SqlUtil.CreateCon())
            {
                var cmd = new SqlCommand(string.Format("DELETE FROM Users WHERE id = {0}", id), connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                Session["err"] = "You Have Successfully Deleted";
            }
        }
        if (Request.Form["UfirstName"] != null)
        {
            int id = int.Parse(Request.Form["id"]);
            string name = Request.Form["firstName"];
            using (var connection = SqlUtil.CreateCon())
            {
                var cmd = new SqlCommand(string.Format("UPDATE Users SET name = N'{0}' WHERE id = {1}", name ,id), connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                Session["err"] = "You Have Successfully Updated";
            }
        }

        if (Request.Form["Upassword"] != null)
        {
            int id = int.Parse(Request.Form["id"]);
            string password = Request.Form["password"];
            using (var connection = SqlUtil.CreateCon())
            {
                var cmd = new SqlCommand(string.Format("UPDATE Users SET password = N'{0}' WHERE id = {1}", password ,id), connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                Session["err"] = "You Have Successfully Updated";
            }
        }

        if (Request.Form["Uemail"] != null)
        {
            int id = int.Parse(Request.Form["id"]);
            string email = Request.Form["email"];
            using (var connection = SqlUtil.CreateCon())
            {
                var cmd = new SqlCommand(string.Format("UPDATE Users SET email = N'{0}' WHERE id = {1}", email ,id), connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                Session["err"] = "You Have Successfully Updated";
            }
        }

        if (Request.Form["UbirthDate"] != null)
        {
            int id = int.Parse(Request.Form["id"]);
            string birthdate = Request.Form["birthDate"];
            using (var connection = SqlUtil.CreateCon())
            {
                var cmd = new SqlCommand(string.Format("UPDATE Users SET birthdate = N'{0}' WHERE id = {1}", birthdate ,id), connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                Session["err"] = "You Have Successfully Updated";
            }
        }

        if (Request.Form["Ucountry"] != null)
        {
            int id = int.Parse(Request.Form["id"]);
            string country = Request.Form["country"];
            using (var connection = SqlUtil.CreateCon())
            {
                var cmd = new SqlCommand(string.Format("UPDATE Users SET country = N'{0}' WHERE id = {1}", country ,id), connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                Session["err"] = "You Have Successfully Updated";
            }
        }

        if (Request.Form["Ugender"] != null)
        {
            int id = int.Parse(Request.Form["id"]);
            string gender = Request.Form["gender"];
            using (var connection = SqlUtil.CreateCon())
            {
                var cmd = new SqlCommand(string.Format("UPDATE Users SET gender = N'{0}' WHERE id = {1}", gender ,id), connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                Session["err"] = "You Have Successfully Updated";
            }
        }

        if (Request.Form["Ugener"] != null)
        {
            int id = int.Parse(Request.Form["id"]);
            using (var connection = SqlUtil.CreateCon())
            {
                string gener = "";
                if (Request.Form["deathMetal"] != null)
                {
                    gener += "DeathMetal";
                }
                if (Request.Form["powerMetal"] != null)
                {
                    gener += "PowerMetal";
                }
                if (Request.Form["heavyMetal"] != null)
                {
                    gener += "HeavyMetal";
                }
                var cmd = new SqlCommand(string.Format("UPDATE Users SET gener = N'{0}' WHERE id = {1}", gener ,id), connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                Session["err"] = "You Have Successfully Updated";
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container jumbotron">
            <form novalidate="novalidate" class="form-horizontal" role="form" onsubmit="return MasterCheck()" action="AdminUpdate.aspx" method="post">
                <h2>Admin</h2>
                <p><%=Session["err"] %></p>
                <input type="submit" class="btn btn-primary" value="DELETE" name="delete">

                <div class="form-group">
                    <label for="id" class="col-sm-3 control-label">ID</label>
                    <div class="col-sm-9">
                        <input type="text" id="id" name="id" placeholder="id" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">First Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" name="firstName" placeholder="First Name" class="form-control">
                    </div>
                    <input type="submit" class="btn btn-primary" value="Update" name="UfirstName">
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email" id="email" name="email" placeholder="Email" class="form-control">
                    </div>
                    <input type="submit" class="btn btn-primary" value="Update" name="Uemail">
                </div>

                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" name="password" placeholder="Password" class="form-control">
                    </div>
                    <input type="submit" class="btn btn-primary" value="Update" name="Upassword">
                </div>
                <div class="form-group">
                    <label for="birthDate" class="col-sm-3 control-label">Date of Birth</label>
                    <div class="col-sm-9">
                        <input type="date" id="birthDate" name="birthDate" class="form-control">
                    </div>
                    <input type="submit" class="btn btn-primary" value="Update" name="UbirthDate">
                </div>

                <div class="form-group">
                    <label for="country" class="col-sm-3 control-label">Country</label>
                    <div class="col-sm-9">
                        <select id="country" name="country" class="form-control">
                            <option value="0">Choose a country</option>
                            <option value="Afghanistan">Afghanistan</option>
                            <option value="Bahamas">Bahamas</option>
                            <option value="Cambodia">Cambodia</option>
                            <option value="Denmark">Denmark</option>
                            <option value="Ecuador">Ecuador</option>
                            <option value="Fiji">Fiji</option>
                            <option value="Gabon">Gabon</option>
                            <option value="Haiti">Haiti</option>
                        </select>
                    </div>
                    <input type="submit" class="btn btn-primary" value="Update" name="Ucountry">
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3">Gender</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="female" value="female">Female
                                </label>
                            </div>

                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="male" value="male">Male
                                </label>
                            </div>

                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="unknown" value="unknown">Unknown
                                </label>
                            </div>
                            <input type="submit" class="btn btn-primary" value="Update" name="Ugender">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3">What metal geners do you enjoy</label>
                    <div class="col-sm-9">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="heavyCheckbox" value="heavyMetal" name="heavyMetal">Heavy
                            </label>
                        </div>

                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="powerCheckbox" value="powerMetal" name="powerMetal">Power
                            </label>
                        </div>

                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="deathCheckbox" value="deathMetal" name="deathMetal">Death
                            </label>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Update" name="Ugener">
                    </div>
                </div>
            </form>
     </div>
</asp:Content>