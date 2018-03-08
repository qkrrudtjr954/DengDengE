<%@page import="dto.BookDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.User"%>
<%@page import="dto.AnimalBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <style type="text/css">
    #btnLike{
     background: url(button_search.png) no-repeat;
     border: none;
     outline: none;
    }
    
    </style>

  </head>

  <body>
  <%
AnimalBbsDto aniBbsDto = (AnimalBbsDto)request.getAttribute("aniBbsDto");
System.out.println(aniBbsDto.toString());
%>
<%
// 숫자값 -> 문자
String m = null;
String n = null;
String g = null;
if(aniBbsDto != null){
      int  medi = aniBbsDto.getMedicine();
      int neu = aniBbsDto.getNeutralization();
      int gen = aniBbsDto.getGender();

      if(medi == 1){
         m = "YES";
      }else {
         m = "NO";
      }

      if(neu == 1){
         n = "YES";
      }else {
         n = "NO";
      }
      if(gen == 1){
         g = "여아";
      }else {
         g = "남아";
      }
   }
%>
<%!
	public String toDate(String mdate){
	String s = mdate.substring(2, 4) + "/"    // yyyy
	         + mdate.substring(5, 7) + "/"   // MM
	         + mdate.substring(8, 10);    // dd
	return s;
	}

%>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand offset-md-2" href="#">DengDengE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav offset-md-7">
					<c:choose>
						<c:when test="${current_user == null }">
							<!-- 로그인 안했을 때 -->
							<li class="nav-item"><a class="nav-link"
								href="UserControl?command=goSignIn">로그인</a></li>
							<li class="nav-item"><a class="nav-link"
								href="UserControl?command=goSignUp">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<!-- 로그인 했을 때 -->
							<li class="nav-item"><a class="nav-link"
								href="UserControl?command=signout">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link"
								href="UserControl?command=myPage">마이 페이지</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
	</header>
	<main role="main">

	<section class="jumbotron text-center">
		<div class="container">
			<h1 class="jumbotron-heading">믿고 맡기는 분양센터</h1>
			<p class="lead text-muted">새로운 가족을 찾는 아이들과 
			갈 곳이 없어진 불쌍한 아이들을 <br> 당신의 곁으로 데려가 주세요</p>
			<p>
				<a href="AnimalBbsController?command=animlist" class="btn btn-success my-2">분양 동물 보러가기</a>
			</p>
		</div>
	</section>
	<%@include file="./layout/menubar.jsp" %>


		<div class="album py-5 bg-light">
        <div class="container">

            <div class="row">
               <h1>댕댕이의  보호동물</h1>
            </div>
             <hr>

            <br>

            <div class="row">
            	<div class="col-md-2" align="right">
					<div class="p-3 mb-2 bg-success text-white"
									style="text-align: center;">
									<b><%=aniBbsDto.getType()%></b>
					</div>
				</div>
				<div class="col-md-9">
					<p><h4><%=aniBbsDto.getTitle() %></h4></p>
				</div>
				<div class="offset-md-10 col-md-2">							
					<button type="button" id="btnBack" class="offset-md-12 btn btn-outline-secondary">돌아가기</button>						
				</div>

            </div>
            <hr>
            <div class="row">
            		  <div class="col-md-7">
            		  <b>-<%=aniBbsDto.getLocation() %></b>

            		  </div>
            		  <div class="col-md-5">
							<p>
								<b>작성자</b>
								<%=aniBbsDto.getUser_email()%>
								&nbsp;&nbsp;&nbsp;<b>작성일</b>
								<%=toDate(aniBbsDto.getReg_date())%>&nbsp;&nbsp;&nbsp;<b> 조회수 </b>
								<%=aniBbsDto.getReadcount()%>&nbsp;
							</p>
						</div>
			</div>
			<br>
			<br>
            <div class="row" style="margin: 0 auto; width: 900px;">
               <h4 class="offset-md-5">보호동물정보</h4>
            </div>

            <div class="row" style="margin: 0 auto; width: 900px;">
               <table align="center" border="0" cellpadding="0" cellspacing="0"
                  class="__se_tbl"
                  style="border-width: 1px 1px 0px 0px; text-align: center; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid;">
                  <tbody>
                     <tr>

                        <td
                           style="border-width: 0px 0px 1px 1px; width: 167px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);">
                           <div style="text-align: center;">
                              <span
                                 style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;묘종/견종</span>
                           </div>
                        </td>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 298px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);">
                           <div style="text-align: center;">
                              <span
                                 style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;<%=aniBbsDto.getKinds() %></span>
                           </div>
                        </td>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 155px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);">
                           <div style="text-align: center;">
                              <span
                                 style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">나이&nbsp;</span>
                           </div>
                        </td>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 311px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;"><%=aniBbsDto.getAge() %>&nbsp;</span>
                           </div></td>
                     </tr>
                     <tr>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 167px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;성별</span>
                           </div></td>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 298px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;<%=g %></span>
                           </div></td>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 155px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">분류&nbsp;</span>
                           </div></td>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 311px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;"><%=aniBbsDto.getType() %>&nbsp;</span>
                           </div></td>
                     </tr>
                     <tr>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 167px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;접종유무</span>
                           </div></td>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 298px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;<%=m %></span>
                           </div></td>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 155px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;중성화</span>
                           </div></td>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 311px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;"><%=n %>&nbsp;
                              </span>
                           </div></td>
                     </tr>
                     <tr>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 167px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;이름</span>
                           </div></td>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 298px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;<%=aniBbsDto.getName() %></span>
                           </div></td>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 155px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;특이사항</span>
                           </div></td>
                        <td
                           style="border-width: 0px 0px 1px 1px; width: 311px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
                              style="text-align: center;">
                              <span
                                 style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;"><%=aniBbsDto.getDescripttion() %>&nbsp;</span>
                           </div></td>
                     </tr>
                  </tbody>
               </table>
            </div>

            <%
               String id = ((User)session.getAttribute("current_user")).getEmail();
               boolean bookS = (boolean) request.getAttribute("bookS");
            %>
            
            <br>
         <%
            if (aniBbsDto.getUser_email().equals(id)) {
               System.out.println(aniBbsDto.getDel());
         %>
            <div class="row">
               <button type="button" class="offset-md-5 btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="<%=aniBbsDto.getUser_email()%>">분양예약리스트</button>
                  
            </div>
         <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="exampleModalLabel">예약리스트</h5>
                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                        <div class="form-group">
                           <label for="recipient-name" class="col-form-label">예약리스트:</label>
                              <table class="table">
                                 <c:choose>
                                    <c:when test="${aniBbsDto.del == 200 }">
                                       <c:forEach items="${booking }" var="item" varStatus="i">
                                             <tr>
                                                <td width="200" class="tdVal">${item.user_email}</td>
                                                <td>
                                                <!-- 예약확정 -->
                                                   <c:choose>
                                                      <c:when test="${item.user_email eq  aniBbsDto.complete_email}">                                                         
                                                         <button class="btn btn-outline-primary"style="background-color: #28A745; color: #fff" id="bookBtn">분양확정</button>
                                                      </c:when>
                                                      <c:otherwise>
                                                         <button class="btn btn-outline-secondary disabled" style="background-color: #28A745; color: #fff" id="bookBtn">reserve</button>
                                                      </c:otherwise>
                                                   </c:choose>
                                                   
                                                </td>
                                             <tr>
                                       </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                       <c:forEach items="${booking }" var="item" varStatus="i">
                                          <tr>
                                             <td width="200" class="tdVal">${item.user_email}</td>
                                             <td>
                                                <button onclick="getListTest('${item.user_email}')" class="btn btn-outline-secondary "style="background-color: #28A745; color: #fff" id="bookBtn">reserve</button>
                                             </td>
                                          <tr>
                                    </c:forEach>
                                    </c:otherwise>
                                 </c:choose>
                              </table>                           
                        </div>
                  </div>
                  
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">Close</button>
                  </div>
               </div>
            </div>
         </div>
         
         <%
            
            }else if(aniBbsDto.getDel() == 200){
               %>
               <script type="text/javascript">
                   //alert("200");
                   $("button").hide();
                  $("#Sbtn").hide();
                  $("#Nbtn").hide();
               </script>
            <%
         }      
            else{
               
               %>
                  <form action="BookController" method="post">
               <input type="hidden" name="command" value="add"> <input
                  type="hidden" name="seq" value="<%=aniBbsDto.getSeq() %>">
               <div class="row">
               <%
                  if(bookS){
                     %>
                        <button type="button" class="offset-md-5 btn btn-primary" id="Sbtn"
                        >분양예약완료</button>
                     <%
                  }else  if(!bookS){
                     %>
                        <button type="button" class="offset-md-5 btn btn-primary"
                     data-toggle="modal" data-target="#exampleModal"
                     data-whatever="<%=id%>" id="Nbtn">분양예약하기</button>
                     <%                  
                  }
               %>
                  
               </div>
               <div class="modal fade" id="exampleModal" tabindex="-1"
                  role="dialog" aria-labelledby="exampleModalLabel"
                  aria-hidden="true">
                  <div class="modal-dialog" role="document">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                           <button type="button" class="close" data-dismiss="modal"
                              aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <div class="modal-body">
   
                           <input type="hidden" name="command" value="add"> <input
                              type="hidden" name="seq" value="<%=aniBbsDto.getSeq()%>">
                           <div class="form-group">
                              <label for="recipient-name" class="col-form-label">UserEmail:</label>
                              <input type="text" class="form-control" id="recipient-name"
                                 name="email">
                           </div>
                           <div class="form-group">
                              <label for="message-text" class="col-form-label">Message:</label>
                              <textarea class="form-control" id="message-text" name="text"></textarea>
                           </div>
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-secondary"
                              data-dismiss="modal">Close</button>
                           <input type="submit" class="btn btn-primary" value="Booking">
                        </div>
                     </div>
                  </div>
               </div>
            </form>               
            
            <%
         }
      %>
         <br>
            
            <div class="row" style="margin: 0 auto; width: 1000px;">
               <span>
                  <%=aniBbsDto.getContent() %>
               </span>
            </div>
            
