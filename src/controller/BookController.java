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

import dto.BookDto;
import dto.User;
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
		
		if(command.equals("add")) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			int listseq = seq;
			
			HttpSession session = req.getSession();
	        User userInfo = (User)session.getAttribute("current_user");
	        String user_email = userInfo.getEmail();
	        int user_seq =userInfo.getSeq();
	         
	         String content = req.getParameter("text");
	         
	         System.out.println("seq:"+seq+" user_seq:"+user_seq+" email:"+user_email+" content:"+content+" listseq"+listseq);        			
			
			boolean isS = bookservice.addBook(new BookDto(seq, user_seq, user_email, content, listseq));
			
			if(isS) {
				System.out.println("S");
				dispatch("AnimalBbsController?command=detail&seq="+seq, req, resp);
			}else {
				System.out.println("F");
				dispatch("AnimalBbsController?command=detail&seq="+seq, req, resp);
			}
		}else if(command.equals("getlist")) {
			int listseq = Integer.parseInt(req.getParameter("seq"));
	        
			List<BookDto> booklist = bookservice.getBookList(listseq);
			String json = new Gson().toJson(booklist);
			resp.getWriter().write(json);
		}
		else if(command.equals("fianlBook")) {
			// email
			// seq
			// boolean isS = bookservice.finalBook(email, seq);
			/*if(isS) {
				System.out.println("finalBook S");
				dispatch("AnimalBbsController?command=detail&seq="+seq, req, resp);
			}else {
				System.out.println("finalBook F");
				dispatch("AnimalBbsController?command=detail&seq="+seq, req, resp);
			}*/
		}
	}
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
	
}
