package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dto.User;
import service.UserService;

public class UserController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text./html; charset=utf-8"); 
		
		String command = req.getParameter("command");

		if(command.equals("goSignIn")) {

			dispatcher("signin.jsp", req, resp);

		} else if(command.equals("goSignUp")) {

			dispatcher("signup.jsp", req, resp);

		} else if(command.equals("signup")) {
			boolean result = false;
			
 			String email = req.getParameter("email");
			String password1 = req.getParameter("password1");
			String password2 = req.getParameter("password2");
			
			if(email.contains("@") && password1.equals(password2)) {
				User user = new User(email, password1);
				UserService userService = UserService.getInstance();
				
				User returnUser = userService.addUser(user);
				
				if(returnUser.getSeq() != 0) {
					HttpSession session = req.getSession();
//					session.setMaxInactiveInterval(30*60);	// 30분 세션 제한 
					session.setAttribute("current_user", returnUser);
					
					result = true;
				}
			}
			
			if(result) {
				resp.sendRedirect("main.jsp");
			}else {
				req.setAttribute("notice", "회원 가입에 실패했습니다.");
				dispatcher("signup.jsp", req, resp);
			}
		} else if(command.equals("signout")) {

			HttpSession session = req.getSession();
			session.invalidate();
//			dispatcher("index.jsp", req, resp);
			resp.sendRedirect("main.jsp");

		} else if(command.equals("myPage")) {

		} else if(command.equals("signin")) {

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			User user = new User(email, password);

			UserService userService = UserService.getInstance();
			user = userService.getUserByEmailAndPassword(user);

			if(user.getSeq() != 0) {
				// 정상 로그인
				HttpSession session = req.getSession();
				session.setAttribute("current_user", user);
			}

			String json = new Gson().toJson(user);
			resp.getWriter().write(json);
			
		} else if(command.equals("checkEmail")) {
		    
			resp.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
		    resp.setCharacterEncoding("UTF-8"); // You want world domination, huh?
		    
		    String email = req.getParameter("email");
		    
		    UserService userService = UserService.getInstance();
			User result = userService.getUserByEmail(email);
			
			
			if(result.getSeq() != 0) {
				// result.getSeq()가 0이 아니면 아이디가 있는 것.
				//	아이디 사용 불가능 
				resp.getWriter().write("no");
			}else {
				// result.getSeq()가 0이면 아이디가 없는 것.
				//	아이디 사용 가능  
				resp.getWriter().write("yes");
			}
		}
	}

	public void dispatcher(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);
	}
}
