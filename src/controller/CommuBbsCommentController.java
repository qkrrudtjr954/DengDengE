package controller;

import java.io.IOException;
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
import dto.CommuBbsComment;
import dto.User;
import service.AfterCommentService;
import service.CommuBbsCommentService;

public class CommuBbsCommentController extends HttpServlet {

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
			CommuBbsCommentService service = CommuBbsCommentService.getInstance();
			
			if(Delegator.checkSession(req, resp)) {
				HttpSession session = req.getSession();
				User current_user = (User)session.getAttribute("current_user");
				
				int ref = Integer.parseInt(req.getParameter("ref"));
				int step = Integer.parseInt(req.getParameter("step"));
				int depth = Integer.parseInt(req.getParameter("depth"));
				String content = (String)req.getParameter("content");
				
				CommuBbsComment comment = new CommuBbsComment();
				comment.setContent(content);
				comment.setDepth(depth);
				comment.setRef(ref);;
				comment.setStep(step);
				comment.setTarget_user_seq(current_user.getSeq());
				comment.setUser_email(current_user.getEmail());
				
				List<CommuBbsComment> list = service.addComment(comment);
				
				String json = new Gson().toJson(list);
				
				resp.getWriter().write(json);
			}
		}else if(command.equals("deleteComment")) {
			// System.out.println("del");
			if(Delegator.checkSession(req, resp)) {
				HttpSession session = req.getSession();
				User current_user = (User)session.getAttribute("current_user");
				
				CommuBbsCommentService service = CommuBbsCommentService.getInstance();
				
				String sseq = req.getParameter("seq");
				int seq = Integer.parseInt(sseq);
				System.out.println("seq: " +seq);
				boolean check = service.beforeDeleteCheck(seq, current_user.getSeq());
				System.out.println("check: "+check);
				String json = "";
				
				if(check) {
					String sref = req.getParameter("ref");
					int ref = Integer.parseInt(sref);
					
					
					List<CommuBbsComment> list = service.deleteComment(seq, ref);
					
					json = new Gson().toJson(list);					
				} else {
					json = "false";
				}

				resp.getWriter().write(json);

			} 
		}
		
		
		
		
		
		
	}
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
	
	
	
	
	
	

}
