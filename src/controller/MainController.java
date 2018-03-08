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

import dto.SendMaster;
import dto.User;
import service.SendMasterService;

public class MainController extends HttpServlet{

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
		
		if(command.equals("start")) {
			resp.sendRedirect("main.jsp");
			
			
		}else if(command.equals("sendMsg")) {
			
			SendMasterService sendService = SendMasterService.getInstance();
			
			String Qtype = req.getParameter("Qtype");
			String title = req.getParameter("title");
			String email = req.getParameter("email");
			String content = req.getParameter("content");
			
			String Q_type = "";
			
			switch (Qtype) {
			case "1":
				Q_type = "분양 하기";
				break;
			
			case "2":
				Q_type = "입양 하기";
				break;
				
			case "3":
				 Q_type = "회원정보 문의";
				break;
			case "4":
				 Q_type = "제휴 문의";
				break;
			case "5":
				 Q_type = "기타 문의";
				break;
			}
			HttpSession session = req.getSession();
			User userInfo = (User)session.getAttribute("current_user");
			
			int target_user_seq = userInfo.getSeq();
			
			if(email.equals("")) {
				email = userInfo.getEmail();
			}
			
			System.out.println(Q_type + " " + title + " " + email + " " + content);
			
			
			SendMaster sendMaster = new SendMaster();
			sendMaster.setCategory(Q_type);
			sendMaster.setContent(content);
			sendMaster.setEmail(email);
			sendMaster.setTarget_user_seq(target_user_seq);
			sendMaster.setTitle(title);
			
			boolean isS = sendService.sendToMaster(sendMaster);
			
			if(isS) {
				System.out.println("메세지 전송 성공");
				resp.getWriter().write("success");
				
			}else{
				System.out.println("메세지 전송 실패");
				resp.getWriter().write("fail");
			}
		
			
		} else if( command.equals("getSendMaster")){
			
			HttpSession session = req.getSession();
			User userInfo = (User)session.getAttribute("current_user");
			
			if(userInfo != null) {
				SendMasterService sendMasterService = SendMasterService.getInstance();
				List<SendMaster> list = sendMasterService.getAllSendMaster(userInfo.getSeq());
				
				String json = new Gson().toJson(list);
				System.out.println(list);
				
				resp.getWriter().write(json);
			} else {
				resp.getWriter().write("login");
			}
			
		} else if(command.equals("getInquiry")) {
			
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt(sseq);
			
			SendMasterService sendMasterService = SendMasterService.getInstance();
			SendMaster result = sendMasterService.getInquiry(seq);
			
			String json = new Gson().toJson(result);

			resp.getWriter().write(json);
			
		} 
	}
	
	public void dispatcher(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(url);
		dispatch.forward(req, resp);
	}
}
