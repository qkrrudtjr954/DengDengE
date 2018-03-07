package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import delegator.Delegator;
import dto.AfterCommentDto;
import dto.User;
import service.AfterCommentService;

public class AfterCommentController extends HttpServlet {
	
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String command = req.getParameter("command");
		
		if(command.equals("addComment")) {
			AfterCommentService service = AfterCommentService.getInstance();
			
			if(Delegator.checkSession(req, resp)) {
				HttpSession session = req.getSession();
				User current_user = (User)session.getAttribute("current_user");
			
				int ref = Integer.parseInt(req.getParameter("ref"));
				int step = Integer.parseInt(req.getParameter("step"));
				int depth = Integer.parseInt(req.getParameter("depth"));
				String content = (String)req.getParameter("content");
				
				
				
				AfterCommentDto comment = new AfterCommentDto();
				comment.setContent(content);
				comment.setDepth(depth);
				comment.setRef(ref);;
				comment.setStep(step);
				comment.setTarget_user_seq(current_user.getSeq());
				comment.setUser_email(current_user.getEmail());
				
				List<AfterCommentDto> list = service.addComment(comment);
				
				String json = new Gson().toJson(list);
				
				resp.getWriter().write(json);
			}
		}
		
	}
	
	
	
	
	
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
	
	
	
	
	

}
