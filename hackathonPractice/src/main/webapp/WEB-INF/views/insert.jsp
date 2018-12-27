<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>join Page</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<!-- Customize CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_join.css">

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
</head>

<body>
 <form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data"
    method="post" action= "excelUploadAjax.do">
    <div class="contents">
    <div>첨부파일은 한개만 등록 가능합니다.</div>

    <dl class="vm_name">
      <dt class="down w90">첨부 파일</dt>
        <dd><input id="excelFile" type="file" name="excelFile" /></dd>
      </dl>        
    </div>

    <div class="bottom">
      <button type="button" id="addExcelImpoartBtn" class="btn" onclick="check()" ><span>추가</span></button>
    </div>
  </form>
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

        },
        type : "POST"
        };

      $("#excelUploadForm").ajaxSubmit(options);
    }
  }
</script>
</body>
</html>