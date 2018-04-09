<%@ Page Title="" Language="VB" MasterPageFile="~/NOTWWWROOT/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <img class="img-responsive center" height="600px" width="600px" id="animationID" src="../img/frame1.png" />
        <hr />
        <div class="row">
            <div class="col-md-6">
                    <button type="button" class="btn btn-success center" onclick="start()">Start</button>  
            </div>
            <div class="col-md-6">
                    <button type="button" class="btn btn-danger center" onclick="stop()">Stop</button>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        var i = 1
        var levar
        function start()
        {
            levar = setInterval(SlideShow, 2000)
        }
        function stop() {
            window.clearInterval(levar)
        }
        function SlideShow() 
        {
            var str = "../img/frame" + i + ".png" 
            document.getElementById("animationID").src = str
            i++;
            if (i == 4) {
                i = 1
            }
        }
    </script>
</asp:Content>

