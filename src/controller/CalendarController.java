package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.CalendarDto;
import service.CalendarService;

public class CalendarController extends HttpServlet{
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
		
		if (command.equals("showEvents")) {
			
			dispatch("calendar.jsp", req, resp);
			
		} else if(command.equals("getEvents")) {
			CalendarService calendarService = CalendarService.getInstance();
			List<CalendarDto> events = calendarService.getEvents();
			
			String json = new Gson().toJson(events);
			
			resp.getWriter().write(json);
		} else if(command.equals("getEvent")) {
			String sseq = req.getParameter("target");
			int seq = Integer.parseInt(sseq);
			
			System.out.println(seq);
			CalendarService calendarService = CalendarService.getInstance();
			CalendarDto event = calendarService.getEvent(seq);
			
			String json = new Gson().toJson(event);
			
			resp.getWriter().write(json);
		}
	}
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
}
