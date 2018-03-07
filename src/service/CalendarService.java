package service;

import java.util.List;

import dao.CalendarDao;
import dto.CalendarDto;

public class CalendarService {
	private static CalendarService calendarService = null;
	private CalendarDao calendarDao = null;
	
	private CalendarService() {
		calendarDao = new CalendarDao();
	}
	
	public static CalendarService getInstance() {
		if(calendarService == null) {
			calendarService = new CalendarService();
		}
		return calendarService;
	}
	
	public List<CalendarDto> getEvents(){
		return calendarDao.getEvents();
	}
	
	public CalendarDto getEvent(int seq){
		return calendarDao.getEvent(seq);
	}
}
