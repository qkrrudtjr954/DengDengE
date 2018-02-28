package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.DengSiteDto;
import util.FindPlaceJsoupUtil;

public class FindPlaceController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doProcess(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text./html; charset=utf-8"); 
		
		String command = req.getParameter("command");
		
		if(command.equals("findPlace")) {
			
			String query = ( (String)req.getParameter("query")==null ) ? "애견분양" : (String)req.getParameter("query");
			
			
			
			FindPlaceJsoupUtil util = new FindPlaceJsoupUtil();
			List<DengSiteDto> list = util.getDaumSites(query);
			
			req.setAttribute("jsoupList", list);
			dispatch("findPlace.jsp", req, resp);
		}
		
		
	}
	
	//보내주는 함수
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
}
