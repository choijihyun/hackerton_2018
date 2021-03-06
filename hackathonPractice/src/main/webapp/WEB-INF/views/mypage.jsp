<!DOCTYPE html>
<html>
<title>SW 역량</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_mypage.css">


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/simple-donut.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/simple-donut.sass">
<script src="${pageContext.request.contextPath}/resources/js/simple-donut-jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/graphite.js"></script>

<body class="w3-content" style="max-width: 1200px">
	<div>
		<!-- Sidebar/menu -->
		<nav class="w3-sidebar  w3-bar-block w3-collapse w3-top"

			style="z-index: 3; width: 250px" id="mySidebar">
			<div class="w3-container w3-display-container w3-padding-16">
				<i onclick="w3_close()"
					class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
				<h3 class="w3-wide">
					<b>SEJONG UNIV.</b>
				</h3>
				<%
					String name = (String) session.getAttribute("name");
				%>
				<h5><%=name%>님 환영합니다.
				</h5>
			</div>
			<div class="w3-padding-64 w3-large w3-text-grey" style="font-weight: bold">
				
			</div>

		</nav>

		<!-- Top menu on small screens -->
		<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
			<div class="w3-bar-item w3-padding-24 w3-wide">SW 역량 모니터링</div>
			<a href="javascript:void(0)"
				class="w3-bar-item w3-button w3-padding-24 w3-right"
				onclick="w3_open()"><i class="fa fa-bars"></i></a>
		</header>

		<!-- Overlay effect when opening sidebar on small screens -->
		<div class="w3-overlay w3-hide-large" onclick="w3_close()"
			style="cursor: pointer" title="close side menu" id="myOverlay"></div>

		<!-- !PAGE CONTENT! -->
		<div class="w3-main" style="margin-left: 250px">
			<!-- Push down content on small screens -->
			<div class="w3-hide-large" style="margin-top: 83px"></div>

			<!-- Top header -->
			<header class="w3-container w3-xlarge mt-2">
				<p class="w3-left col-auto" style="font-family: 'Roboto', sans-serif; font-size: 30px;"></p>
				<p class="w3-right">
					<button class="btn btn-default btn-log-out" aria-label="Left Align"
						onclick='location.href="/logout"'>
						</a> <i class="fa fa-sign-out-alt"></i>
					</button>
				</p>
			</header>
			<div class="row main_area">
				<div class="main_border col-5 p-1">
				 <button type="button" class="btn fa fa-file-excel px-4" style="outline:none; height:380px; font-size: 300px; color: #1abc9c;"
				 onclick='location.href="/insert"'></button>
				 <div class="p-4" style="font-size: 20px;font-weight: bold;"> EXCEL 파일 올리기 </div>
				 
				</div>
				 <div class="main_border col-5 p-1">
				<button type="button" class="btn fa fa-chart-bar px-4" style="outline:none; height:380px; font-size: 300px; color: #1abc9c;"
				 onclick='location.href="/home"'></button>
				 <div class="p-4" style="font-size: 20px;font-weight: bold;"> 자료 열람하기 </div>
				</div> 
			</div>

				
			<!-- End page content -->
		</div>
		
		<!-- Newsletter Modal -->
		<div id="newsletter" class="w3-modal">
			<div class="w3-modal-content w3-animate-zoom" style="padding: 32px">
				<div class="w3-container w3-white w3-center">
					<i
						onclick="document.getElementById('newsletter').style.display='none'"
						class="fa fa-remove w3-right w3-button w3-transparent w3-xxlarge"></i>
					<h2 class="w3-wide">NEWSLETTER</h2>
					<p>Join our mailing list to receive updates on new arrivals and
						special offers.</p>
					<p>
						<input class="w3-input w3-border" type="text"
							placeholder="Enter e-mail">
					</p>
					<button type="button"
						class="w3-button w3-padding-large w3-red w3-margin-bottom"
						onclick="document.getElementById('newsletter').style.display='none'">Subscribe</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

