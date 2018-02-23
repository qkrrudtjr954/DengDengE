package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AnimalBbsDto;
import service.AnimalBbsService;

public class AnimalBbsController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String command = req.getParameter("command");
		AnimalBbsService aniBbService = AnimalBbsService.getInatance();
		
		if(command.equals("animlist")) {
			List<AnimalBbsDto> animlist = aniBbService.getAnimalBbsList();
			
			req.setAttribute("animlist", animlist);
			dispatch("AnimalBbslist.jsp", req, resp);
		}
		else if(command.equals("detail")) {
			
		}
		else if(command.equals("write")) {
			// id
			dispatch("AnimalBbswrite.jsp", req, resp);
		}
		else if(command.equals("writeAf")) {
			// 입력값
			
			// msg
			req.setAttribute("msg", "글 작성 완료");
			dispatch("AnimalBbslist.jsp", req, resp);
		}
	}
	
	public boolean isNull(String str) {
		return str == null || str.trim().equals("");
	}
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}

}
