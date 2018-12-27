<!DOCTYPE html>
<html>
<title>SW 역량</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_home.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/simple-donut.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/simple-donut.sass">
<script src="${pageContext.request.contextPath}/resources/js/simple-donut-jquery.js"></script>

<body class="w3-content" style="max-width:1200px">
<div>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b>SEJONG UNIV.</b></h3>
  </div>
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a onclick="myAccFunc()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      학과 <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">

      <a href="#" class="w3-bar-item w3-button"></a>
          <input type="checkbox" id="cb1">
    <label for="cb1">컴퓨터공학과</label>
      <a href="#" class="w3-bar-item w3-button"></a>
       <input type="checkbox" id="cb2">
    <label for="cb2">소프트웨어학과</label>
      <a href="#" class="w3-bar-item w3-button"></a>
       <input type="checkbox" id="cb3">
    <label for="cb3">지능기전</label>
      <a href="#" class="w3-bar-item w3-button"></a>
       <input type="checkbox" id="cb4">
    <label for="cb4">정보보호학과</label>
    </div>
        <a onclick="myAccFunc1()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      학년 <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc1" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button"></a>
          <input type="checkbox" id="cb01">
    <label for="cb1">1</label>
      <a href="#" class="w3-bar-item w3-button"></a>
       <input type="checkbox" id="cb02">
    <label for="cb1">2</label>
      <a href="#" class="w3-bar-item w3-button"></a>
       <input type="checkbox" id="cb03">
    <label for="cb1">3</label>
      <a href="#" class="w3-bar-item w3-button"></a>
       <input type="checkbox" id="cb04">
    <label for="cb1">4</label>
    </div>
  </div>
  
</nav>

<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  <div class="w3-bar-item w3-padding-24 w3-wide">SW 역량 모니터링</div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
  <!-- Top header -->
  <header class="w3-container w3-xlarge">
    <p class="w3-left">SW 역량 모니터링!</p>
    <p class="w3-right">
    <a class="btn btn-default btn-log-out" aria-label="Left Align" onclick="location.href="/logout""></a>
      <i class="fa fa-sign-out"></i>
     </a>
    </p>
  </header>


  <!-- End page content -->
</div>

<!-- Newsletter Modal -->
<div id="newsletter" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom" style="padding:32px">
    <div class="w3-container w3-white w3-center">
      <i onclick="document.getElementById('newsletter').style.display='none'" class="fa fa-remove w3-right w3-button w3-transparent w3-xxlarge"></i>
      <h2 class="w3-wide">NEWSLETTER</h2>
      <p>Join our mailing list to receive updates on new arrivals and special offers.</p>
      <p><input class="w3-input w3-border" type="text" placeholder="Enter e-mail"></p>
      <button type="button" class="w3-button w3-padding-large w3-red w3-margin-bottom" onclick="document.getElementById('newsletter').style.display='none'">Subscribe</button>
    </div>
  </div>
</div>
</div>

	<div>
      <div id="demo" class="donut-size">
           <div class="pie-wrapper">
               <span class="label">
                  <span class="num">0</span><span class="smaller">%</span>
             </span>
             <div class="pie">
               <div class="left-side half-circle"></div>
             <div class="right-side half-circle"></div>
            </div>
          <div class="shadow"></div>
           </div>
      </div>
   
   </div>
</body>
</html>

<script>
   updateDonutChart('#demo', 13, true);
</script>
   
<script>
// Accordion 
function myAccFunc() {
  var x = document.getElementById("demoAcc");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}
function myAccFunc1() {
     var x = document.getElementById("demoAcc1");
     if (x.className.indexOf("w3-show") == -1) {
       x.className += " w3-show";
     } else {
       x.className = x.className.replace(" w3-show", "");
     }
   }

// Click on the "Jeans" link on page load to open the accordion for demo purposes
document.getElementById("myBtn").click();


// Open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}
</script>
