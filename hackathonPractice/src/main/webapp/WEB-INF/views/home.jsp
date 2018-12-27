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
				<a onclick="myAccFunc()" href="javascript:void(0)"
					class="w3-button w3-block w3-white w3-left-align" id="myBtn">
					학과 <i class="fa fa-caret-down"></i>
				</a>
				<div id="demoAcc"
					class="w3-bar-block w3-hide w3-padding-large w3-medium">

					<a href="#" class="w3-bar-item w3-button"></a> <input
						type="checkbox" id="cb1"> <label for="cb1">컴퓨터공학과</label>
					<a href="#" class="w3-bar-item w3-button"></a> <input
						type="checkbox" id="cb2"> <label for="cb2">소프트웨어학과</label>
					<a href="#" class="w3-bar-item w3-button"></a> <input
						type="checkbox" id="cb3"> <label for="cb3">지능기전</label>
					<a href="#" class="w3-bar-item w3-button"></a> <input 
						type="checkbox" id="cb4"> <label for="cb4">정보보호학과</label>
				</div>
				<a onclick="myAccFunc1()" href="javascript:void(0)"
					class="w3-button w3-block w3-white w3-left-align" id="myBtn">
					학년 <i class="fa fa-caret-down"></i>
				</a>
				<div id="demoAcc1"
					class="w3-bar-block w3-hide w3-padding-large w3-medium">
					<a href="#" class="w3-bar-item w3-button"></a> <input
						type="checkbox" id="cb01"> <label for="cb1">1</label> <a
						href="#" class="w3-bar-item w3-button"></a> <input type="checkbox"
						id="cb02"> <label for="cb1">2</label> <a href="#"
						class="w3-bar-item w3-button"></a> <input type="checkbox"
						id="cb03"> <label for="cb1">3</label> <a href="#"
						class="w3-bar-item w3-button"></a> <input type="checkbox"
						id="cb04"> <label for="cb1">4</label>
				</div>
				<a onclick="myAccFunc2()" href="javascript:void(0)"
					class="w3-button w3-block w3-white w3-left-align" id="myBtn">
					종류 <i class="fa fa-caret-down"></i>
				</a>
				<div id="demoAcc2" class="w3-bar-block w3-hide w3-padding-large w3-medium">
 					<a href="#" class="w3-bar-item w3-button"></a> <input
						type="checkbox" id="cb5"> <label >경시대회</label>
					<a href="#" class="w3-bar-item w3-button"></a> <input
						type="checkbox" id="cb6"> <label>1차 인증시험</label>
					<a href="#" class="w3-bar-item w3-button"></a> <input
						type="checkbox" id="cb7"> <label>2차 인증시험</label>
				</div>
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
			<header class="w3-container w3-xlarge">
				<p class="w3-left col-auto" style="font-size: 30px;">SW 역량 모니터링</p>
				<p class="w3-right">
					<button class="btn btn-default btn-log-out" aria-label="Left Align"
						onclick='location.href="/logout"'>
						</a> <i class="fa fa-sign-out"></i>
					</button>
				</p>
			</header>

			<!--  사이드바랑 헤더 빼고 나머지 본문 -->
			<div class="row main_area mt-4">

				<div class="col-3 label_input mt-2">
					<label>작년 커트라인
						</h6>
					</label>
				</div>
				<div class="col-3 mt-2">
					<input type="text" class="form-control form-control-sm flat_input"
						disabled="true" id="lastCutLine">
				</div>
				<div class="col-3 label_input mt-2">
					<label>작년 합격자 수</label>
				</div>
				<div class="col-3 mt-2">
					<input type="text" class="form-control form-control-sm flat_input"
						disabled="true" id="lastPasser">
				</div>

				<div class="col-3 label_input mt-2">
					<label>커트라인</label>
				</div>
				<div class="col-3 mt-2">
					<input type="text" class="form-control form-control-sm flat_input"
						placeholder="커트라인을 입력 해 주세요." id="thisCutLine">
				</div>
				<div class="col-3 label_input mt-2">
					<label>예상 합격자 수</label>
				</div>
				<div class="col-3 mt-2">
					<input type="text" class="form-control form-control-sm flat_input"
						disabled="true" id="thisPasser">
				</div>

				<!-- js로 뺴기	-->
				<div class="major">
					<div id="demo1" class="donut-size">
						<div class="pie-wrapper">
							<span class="label"> <span class="num">0</span><span
								class="smaller">%</span>
							</span>
							<div class="pie">
								<div class="left-side half-circle"></div>
								<div class="right-side half-circle"></div>
							</div>
							<div class="shadow"></div>
						</div>
					</div>
					<label class="label_major"> 컴퓨터공학과 </label>
				</div>

				<div class="major">
					<div id="demo2" class="donut-size">
						<div class="pie-wrapper">
							<span class="label"> <span class="num">0</span><span
								class="smaller">%</span>
							</span>
							<div class="pie">
								<div class="left-side half-circle"></div>
								<div class="right-side half-circle"></div>
							</div>
							<div class="shadow"></div>
						</div>
					</div>
					<label class="label_major"> 소프트웨어학과</label>
				</div>

				<div class="major">
					<div id="demo3" class="donut-size">
						<div class="pie-wrapper">
							<span class="label"> <span class="num">0</span><span
								class="smaller">%</span>
							</span>
							<div class="pie">
								<div class="left-side half-circle"></div>
								<div class="right-side half-circle"></div>
							</div>
							<div class="shadow"></div>
						</div>
					</div>
					<label class="label_major"> 지능기전 </label>
				</div>

				<div class="major">
					<div id="demo4" class="donut-size">
						<div class="pie-wrapper">
							<span class="label"> <span class="num">0</span><span
								class="smaller">%</span>
							</span>
							<div class="pie">
								<div class="left-side half-circle"></div>
								<div class="right-side half-circle"></div>
							</div>
							<div class="shadow"></div>
						</div>
					</div>
					<label class="label_major">정보보호학과 </label>
				</div>

				<div>
					<div class="graph" id="example"></div>
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


<script>
	//이거 나중에 디비에서  값 가져와서 저 13 저거 중간 파ㅁ라미터 바꾸면 댐
	updateDonutChart('#demo1', 87, true);
	updateDonutChart('#demo2', 13, true);
	updateDonutChart('#demo3', 58, true);
	updateDonutChart('#demo4', 7, true);
	
    $('.bar-chart').cssCharts({type:"bar"});
       
   


</script>

<script type="text/javascript">
	$(document).ready(function() {
		$(function() {
			var i;
			for(i=1;i<5;i++){
				var chk = "#cb"+i;
				var ch = "#cb0"+i;
				
				$(chk).attr("checked", true);
				$(ch).attr("checked", true);
			}
		});
		
		$('#logout').on('click', function() {
			console.log("logout");
		});
	});
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
	function myAccFunc2() {
		var x = document.getElementById("demoAcc2");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}

	// Click on the "Jeans" link on page load to open the accordion for demo purposes
	document.getElementById("myBtn").click();
	document.getElementById("myBtn1").click();

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