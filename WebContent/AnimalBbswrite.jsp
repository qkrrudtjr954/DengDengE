<%@page import="dto.User"%>
<%@page import="dto.AnimalBbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="icon" href="./icon/favicon.ico">

    <title>Deng Deng E list</title>
	
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./css/main.css" rel="stylesheet">
    
  </head>

 <body>
 <%
List<AnimalBbsDto> animallist = (List<AnimalBbsDto>)request.getAttribute("animlist");
%>
	<%@include file="./layout/header.jsp" %>
	<%@include file="./layout/jumbotron.jsp" %>

	<main role="main">

	<%@include file="./layout/menubar.jsp" %>
	
	<form action="AnimalBbsController" method="post" id="form">
		<input type="hidden" name="command" value="writeAf"> 

		<div class="album py-5 bg-light">
			<div class="container">


				<div class="row">
					<h1>입양하기 글 작성</h1>
				</div>
				<div class="offset-md-10 col-md-2">							
					<button type="button" id="btnBack" class="offset-md-12 btn btn-outline-secondary">돌아가기</button>						
				</div>
				<hr>

				<div class="form1">
					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text">이름</span> <input
								type="text" class="form-control" size="20" name="name" id="name"
								placeholder="이름">
						</div>

						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text" id="">나이</span> <input
								type="number" class="form-control" size="20" name="age" id="age"
								placeholder="나이">
						</div>

						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text">묘/견종</span> <input type="text"
								class="form-control" size="20" name="kinds" id="kinds" placeholder="묘/견종">
						</div>

						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<label class="input-group-text" for="inputGroupSelect01">분류</label>
						</div>
						<select class="custom-select" id="inputGroupSelect01"
							style="width: 200px" name="type" class="type">
							<option value="유기동물">유기동물</option>
							<option value="개인분양">개인분양</option>
							<option value="etc">etc</option>
						</select>
					</div>

					<br>

					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text">주소</span> 
							<input type="text"
								class="col-md-12 form-control" name="location" size="35"
								id="sample4_roadAddress" placeholder="도로명주소" readonly="readonly"
								style="background-color: #fff">
							<button class="btn btn-outline-secondary" type="button"
								onclick="sample4_execDaumPostcode()" id="locationBtn">주소찾기</button>
						</div>
						<div class="input-group-prepend">
							<span class="offset-md-4 input-group-text">접종여부</span>
							<div class="input-group-text">
								<input type="radio"
									aria-label="radio for following text input" name="medi" value="YES">
							</div>
							<input type="text" class="col-md-3 form-control"
								aria-label="Text input with checkbox" 
								 value="YES">
							<div class="input-group-text">
								<input type="radio"
									aria-label="radio for following text input" name="medi" value="NO">
							</div>
							<input type="text" class="col-md-3 form-control"
								aria-label="Text input with checkbox" 
								 value="NO">
						</div>
					</div>
                                
					<br>

					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text">중성화</span>
							<div class="input-group-text">
								<input type="radio"
									aria-label="radio for following text input" name="neu" value="YES">
							</div>
							<input type="text" class="col-md-4 form-control"
								aria-label="Text input with checkbox"  
								 value="YES">
							<div class="input-group-text">
								<input type="radio"
									aria-label="radio for following text input" name="neu" value="NO">
							</div>
							<input type="text" class="col-md-4 form-control"
								aria-label="Text input with checkbox" 
								 value="NO">
						</div>
						<div class="input-group-prepend">
							<span class="offset-md-1 input-group-text">성별</span>
							<div class="input-group-text">
								<input type="radio"
									aria-label="radio for following text input" name="gen" value="여아">
							</div>
							<input type="text" class="col-md-3 form-control"
								aria-label="Text input with checkbox" 
								value="여아">
							<div class="input-group-text">
								<input type="radio"
									aria-label="radio for following text input" name="gen" value="남아">
							</div> 
							<input type="text" class="col-md-3 form-control"
								aria-label="Text input with checkbox" 
								value="남아">
						</div>
					</div>

					<br>
					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">제목</span> <input type="text"
								class="form-control" name="title" size="137" id="title" placeholder="제목 입력">
						</div>
					</div>

					<br>
					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">특이사항</span> <input
								type="text" class="form-control" name="descrip" size="133"
								id="descrip" placeholder="특이사항 입력">
						</div>
					</div>

					<br>
					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" style="align-content: center;">내용</span>
							<textarea name="content" id="summernote1" class="content"></textarea>
						</div>
					</div>

					<br>
					<div class="row">
						<input type="button" class=" offset-md-10 btn btn-outline-secondary" 
							style="width: 100px; background-color: #28A745; color: #fff" id="nextButton" value="next">
					</div>
				</div>


				<div class="form2">
					<div class="row">
						<button class="btn btn-outline-secondary" type="button" id="btn1"
							style="width: 100px; background-color: #28A745; color: #fff">prev</button>
					</div>
					<br>
					<div class="row">
						<span style=font-size:medium">작성자 인적사항</span>
					</div>
					<br>
					
					<%
						
						String sid = ((User)session.getAttribute("current_user")).getEmail();
					%>

					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">아이디</span> <input
								type="text" class="form-control" size="20" name="Tid"
								placeholder="이름" value="<%=sid %>" readonly="readonly" style="background-color: #fff">
							&nbsp;&nbsp;&nbsp; 
							
							<img src="img/kakaotalk.jpg"  width="40" height="40">
							<input type="text" class="form-control" size="20" name="contact"
								placeholder="카톡아이디 및 전화번호" id="contact">
							<button class="btn btn-outline-secondary" type="button" id="contactbutton">인증하기</button>
						</div>
					</div>

					<br>
					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" style="align-content: center;">기타사항</span>
							<textarea name="desc" id="summernote2" class="description"></textarea>
						</div>
					</div>

					<br>

					<div class="row">		
						<input type="hidden" name="pic1" value="" id="pic1"/>				
						<input type="button" class=" offset-md-10 btn btn-outline-secondary" 
						style="width: 90px; background-color: #28A745; color: #fff" id="finalButton" value="완료">
					</div>
				</div>		

			</div>
		</div>
	</form> 


	</main>

    <footer class="text-muted">
      <div class="container">
        <p class="float-right">
          <a href="#">Back to top</a>
        </p>
        <p>Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
        <p>New to Bootstrap? <a href="../../">Visit the homepage</a> or read our <a href="../../getting-started/">getting started guide</a>.</p>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
	<%@include file="./layout/sendmaster.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	$('.form2').hide();
	//$("#finalButton").hide();
	
    $('#summernote1').summernote({
    	width: 1045,
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true,                  // set focus to editable area after initializing summernote
            lang: 'ko-KR',
	    		callbacks: {
	    			onImageUpload: function(files, editor, welEditable) {
	    			      sendFile(files[0], this); 
	    			},	
	    		},
	    		toolbar: [
	    			['style', ['bold', 'italic', 'underline', 'clear']],
	    			['font', ['strikethrough', 'superscript', 'subscript']],
	    			['fontsize', ['fontsize']],
	    			['color', ['color']],['para', ['ul', 'ol', 'paragraph']], 
	    			['height', ['height']],
	    			['insert', ['picture']]
	    		]
    });
    
    $('#summernote2').summernote({
    	width: 1000,
    	height: 300,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true,                  // set focus to editable area after initializing summernote
        lang: 'ko-KR',
		callbacks: {
			onImageUpload: function(files, editor, welEditable) {
			      sendFile(files[0], this); 
			},	
		},
		toolbar: [
			['style', ['bold', 'italic', 'underline', 'clear']],
			['font', ['strikethrough', 'superscript', 'subscript']],
			['fontsize', ['fontsize']],
			['color', ['color']],['para', ['ul', 'ol', 'paragraph']], 
			['height', ['height']],
			['insert', ['picture']]
		]
    });
    

	sendMasterTableSet();
	
	
       
});

    function sendFile(file, editor) {
		formdata = new FormData();
		formdata.append("userImage", file);
		
		
		$.ajax({
		data: formdata,
		type: "POST", 
		url: '${initParam.IMG_SERVER_PATH}/upload',
		cache: false,
		contentType: false,
		processData: false,
		success: function(data) {
			console.log(data);
			var url = '${initParam.IMG_SERVER_PATH }/image/'+data.filename;
			
			if($('#pic1').val() == ''){
				$('#pic1').val(url);
			}
			
			alert(url);
			$('#hello').html(url);
			$(editor).summernote('editor.insertImage', url);
			$('#imageDiv > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
	        }
		});
	}
    
    $("#btnBack").click(function(){
   	 location.href="AnimalBbsController?command=animlist";
	 });
    
    $('#nextButton').click(function () { 

    	var name =$("#name").val();
    	var age = $("#age").val();
    	var kinds = $("#kinds").val();
    	var target = document.getElementById("inputGroupSelect01");
        var type = target.options[target.selectedIndex].value;     // 옵션 value 값
    	var location =$("#sample4_roadAddress").val(); 
        var medi = $(":input:radio[name=medi]:checked").val();
        var neu = $(":input:radio[name=neu]:checked").val();
        var gen = $(":input:radio[name=gen]:checked").val();
        var title = $("#title").val();
        var descrip = $("#descrip").val();
		var content = $(".content").val();
		
		if(name === ""){
			alert("이름을 입력해주십시오"); 
			$("#name").focus();
			return;
		}else if(age === ""){
			alert("나이을 입력해주십시오"); 
			$("#age").focus();
			return;
		}else if(kinds === ""){
			alert("묘/견종을 입력해주십시오"); 
			$("#kinds").focus();
			return;
		}else if(location === ""){
			alert("지역을 입력해주십시오"); 
			$("#locationBtn").focus();
			return;
		}else if($(":radio[name=medi]:checked").length == 0){
			alert("접종여부를 선택해주십시오"); 
			$("#medi").focus();
			return;
		}else if($(":radio[name=neu]:checked").length == 0){
			alert("중성화를 선택해주십시오"); 
			$("#neu").focus();
			return;
		}else if($(":radio[name=gen]:checked").length == 0){
			alert("성별을 선택해주십시오"); 
			$("#gen").focus();
			return;
		}else if(title === ""){
			alert("제목을 입력해주십시오"); 
			$("#title").focus();
			return;
		}else if(descrip === ""){
			alert("특이사항을 입력해주십시오"); 
			$("#descrip").focus();
			return;
		}else if(content === ""){
			alert("내용을 입력해주십시오"); 
			$("#content").focus();
			return;
		}
		else{			
			$('.form2').show(1000);
			$('.form1').hide(1000);
		} 
	});
    $('#btn1').click(function () {    	
		$('.form1').show(1000);
		$('.form2').hide(1000);
	});
    
    $("#contactbutton").click(function () {
		var contact =$("#contact").val();
		
		if(contact === ""){
			alert("연락처를 입력해주십시오");
			$("#contact").focus();
		}else{
			alert  ("인증완료");
			$(".description").focus();
		}
	});
    
    $("#finalButton").click(function () {
		var contact =$("#contact").val();
		
		if(contact === ""){
			alert("연락처를 입력해주십시오");
			$("#contact").focus();
			return;
		}else{
			$("#form").submit();
		}
	});


		$('.menu-item').on('mouseover', function () {
			$(this).css('background', 'green').css('border', '1px solid green').css('border-radius', '15px');
			$(this).children('.nav-link').css('color', 'white');
				
		});
		$('.menu-item').on('mouseout', function () {
			$(this).css('background', '').css('border', '1px solid white').css('border-radius', '5px');
			$(this).children('.nav-link').css('color', 'white');
		});
	</script>
	



<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
               	// 동까지 출력
               	if(fullRoadAddr != ""){
               		
               	}
                

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
               // document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
               // document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
  </body>
</html>