<hr>            
<!-- 댓글 달기/ 좋아요 -->

<div class="col-md-4" id="likeArea"><button type="button" id="btnLike" >
   <img src="${ isLiked == true ? './img/heart.png' : './img/empty_heart.png' }" id="like_img" height="50px" width="50px"></button>
   <span id="like_count">${like_count }</span>&nbsp;&nbsp;&nbsp;
    <img src="./img/comment_1.png" height="30px" width="30px">&nbsp;&nbsp;&nbsp;&nbsp;
	<span id="commentCount">${comments.size() }</span>
</div>



<!-- 댓글 달기/ 좋아요 끝 -->
			<div class="row">
			<div class="offset-md-1 col-md-8">
				<input type="text" class="form-control" name="content" id="content0" size="90" placeholder="댓글을 입력해주세요"> 
			</div>
			<div class="col-md-2">
				<input type="button" class="btn btn-outline-success" value="comment" onclick="addComment(${aniBbsDto.seq}, 0, 0, 0)">
			</div>
			</div>
			<br><br>
				<div class="comment-area">
					<c:forEach begin="0" items="${comments }" var="comment" varStatus="i">
						<div class="row">
							<div class="comment-email col-md-2" style="height: 50px;">
							<img src="./img/user.png" width="30">&nbsp;
								${comment.user_email }
							</div>
							<div class="comment-box col" style="height: 50px;">
								<div class="row">
									<div class="col-md-${comment.depth }" style="height:50px;text-align:right;">
								<c:choose>
								    <c:when test="${comment.depth ==1}">
								    </c:when>	
								    <c:otherwise>
								      	<img src="./img/arrow.png" width="24">
								    </c:otherwise>
								</c:choose>
									</div>
									<div class="col comment-content">
										${comment.content }
									</div>
								</div>
							</div>
							<div class="comment-date col-md-1" style="height: 50px;">
								<fmt:parseDate value="${comment.reg_date }" pattern="yyyy-MM-dd HH:mm:ss.S" var="tempRegDate"/>
								<fmt:formatDate value="${tempRegDate }" pattern="yyyy/MM/dd" var="regDate"/>
								<font size="2em" color="#696969">${regDate }</font>
							</div>
							
							<div class="comment-email col-md-1" style="height: 50px;">
								<input type="button" value="comment" class="btn btn-outline-success"  id="showComment" onclick="showCommentArea(this)">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="delBtn"onclick="deleteComment(${comment.seq}, ${comment.ref })"><font size="2em" color="#696969"><u>삭제</u></font></button>
							</div>
							

							<div class="comment-input col-md-12" style="display:none;margin-top:10px;">
								<input type="text"  name="content" class="form-control col" id="content${i.index+1 }" size="80">
								<input type="button" class="btn btn-outline-success col" value="comment" onclick="addComment(${aniBbsDto.seq}, ${comment.step }, ${comment.depth }, ${i.index+1 })" >
							</div>
						</div>
						<hr>
					</c:forEach>

			</div>


				<%
					String sid = ((User)session.getAttribute("current_user")).getEmail();
				%>

				<br>
				<%if(aniBbsDto.getUser_email().equals(sid)){
					%>
					<div class="row">
						<a href="AnimalBbsController?command=update&seq=<%=aniBbsDto.getSeq() %>" class="offset-md-5 btn btn-success"
						style="background-color: #28A745; color: #fff">수정하기</a>
						&nbsp;&nbsp;
						<a href="AnimalBbsController?command=delete&seq=<%=aniBbsDto.getSeq() %>"
						class="btn btn-outline-secondary">삭제하기</a>
					</div>
					<%
				}
				%>			
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
   
