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
	<header>
		    <nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand offset-md-2" href="#">DengDengE</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav offset-md-7">
						<c:choose>
							<c:when test="${current_user == null }">
							<!-- 로그인 안했을 때 -->
							<li class="nav-item">
								<a class="nav-link" href="UserControl?command=goSignIn">로그인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="UserControl?command=goSignUp">회원가입</a>
							</li>
						</c:when>
						<c:otherwise>
							<!-- 로그인 했을 때 -->
							<li class="nav-item">
								<a class="nav-link" href="UserControl?command=signout">로그아웃</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="UserControl?command=myPage">마이 페이지</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
   </header>	    
    <main role="main">

      <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">Album example</h1>
          <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don't simply skip over it entirely.</p>
          <p>
            <a href="#" class="btn btn-success my-2">Main call to action</a>
          </p>
        </div>
      </section>
      <section>
	      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	        <ul class="nav menu justify-content-center">
			  <li class="nav-item menu-item">
			    <a class="nav-link active " href="#">Active</a>
			  </li>
			  <li class="nav-item menu-item">
			    <a class="nav-link" href="#">Link</a>
			  </li>
			  <li class="nav-item menu-item">
			    <a class="nav-link" href="#">Link</a>
			  </li>
			  <li class="nav-item menu-item">
			    <a class="nav-link" href="#">Disabled</a>
			  </li>
			</ul>
  		</nav>
      </section>
	<form action="AnimalBbsController">
		<input type="hidden" name="command" value="writeAf">
		<div class="row">
			<a href="AnimalBbsController?command=animlist">list</a>
		</div>

		<div class="album py-5 bg-light">
			<div class="container">
				<div class="form1">
				
					<div class="row">
						<h4 style="text-decoration: underline;" class="offset-md-5">입양하기 글 작성</h4>
					</div>

					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">이름</span> 
							<input type="text" class="form-control" size="20" name="name" placeholder="이름">
						</div>

						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text" id="">나이</span> 
							<input type="number" class="form-control" size="20" name="age" placeholder="나이">
						</div>

						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text">묘/견종</span> 
							<input type="text"	class="form-control" size="20" name="kinds" placeholder="묘/견종">
						</div>

						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<label class="input-group-text" for="inputGroupSelect01">분류</label>
						</div>
						<select class="custom-select" id="inputGroupSelect01" style="width: 200px" name="type">
							<option selected>choice</option>
							<option value="유기견">유기견</option>
							<option value="개인분양">개인분양</option>
							<option value="etc">etc</option>
						</select>
					</div>

					<br>

					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text">주소</span> 
							<input type="text"	class="form-control" size="50" name="location"	id="sample4_roadAddress" placeholder="도로명주소">
							<button class="btn btn-outline-secondary" type="button"
								onclick="sample4_execDaumPostcode()">주소찾기</button>
						</div>
					</div>

					<br>

					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text">접종여부</span>
							<div class="input-group-text">
								<input type="checkbox"
									aria-label="Checkbox for following text input">
							</div>
							<input type="text" class="form-control" aria-label="Text input with checkbox" 
							name="medi" size="2" value="YES">
							<div class="input-group-text">
								<input type="checkbox" aria-label="Checkbox for following text input">
							</div>
							<input type="text" class="form-control"
								aria-label="Text input with checkbox" name="medi" size="2" value="NO">
						</div>


						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text">중성화</span>
							<div class="input-group-text">
								<input type="checkbox" aria-label="Checkbox for following text input">
							</div>
							<input type="text" class="form-control" aria-label="Text input with checkbox" name="neu" size="2"
								value="YES">
							<div class="input-group-text">
								<input type="checkbox" aria-label="Checkbox for following text input">
							</div>
							<input type="text" class="form-control" aria-label="Text input with checkbox" name="neu" size="2"
								value="NO">
						</div>

						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text">성별</span>
							<div class="input-group-text">
								<input type="checkbox" aria-label="Checkbox for following text input">
							</div>
							<input type="text" class="form-control" aria-label="Text input with checkbox" name="gen" size="2"
								value="여아">
							<div class="input-group-text">
								<input type="checkbox" aria-label="Checkbox for following text input">
							</div>
							<input type="text" class="form-control" aria-label="Text input with checkbox" name="gen" size="2"
								value="남아">
						</div>
					</div>

					<br>
					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">제목</span> 
							<input type="text"	class="form-control" name="title" size="135" placeholder="제목 입력">
						</div>
					</div>

					<br>
					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">특이사항</span> 
							<input type="text" class="form-control" name="descrip" size="130" placeholder="특이사항 입력">
						</div>
					</div>

					<br>
					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" style="align-content: center;">내용</span>
							<textarea name="content" id="summernote1"></textarea>
						</div>
					</div>

					<br>
					<div class="row">
						<button class="offset-md-10 btn btn-outline-secondary"
							type="button" id="btn" style="width: 100px">next</button>
					</div>

				</div>
				<br> <br>

				<div class="form2">
					<div class="row">
						<h4 style="text-decoration: underline;" class="offset-md-5">작성자 인적사항</h4>
					</div>

					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">아이디</span> 
							<input type="text" class="form-control" size="20" name="Tid" placeholder="이름" value="로그인한 유저 id" readonly="readonly"> 
							&nbsp;&nbsp;&nbsp;
							<span class="input-group-text" id="">연락처</span> 
							<input type="text" class="form-control" size="20" name="contect" placeholder="연락처">
							<button class="btn btn-outline-secondary" type="button">인증하기</button>
						</div>
					</div>

					<br>
					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" style="align-content: center;">기타사항</span>
							<textarea name="desc" id="summernote2"></textarea>
						</div>
					</div>
					
					<br>
					<div class="row">
						<input type="submit" class="offset-md-10 btn btn-outline-secondary" style="width: 100px" value="글등록">
						</div>
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
	
<script type="text/javascript">
$(document).ready(function() {
	$('.form2').hide();
	
    $('#summernote1').summernote({
    	width: 1000,
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
    
    $('#summernote2').summernote({
    	width: 1000,
    	height: 300,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true                  // set focus to editable area after initializing summernote
    	
    });
    
    $('#btn').click(function () {
		$('.form2').show();
		$('.form1').hide();
	})
    
    
});

</script>
	
	<script type="text/javascript">
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
