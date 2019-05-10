<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style>
        *
        {
            box-sizing: border-box;
        }
        
        .row > .column
        {
            padding: 0 8px;
        }
        
        .row:after
        {
            content: "";
            display: table;
            clear: both;
        }
        
        .column
        {
            float: left;
            width: 100px;
            height: 100px;
            
        }
        
        /* The Modal (background) */
        .modal
        {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 75px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: black;
        }
        
        /* Modal Content */
        .modal-content
        {
            position: relative;
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            width: 90%;
            max-width: 1200px;
        }
        
        /* The Close Button */
        .close
        {
            color: #fff;
            position: absolute;
            top: 10px;
            right: 25px;
            font-size: 35px;
            font-weight: bold;
        }
        
        .close:hover, .close:focus
        {
            color: #999;
            text-decoration: none;
            cursor: pointer;
        }
        
        .mySlides
        {
            display: none;
        }
        
        .cursor
        {
            cursor: pointer;
        }
        
        /* Next & previous buttons */
        .prev, .next
        {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -50px;
            color: white;
            font-weight: bold;
            font-size: 20px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
            -webkit-user-select: none;
        }
        
        /* Position the "next button" to the right */
        .next
        {
            right: 0;
            border-radius: 3px 0 0 3px;
        }
        
        /* On hover, add a black background color with a little bit see-through */
        .prev:hover, .next:hover
        {
            background-color: rgba(0, 0, 0, 0.8);
        }
        
        img
        {
            margin-bottom: -4px;
        }
        
        .demo
        {
            opacity: 0.6;
        }
        
        .active, .demo:hover
        {
            opacity: 1;
        }
        
        img.hover-shadow
        {
            transition: 0.3s;
        }
        
        .hover-shadow:hover
        {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" style="padding: 45px;"  oncontextmenu="return false" onkeydown="return false">
        <div class="row">
            <div class="col-md-12">
                <label>
                    Gallery</label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="lblMes" runat="server"></asp:Label>
                <asp:Repeater ID="repGal" runat="server" OnItemCommand="repGal_OnItemCommand">
                    <ItemTemplate>
                        <div class="col-lg-2 col-md-2 col-sm-6 thumbnail" >
                            <img src='images/uploads/jpeg/<%#Eval("image")+".jpg" %>' style="height: 100px;" onclick="openModal();currentSlide(<%# Container.ItemIndex+1%>)"
                                class="hover-shadow cursor">
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div id="myModal" class="modal">
                <span class="close cursor" onclick="closeModal()">&times;</span>
                <div class="modal-content">
                </div>
                <asp:Repeater ID="repGal1" runat="server" OnItemCommand="repGal1_OnItemCommand">
                    <ItemTemplate>
                        <div class="mySlides text-center">
                            <img src='images/uploads/jpeg/<%#Eval("image")+".jpg" %>' style="width: 600px; height: 600px;">
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next" onclick="plusSlides(1)">
                    &#10095;</a>
                <br />
                <br />
                <div class="col-md-12">
                    <asp:Repeater ID="repGal2" runat="server" OnItemCommand="repGal2_OnItemCommand">
                        <ItemTemplate>
                            <div class="column" >
                                <img class="demo cursor" src='images/uploads/jpeg/<%#Eval("image")+".jpg" %>' style="width: 50px;
                                    height: 50px;" onclick="currentSlide(<%# Container.ItemIndex+1%>)" alt="Northern Lights">
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function openModal() {
            document.getElementById('myModal').style.display = "block";
        }

        function closeModal() {
            document.getElementById('myModal').style.display = "none";
        }

        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("demo");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
            captionText.innerHTML = dots[slideIndex - 1].alt;
        }

    </script>
</asp:Content>
