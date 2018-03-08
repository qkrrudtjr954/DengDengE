<%@ page pageEncoding="UTF-8"%>


<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand offset-md-1" href="#">DengDengE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav offset-md-9">
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
						<li class="nav-item">
							<a class="nav-link" href="UserControl?command=myPage">마이 페이지</a>
						</li>
						<li class="nav-item">
							<div class="dropdown show">
								<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
									<span data-feather="message-circle"></span>문의  
								</a>

								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
									<table class="table" id="sendMasterTable" style="width:600px">
										<thead>
											<tr>
												<th>No</th>
												<th>Title</th>
												<th>Status</th>
										</thead>
										<tbody>

										</tbody>
									</table>

								</div>
							</div>
						</li>
						
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
</header>

