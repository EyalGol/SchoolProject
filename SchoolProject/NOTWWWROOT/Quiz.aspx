<%@ Page Title="" Language="C#" MasterPageFile="~/NOTWWWROOT/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        var d = Date.now()
    </script>
    <div class="container">
        <div class="jumbotron">
            <h1 class="text-primary">Lats Start!</h1>
            <span class="help-block" id="errQuiz"></span>
            <br />
            <br />
            <form class="form-vertical" role="form" onsubmit="return MasterCheck()">
                <h3 class="text-success">Q1: what's the year Kirk Hammett was born</h3>
                <hr />
                <div class="form-check">
                    <input id="akirk1" class="form-check-input" name="qkirk" type="radio" value="option1">
                    <label class="form-check-label" for="akirk1">1962</label>
                </div>
                <div class="form-check">
                    <input id="akirk2" class="form-check-input" name="qkirk" type="radio" value="option2">
                    <label class="form-check-label" for="akirk2">1984</label>
                </div>
                <div class="form-check">
                    <input id="akirk3" class="form-check-input" name="qkirk" type="radio" value="option3">
                    <label class="form-check-label" for="akirk3">1976</label>
                </div>
                <h3 class="text-success">Q2: what's the year James Hetfield was born</h3>
                <hr />
                <div class="form-check">
                    <input id="ajames1" class="form-check-input" name="qjames" type="radio" value="option1">
                    <label class="form-check-label" for="ajames1">1961</label>
                </div>
                <div class="form-check">
                    <input id="ajames2" class="form-check-input" name="qjames" type="radio" value="option2">
                    <label class="form-check-label" for="ajames2">1984</label>
                </div>
                <div class="form-check">
                    <input id="ajames3" class="form-check-input" name="qjames" type="radio" value="option3">
                    <label class="form-check-label" for="ajames3">1976</label>
                </div>
                <h3 class="text-success">Q3: what's the year Lars Ulrich was born</h3>
                <hr />
                <div class="form-check">
                    <input id="alars1" class="form-check-input" name="qlars" type="radio" value="option1">
                    <label class="form-check-label" for="alars1">1963</label>
                </div>
                <div class="form-check">
                    <input id="alars2" class="form-check-input" name="qlars" type="radio" value="option2">
                    <label class="form-check-label" for="alars2">1984</label>
                </div>
                <div class="form-check">
                    <input id="alars3" class="form-check-input" name="qlars" type="radio" value="option3">
                    <label class="form-check-label" for="alars3">1976</label>
                </div>
                <h3 class="text-success">Q4: what's the year Robert Trujillo was born</h3>
                <hr />
                <div class="form-check">
                    <input id="arobert1" class="form-check-input" name="qrobert" type="radio" value="option1">
                    <label class="form-check-label" for="arobert1">1964</label>
                </div>
                <div class="form-check">
                    <input id="arobert2" class="form-check-input" name="qrobert" type="radio" value="option2">
                    <label class="form-check-label" for="arobert2">1984</label>
                </div>
                <div class="form-check">
                    <input id="arobert3" class="form-check-input" name="qrobert" type="radio" value="option3">
                    <label class="form-check-label" for="arobert3">1976</label>
                </div>
                <h3 class="text-success">Q5: what's the year Cliff Burton was born</h3>
                <hr />
                <div class="form-check">
                    <input id="acliff1" class="form-check-input" name="qcliff" type="radio" value="option1">
                    <label class="form-check-label" for="acliff1">1962</label>
                </div>
                <div class="form-check">
                    <input id="acliff2" class="form-check-input" name="qcliff" type="radio" value="option2">
                    <label class="form-check-label" for="acliff2">1984</label>
                </div>
                <div class="form-check">
                    <input id="acliff3" class="form-check-input" name="qcliff" type="radio" value="option3">
                    <label class="form-check-label" for="acliff3">1976</label>
                </div>
                <h3 class="text-success">Q6: what's the year Hansi Kürsch was born</h3>
                <hr />
                <div class="form-check">
                    <input id="ahansi1" class="form-check-input" name="qhansi" type="radio" value="option1">
                    <label class="form-check-label" for="ahansi1">1966</label>
                </div>
                <div class="form-check">
                    <input id="ahansi2" class="form-check-input" name="qhansi" type="radio" value="option2">
                    <label class="form-check-label" for="ahansi2">1984</label>
                </div>
                <div class="form-check">
                    <input id="ahansi3" class="form-check-input" name="qhansi" type="radio" value="option3">
                    <label class="form-check-label" for="ahansi3">1976</label>
                </div>
                <h3 class="text-success">Q7: what's the year André Olbrich was born</h3>
                <hr />
                <div class="form-check">
                    <input id="aandre1" class="form-check-input" name="qandre" type="radio" value="option1">
                    <label class="form-check-label" for="aandre1">1967</label>
                </div>
                <div class="form-check">
                    <input id="aandre2" class="form-check-input" name="qandre" type="radio" value="option2">
                    <label class="form-check-label" for="aandre2">1984</label>
                </div>
                <div class="form-check">
                    <input id="aandre3" class="form-check-input" name="qandre" type="radio" value="option3">
                    <label class="form-check-label" for="aandre3">1976</label>
                </div>
                <h3 class="text-success">Q8: what's the year Marcus Siepen was born</h3>
                <hr />
                <div class="form-check">
                    <input id="amarcus1" class="form-check-input" name="qmarcus" type="radio" value="option1">
                    <label class="form-check-label" for="amarcus1">1968</label>
                </div>
                <div class="form-check">
                    <input id="amarcus2" class="form-check-input" name="qmarcus" type="radio" value="option2">
                    <label class="form-check-label" for="amarcus2">1984</label>
                </div>
                <div class="form-check">
                    <input id="amarcus3" class="form-check-input" name="qmarcus" type="radio" value="option3">
                    <label class="form-check-label" for="amarcus3">1976</label>
                </div>
                <h3 class="text-success">Q9: what's the year Thomen Stauch was born</h3>
                <hr />
                <div class="form-check">
                    <input id="athomen1" class="form-check-input" name="qthomen" type="radio" value="option1">
                    <label class="form-check-label" for="athomen1">1970</label>
                </div>
                <div class="form-check">
                    <input id="athomen2" class="form-check-input" name="qthomen" type="radio" value="option2">
                    <label class="form-check-label" for="athomen2">1984</label>
                </div>
                <div class="form-check">
                    <input id="athomen3" class="form-check-input" name="qthomen" type="radio" value="option3">
                    <label class="form-check-label" for="athomen3">1976</label>
                </div>
                <h3 class="text-success">Q10: what's the year Frederik Ehmke was born</h3>
                <hr />
                <div class="form-check">
                    <input id="afredrik1" class="form-check-input" name="qfredrik" type="radio" value="option1">
                    <label class="form-check-label" for="afredrik1">1978</label>
                </div>
                <div class="form-check">
                    <input id="afredrik2" class="form-check-input" name="qfredrik" type="radio" value="option2">
                    <label class="form-check-label" for="afredrik2">1984</label>
                </div>
                <div class="form-check">
                    <input id="afredrik3" class="form-check-input" name="qfredrik" type="radio" value="option3">
                    <label class="form-check-label" for="afredrik3">1976</label>
                </div>
                <hr />
                <div class="form-check">
                    <button type="submit" class="btn btn-primary btn-block">Submit Answers</button>
                </div>
            </form>
        </div>
    </div>


    <script type="text/javascript">
        function CheckFilled() {
            if (!(document.getElementById("akirk1").checked || document.getElementById("akirk2").checked || document.getElementById("akirk3").checked)) {
                document.getElementById("errQuiz").innerHTML = "Must Answer All Of The Questions"
                return false
            }
            else if (!(document.getElementById("ajames1").checked || document.getElementById("ajames2").checked || document.getElementById("ajames3").checked)) {
                document.getElementById("errQuiz").innerHTML = "Must Answer All Of The Questions"
                return false
            }
            else if (!(document.getElementById("alars1").checked || document.getElementById("alars2").checked || document.getElementById("alars3").checked)) {
                document.getElementById("errQuiz").innerHTML = "Must Answer All Of The Questions"
                return false
            }
            else if (!(document.getElementById("arobert1").checked || document.getElementById("arobert2").checked || document.getElementById("arobert3").checked)) {
                document.getElementById("errQuiz").innerHTML = "Must Answer All Of The Questions"
                return false
            }
            else if (!(document.getElementById("acliff1").checked || document.getElementById("acliff2").checked || document.getElementById("acliff3").checked)) {
                document.getElementById("errQuiz").innerHTML = "Must Answer All Of The Questions"
                return false
            }
            else if (!(document.getElementById("ahansi1").checked || document.getElementById("ahansi2").checked || document.getElementById("ahansi3").checked)) {
                document.getElementById("errQuiz").innerHTML = "Must Answer All Of The Questions"
                return false
            }
            else if (!(document.getElementById("aandre1").checked || document.getElementById("aandre2").checked || document.getElementById("aandre3").checked)) {
                document.getElementById("errQuiz").innerHTML = "Must Answer All Of The Questions"
                return false
            }
            else if (!(document.getElementById("amarcus1").checked || document.getElementById("amarcus2").checked || document.getElementById("amarcus3").checked)) {
                document.getElementById("errQuiz").innerHTML = "Must Answer All Of The Questions"
                return false
            }
            else if (!(document.getElementById("athomen1").checked || document.getElementById("athomen2").checked || document.getElementById("athomen3").checked)) {
                document.getElementById("errQuiz").innerHTML = "Must Answer All Of The Questions"
                return false
            }
            else if (!(document.getElementById("afredrik1").checked || document.getElementById("afredrik2").checked || document.getElementById("afredrik3").checked)) {
                document.getElementById("errQuiz").innerHTML = "Must Answer All Of The Questions"
                return false
            }
            document.getElementById("errQuiz").innerHTML = ""
            return true
        }
        function CorrectCount() {
            var count = 0
            if (document.getElementById("akirk1").checked) {
                count++
            }
            if (document.getElementById("ajames1").checked) {
                count++
            }
            if (document.getElementById("alars1").checked) {
                count++
            }
            if (document.getElementById("arobert1").checked) {
                count++
            }
            if (document.getElementById("acliff1").checked) {
                count++
            }
            if (document.getElementById("ahansi1").checked) {
                count++
            }
            if (document.getElementById("aandre1").checked) {
                count++
            }
            if (document.getElementById("amarcus1").checked) {
                count++
            }
            if (document.getElementById("athomen1").checked) {
                count++
            }
            if (document.getElementById("afredrik1").checked) {
                count++
            }
            alert("You have answerd " + count + " question correctly \nIt took you:" + ((Date.now() - d)/60000).toFixed(2)+ " minutes")
        }
        function MasterCheck() {
            if (!CheckFilled()) {
                return false
            }
            CorrectCount()
            return true
        }
    </script>
</asp:Content>

