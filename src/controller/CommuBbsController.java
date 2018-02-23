package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommuBbsDao;
import dao.iCommuBbsDao;
import dto.CommuBbsDto;
import service.CommuBbsService;

public class CommuBbsController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CommuBbsService comService = CommuBbsService.getInstance();
	
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text./html; charset=utf-8"); 
		
		String command = req.getParameter("command");
		
		if(command.equals("list")) {
			
			List<CommuBbsDto> bbslist = comService.getCommulist();
			//짐 싸기
			req.setAttribute("bbslist", bbslist);
			
			//보내주기
			dispatch("CommuBbslist.jsp", req, resp);
			
		}else if(command.equals("write")) {
			dispatch("CommuBbsWrite.jsp", req, resp);
		}else if(command.equals("writeAf")){			
			//String id = req.getParameter("id");
			System.out.println("writeAf 들어옴");
			String Scategory = req.getParameter("category");
			int category = Integer.parseInt(Scategory);
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			System.out.println("category : " + Scategory);
			System.out.println("title : " + title);
			System.out.println("content : " + content);
			
			 boolean isS = comService.writeCommu(new CommuBbsDto(title, content, 1, category));
			 //유저 시퀀스 1 로 일단 설정해둠 
				System.out.println(isS);
				if(isS) {
					req.setAttribute("msg", "글 입력 성공!");
					dispatch("CommuBbsController?command=list", req, resp);
				}else {
					req.setAttribute("msg", "글을 다시 입력 하십시오");
					dispatch("CommuBbsWrite.jsp", req, resp);
				}
			 
		}
	}
	//보내주는 함수
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		
		dispatch.forward(req, resp);
		
	}

}