<script type="text/javascript">
$('#exampleModal').on('show.bs.modal', function (event) {

	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('Booking:'+recipient)
	  modal.find('.modal-body input').val(recipient)
	  $("#message-text").focus();
	});

</script>

<script type="text/javascript">


	function getListTest(user_email) {
		//alert("click");
		$.ajax({
			url : 'BookController',
			type : 'post',
			data : {listseq : <%=aniBbsDto.getSeq() %>, command : 'finalBook',    email : user_email},
			success  : function (data) {
				alert("예약확정완료");
				location.href="AnimalBbsController?command=animlist";
			},  
			error : function(request,status,error) {
				alert("예약확정실패");
				location.href="AnimalBbsController?command=animlist";
			}
		});		
	};


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
      
      $("#btnBack").click(function () {
          location.href="AnimalBbsController?command=animlist";

      });
      
      $('#btnLike').click(function ()  {
         
         $.ajax({
            url:"AnimalBbsController",
            data: {command: 'like', seq: ${aniBbsDto.seq }, userid: ${current_user.seq }},
            type:"post",
            success : function (data) {
               
               var result = JSON.parse(data);
               
               if(result.status == 404){
                  $('img#like_img').attr('src', './img/empty_heart.png');
               } else {
                  $('img#like_img').attr('src', './img/heart.png');
               }
               
               $('span#like_count').html(result.like_count);
            }
         });
      });
      
      
      function showCommentArea(commentArea) {
  	 	var dom = $(commentArea).parent().parent().find('.comment-input');

  	 	if(dom.css('display') == 'none'){
	    	 	$(commentArea).parent().parent().find('.comment-input').css('display', 'block');
  	 	} else {
  	 		$(commentArea).parent().parent().find('.comment-input').css('display', 'none');
  	 	}
	};

   function addComment(ref, step, depth, index) {
			$.ajax({
				url : 'AnimalCommentController',
				method : 'POST',
				data : { command : 'addComment', ref : ref, step : step, depth : depth, content : $('#content'+index).val() },
				success : function (data) {

					$('.comment-area').children().remove();

					var comments = JSON.parse(data);

					$('#commentCount').html(comments.length);
					for(var i= 0; i < comments.length; i++){

						printCommentHtml(comments[i], (i+1));

					}
					$('#content0').val("");
				}
			})
		}

		function printCommentHtml(comment, index) {
			var html =
				'<div class="row">'+
					'<div class="comment-email col-md-2" style="height: 50px;">'+
						'<img src="./img/user.png" width="30">&nbsp;'+
							comment.user_email+
					'</div>'+
					'<div class="comment-box col" style="height: 50px;">'+
						'<div class="row">'+
							'<div class="col-md-'+comment.depth+'" style=" height:50px;text-align:right;">'+
								depthTest(comment.depth)+
							'</div>'+
							'<div class="col comment-content">'+
								comment.content+
							'</div>'+
						'</div>'+
					'</div>'+
					'<div class="comment-date col-md-1" style="height: 50px;">'+
						'<font size="2em" color="#696969">'+dateTest(comment.reg_date)+'</font>'+
					'</div>'+
					'<div class="comment-email col-md-1" style="height: 50px;">'+
						'<input type="button" value="comment" class="btn btn-outline-success"  id="showComment" onclick="showCommentArea(this)">'+
						'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
						'<button id="delBtn" onclick="deleteComment('+comment.seq+', '+comment.ref+')"><font size="2em" color="#696969"><u>삭제</u></font></button>'+
						'</div>'+
					'<div class="comment-input col-md-12" style="display:none;margin-top:10px;">'+
						'<input type="text" name="content" class="form-control col" id="content'+index+'" size="80">'+
						'<input type="button" value="comment" class="btn btn-outline-success col"  onclick="addComment(${aniBbsDto.seq}, '+comment.step+', '+comment.depth+', '+index+')">'+
					'</div>'+
				'</div>'+
				'<hr>';
				console.log(html);
				$('.comment-area').append(html);
		}

		
		function depthTest(depth) {
			if(depth == 1) return '&nbsp;';
			else return '<img src="./img/arrow.png" width="24">';
		}
		
		function dateTest(date) {
			var date = new Date(date);
			

			var result =date.getFullYear()+'/'+
	        ((date.getMonth()+1)<10 ? '0'+(date.getMonth()+1) : (date.getMonth()+1))+'/'+
	        (date.getDate()<10 ? '0'+date.getDate() : date.getDate() ) ;
			return result;
		}
		function deleteComment(seq, ref) {
			$.ajax({
				url : 'AnimalCommentController',
				data : {command: 'deleteComment', seq : seq, ref : ref},
				method : 'POST',
				success : function (data) {
					if(data == "false"){
						alert('본인만 삭제가 가능합니다.');
					} else {
						
						$('.comment-area').children().remove();

						var comments = JSON.parse(data);

						for(var i= 0; i < comments.length; i++){

							printCommentHtml(comments[i], (i+1));

						}
					}
				}
			})
		}
		

      
   </script>


  </body>
</html>