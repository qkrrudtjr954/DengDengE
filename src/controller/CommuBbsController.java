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
		}
	}
	//보내주는 함수
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		
		dispatch.forward(req, resp);
		
	}

}
