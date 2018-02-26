<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AnimalBbswrite.jsp</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
</head>
<body>
<h1>입양하기 글작성</h1>
<br><br><br><br>
<a href="AnimalBbsController?command=animlist">list</a>
<hr>

<form action="AnimalBbsController" method="post">
<input type="hidden" name="command" value="writeAf">
<table border="1" style="margin-left: auto; margin-right: auto;">
<col width="100"><col width="100"><col width="100"><col width="100">
<col width="100"><col width="150"><col width="100"><col width="150">
<col width="100"><col width="100">
<tr align="center">
	<td>이름</td>
	<td>
		<input type="text" name="name" size="20">
	</td>
	<td>나이</td>
	<td>
		<input type="number" name="age">
	</td>
	<td>견종</td>
	<td>
		<input type="text" name="kinds" size="20">
	</td>
	<td>분류</td>
	<td>
		<select name="type">
			<option value="유기견">유기견</option>
			<option value="개인분양">개인 분양</option>
			<option value="etc">etc</option>
		</select>
	</td>
	
	<td>지역</td>
	<td>
		<input type="button" onclick="sample4_execDaumPostcode()" value="click">
		<input type="text"name="location" id="sample4_roadAddress" placeholder="도로명주소">
	</td> 
</tr>

<tr align="center">
	<td>예방접종</td>
	<td>
		<input type="radio" name="medi" value="1">YES
		<input type="radio" name="medi" value="0">NO
	</td>
	<td>중성화</td>
	<td>
		<input type="radio" name="neu" value="1">YES
		<input type="radio" name="neu" value="0">NO
	</td>
	<td>성별</td>
	<td>
		<input type="radio" name="gen" value="1">여자
		<input type="radio" name="gen" value="0">남자
	</td>
</tr>

<tr align="center">
	<td>제목</td>
	<td colspan="10">
		<input type="text" name="title" size="175">
	</td>
</tr>

<tr align="center">
	<td>특이사항</td>
	<td colspan="10">
		<input type="text" name="descrip" size="175">
	</td>
</tr>

<tr>
	<td>내용</td>
	<td colspan="10">
		<textarea rows="20" cols="180" name="content" id="summernote1"></textarea>
	</td>
</tr>
</table>
<br>

<h4 style="text-decoration: underline;">작성자 인적사항</h4>
<table border="1" style="margin-left: auto; margin-right: auto;">
<col width="100"><col width="150">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="id" value="<%="id" %>" readonly="readonly">
	</td>
</tr>

<tr>
	<td>연락처</td>
	<td>
		<input type="text" name="contact">&nbsp;&nbsp;&nbsp;<input type="submit" value="인증하기" class="btn">
	</td>
</tr>

<tr>
	<td>기타사항</td>
	<td>
		<textarea rows="20" cols="180" name="desc" id="summernote2"></textarea>
	</td>
</tr>

<tr align="right">
	<td colspan="11">
		<input type="submit" value="글등록">
	</td>
</tr>
</table>
</form>



<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>


<script type="text/javascript">
$(document).ready(function() {
    $('#summernote1').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
    
    
    $('#summernote2').summernote({
    	width: 1200,
    	height: 300,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true                  // set focus to editable area after initializing summernote
    	
    });
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