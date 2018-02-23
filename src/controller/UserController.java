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
		String command = req.getParameter("command");

		if(command.equals("goSignIn")) {

			dispatcher("signin.jsp", req, resp);

		} else if(command.equals("goSignUp")) {

			dispatcher("signup.jsp", req, resp);

		} else if(command.equals("signout")) {

			HttpSession session = req.getSession();
			session.invalidate();
			dispatcher("index.jsp", req, resp);

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
			
		}
	}

	public void dispatcher(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);
	}
}
