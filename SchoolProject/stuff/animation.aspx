<%@ Page Title="" Language="C#" MasterPageFile="~/shifu.master" %>

<script runat="server">

</script>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <img height="600px" width="100%" id="myimg" src="animation/animation0.png"/>
    <input type="button"  value="Start" onclick="start()" />
    <input type="button" value="stop" onclick="stop()" />
    <script type="text/javascript">
        var i = 0;
        var levar;
        function start()
        {
            levar = setInterval(SlideShow, 1000)
        }
        function stop() {
            window.clearInterval(levar);
        }
        function SlideShow() 
        {
            
            var str = "animation/animation" + i + ".png";
            document.getElementById("myimg").src = str;
            i++;
            if (i == 5) {
                i = 0
            }
        }
    </script>
    </asp:Content>
<%-- Add content controls here --%>
