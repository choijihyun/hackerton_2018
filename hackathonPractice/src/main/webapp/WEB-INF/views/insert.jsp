<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			<p class="w3-left col-auto"
				style="font-family: 'Roboto', sans-serif; font-size: 30px;">SW
				역량 모니터링</p>
			<p class="w3-right">
				<button type="button" class="btn btn-default btn-log-out "
					aria-label="Left Align" onclick='location.href="/logout"'>
					</a> <i class="fa fa-sign-out-alt"></i>
				</button>
				<button type="button" class="btn btn-default btn-log-out"
					aria-label="Left Align" onclick='location.href="/mypage"'>
					</a> <i class="fa fa-undo-alt"></i>
				</button>
			</p>
			</header>
			
			<div class="row main_area">
				<form id="excelUploadForm" name="excelUploadForm"
					enctype="multipart/form-data" method="post"
					action="/student/insertExcel.json">
					<div class="contents">
						<div>첨부파일은 한개만 등록 가능합니다.</div>

						
						<dl class="vm_name">
							<dt class="down w90">첨부 파일</dt>
							<dd> <input id="excelFile" type="file" name="excelFile" /> </dd>
						</dl>
					</div>

					<div class="bottom">
						<button type="button" id="addExcelImpoartBtn" class="btn" onclick="check()">
							<span>추가</span>
						</button>
					</div>
				</form> 
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
  function checkFileType(filePath) {
    var fileFormat = filePath.split(".");

    if (fileFormat.indexOf("xls") > -1 || fileFormat.indexOf("xlsx") > -1) {
      return true;
      } else {
      return false;
    }
  }

  function check() {

    var file = $("#excelFile").val();

    console.log(file);
    
    if (file == "" || file == null) {
    alert("파일을 선택해주세요.");

    return false;
    } else if (!checkFileType(file)) {
    alert("엑셀 파일만 업로드 가능합니다.");

    return false;
    }

    if (confirm("업로드 하시겠습니까?")) {

      var options = {

        success : function(data) {
          alert("모든 데이터가 업로드 되었습니다.");

          location.href="/mypage";
        },
        type : "POST"
        };

      $("#excelUploadForm").ajaxSubmit(options);
      
    }
    
  }
</script>
</body>
</html>