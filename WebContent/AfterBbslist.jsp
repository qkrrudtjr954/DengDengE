<%@page import="dto.AfterBbsDto"%>
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

    <!-- Custom styles for this template -->
    <link href="./css/main.css" rel="stylesheet">

    <%--list 구현 --%>
    <link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
    #container {
      width: 70%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }
     
    #list {
      text-align: center;
    }
   
    #write {
      text-align: right;
    }
     
    /* Bootstrap 수정 */
    .table > thead {
      background-color: #b3c6ff;
    }
    .table > thead > tr > th {
      text-align: center;
    }
    .table-hover > tbody > tr:hover {
      background-color: #e6ecff;
    }
    .table > tbody > tr > td {
      text-align: center;
    }
    .table > tbody > tr > #title {
      text-align: left;
    }
     
    div > #paging {
      text-align: center;
    }
     
    .hit {
      animation-name: blink;
      animation-duration: 1.5s;
      animation-timing-function: ease;
      animation-iteration-count: infinite;
      /* 위 속성들을 한 줄로 표기하기 */
      /* -webkit-animation: blink 1.5s ease infinite; */
    }
     
    /* 애니메이션 지점 설정하기 */
    /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
    @keyframes blink {
      from {color: white;}
      30% {color: yellow;}
      to {color: red; font-weight: bold;}
      /* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
    }
  </style>
    
    
    
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

      <div class="album py-5 bg-light">
        <div class="container">
        
			<div class="row">
			<h1 align="center">댕댕이 반려 동물 입양후기</h1>
			</div>
			
			<div class="row">
			<h3 align="center">회원님들의 생생한 입양 후기들</h3>
			</div>
			
		
 <%
List<AfterBbsDto> afterBbslist = (List<AfterBbsDto>)request.getAttribute("afterBbslist");
 
 for(int i=0;i<afterBbslist.size();i++){
		System.out.println(afterBbslist.get(i).toString());
	}
 
 %>
 
 <%
 String msg1 = (String)request.getAttribute("msg1");
 String msg2 = (String)request.getAttribute("msg2");
 
 
 if(msg1!=null){
 %>
 <script type="text/javascript">
 	alert("<%=msg1%>");
 
 </script>
 
 <%
 }else if(msg2!=null){
 %>
 
 <script type="text/javascript">
 	alert("<%=msg2%>");
 
 </script>
 
 <%
 }
 %>
 
 
 
 
 

<form name="searchform" method="get" action="AfterBbsController">
      <input type="hidden" name="command" value="AfterBbsSearch">
     <div class="row">
      
		<div class="input-group-prepend">
			<select class="custom-select" id="inputGroupSelect01" name="Searchtype" style="width: 150px">
			   <option selected>선택없음</option>
			   <option value="target_user_seq">글쓴이</option>
			   <option value="title">제목</option>
 			 </select>
    		<input type="text" class="form-control" aria-label="Text input with segmented dropdown button" size="30" name="SearchWord">
		</div>
		
		<div class="serach"text-align:center;">
		<!-- <button type="button" class="btn btn-success" onclick="">검색</button> -->
		<input type="submit" class="btn btn-success" value="검색">
		</div>
		
         
  	</div>
</form>


<div class="row">

<table class="table table-striped table-bordered table-hover">

	<thead>
          <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="10%">작성자</th>
            <th width="20%">작성일</th>
            <th width="10%">조회수</th>
          </tr>
    </thead>
    
    
    <%
if(afterBbslist == null || afterBbslist.size() == 0){
	%>
	<tr>
		<td colspan="5">작성된 글이 없습니다</td>
	</tr>	
	<%
}

for(int i = 0;i < afterBbslist.size(); i++){
	AfterBbsDto bbs = afterBbslist.get(i);
	%>
	<tr>
	<td><%=i+1 %></td>
	<td>
		
		<a href="AfterBbsController?command=AfterBbsDetail&seq=<%=bbs.getSeq() %>">
			<%=bbs.getTitle() %>
		</a>
		<%-- 조회수 가 20개가 넘어 갔을때 hit 문구 표시 --%>
		<%
		int redacount = bbs.getReadcond();
		
		if(redacount>=20){
		%>
		 <span class="hit">인기!</span>
		<%
		}
		%>
		
		
	</td>
	 <td><%=bbs.getUserSeq() %> </td>
	<td><%=bbs.getRdate() %></td> 
	<td><%=bbs.getReadcond() %></td>
	</tr>	
	<%
}
%>

</table>

</div>

<div class="row">

<div>


</div>



</div>

		
			
			
			
			
			
        </div>
      </div>

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
	<script type="text/javascript">
	
	
	
	
	
	</script>
	
	
	
	
	
  </body>
</html>