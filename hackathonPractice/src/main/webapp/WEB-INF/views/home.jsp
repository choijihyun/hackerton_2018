<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!doctype html>
<html lang="kr">
<head>
<title>HOME</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<!-- Customize CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_home.css">

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</head>

<body class="text-center">
	<div class="container-fluid">
		   <!-- header (상단바) class="app-header" -->
         <div id="header"></div>
		<div class="row flex-xl-nowrap">
		
		
			<!-- 왼쪽 바 -->
			<div class="col-12 col-md-3 col-xl-2 bd-sidebar">
			</div>
			
			<!-- 메인 부분 -->
			<div class="col-12 col-md-9 col-xl-8 py-md-3 pl-md-5 bd-content" role="main">
			</div>
		</div>
	</div>
</body>
</html>

<script src="${pageContext.request.contextPath}/resources/js/common/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/footer.js"></script>

<script type="text/javascript">
	var userInputId = getCookie("userInputId");
	console.log(userInputId);
	<%
	System.out.println("home session : " + session.getAttribute("id"));
	%>
</script>

<script type="text/javascript">	
	<%
	String id = (String) session.getAttribute("id");
	%>
	$(document).ready(function() {
		//과제 불러오기
		$.ajax({
			url : "/homework/selectHomework.json",
			type : "GET",
			data : {
			'stuId' :<%=id%>,
			'select' : 0,
			'order' : 0
			}, 
			success : function(result) {
				if (result['result'] === 'no data') {
					alert('등록된 과제 없음');
				} else { 
					console.log(result);
				for (var i = 0; i < result['result'].length; i++) {
					var assign_title = result['result'][i]['title'];
					var assign_contents = result['result'][i]['contents'];
					var str = '';
					str += '<button type="button" '; 
					str += 'class="btn btn-lg btn-block btn-outline-danger btn_preview">';
					str += '<h6 id="assign'+ (i + 1) + 'Title" ';
					str += '    onclick = "location.href=\"/assignment\";"      ';
					str += 'style="cursor: pointer; font-weight: bold" class="mb-2">-'+ assign_title + '</h6>';
					str += '<p6 id="assign'+ (i + 1) + 'Context">'+ assign_contents+ '</p6>';
					str += '</button>';
					$('.content_preview_assignment').append(str);
					}
				}
			},
			error : function(request,status,error){
				alert('과제불러오기 에러');
				console.log('message:'+request.responseText+'\n'+'error:'+error);
			}
		});//ajax
		
		//시간표 불러오기
		$.ajax({
			url:"/timeTable/searchTimeTable.json",
			type : "GET",
			data : {
				'stuId' :<%=id%>
			}, success : function(result){
	   			if(result['result'] === "no data"){ 
	   				//alert('등록된 시간표가 없습니다.');
	   			}else{ 
				
					for (var i = 0; i < result['result'].length; i++) {
						var subjectKey = result['result'][i]['subjectKey'];
						//subject 키로 과목정보들 찾아와서 색칠하기
						findSubjectInfo(subjectKey);
					}
	   			}
	 		}, error : function(request,status,error){
				//alert('시간표 불러오기 에러');
				console.log("code:"+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
			}
		});//ajax
	});//$(document).ready

</script>