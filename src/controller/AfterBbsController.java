package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AfterBbsDto;
import service.AfterBbsService;

public class AfterBbsController extends HttpServlet {

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
		AfterBbsService bbs = AfterBbsService.getInstance();
		AfterBbsDto dto = new AfterBbsDto();
		String command = req.getParameter("command");
		
		
		
		if(command.equals("AfterBbslist")) {
			
			List<AfterBbsDto> afterBbslist = bbs.getAfterlBbsList();
			req.setAttribute("afterBbslist", afterBbslist);
			
			dispatch("AfterBbslist.jsp", req, resp);
			
		}
		
		
	}
	
	
	
	
	
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
	
	
	
	
	
	
	

}
