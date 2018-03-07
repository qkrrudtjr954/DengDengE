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

import dto.AnimalBbsDto;
import dto.BookDto;
import dto.User;
import service.AnimalBbsService;
import service.BookService;

public class BookController extends HttpServlet {

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
		
		BookService bookservice = BookService.getInstance();
		AnimalBbsService aniBbService = AnimalBbsService.getInatance();
		
		if(command.equals("add")) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			int list_seq = seq;
			
			HttpSession session = req.getSession();
	        User userInfo = (User)session.getAttribute("current_user");
	        
	        String user_email = userInfo.getEmail();
	        int user_seq =userInfo.getSeq();
	        
	        String content = req.getParameter("text");
	    	AnimalBbsDto animalDto = (AnimalBbsDto)aniBbService.detailAnimalBbs(list_seq);
	        System.out.println("seq:"+seq+" user_seq:"+user_seq+" email:"+user_email+" content:"+content+" listseq"+list_seq);        			
	         
	         
	        boolean isS = bookservice.addBook(new BookDto(seq, user_seq, user_email, content, list_seq, animalDto.getUser_email()));
			
			if(isS) {
				System.out.println("S");
				dispatch("AnimalBbsController?command=detail&seq="+seq, req, resp);
			}else {
				System.out.println("F");
				dispatch("AnimalBbsController?command=detail&seq="+seq, req, resp);
			}
		}else if(command.equals("getlist")) {
			int listseq = Integer.parseInt(req.getParameter("seq"));
	      /*  
			List<BookDto> booklist = bookservice.getBookList(listseq);
			String json = new Gson().toJson(booklist);
			resp.getWriter().write(json);*/
		}
		else if(command.equals("finalBook")) {
			String email = req.getParameter("email");
			String sseq = req.getParameter("listseq");
			
			int listseq = Integer.parseInt(sseq);
			String complete_email = email;
			
			
			
			AnimalBbsDto animalDto = (AnimalBbsDto)aniBbService.detailAnimalBbs(listseq);

			// 예약확정자
			boolean bbsisS = aniBbService.bookBbs(listseq, complete_email);
			
			// 글작성자
			boolean isS = bookservice.finalBook(listseq, animalDto.getUser_email());
			
			if(bbsisS) {
				System.out.println("bookBbs S");
			}else {
				System.out.println("bookBbs F");
			}
			
			if(isS) {
				System.out.println("finalBook S");
			}else {
				System.out.println("finalBook F");
			}	
			
		}
	}
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
	
}
