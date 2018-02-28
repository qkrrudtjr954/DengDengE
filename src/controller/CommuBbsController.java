package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import delegator.Delegator;
import dto.CommuBbsDto;
import dto.User;
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

		//Delegator delegator = delegator.getInstance();

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

			if(Delegator.checkSession(req, resp)) {

				dispatch("CommuBbsWrite.jsp", req, resp);
			}else {

				req.setAttribute("returnurl", "CommuBbsController?command=write");
		        dispatch("UserControl?command=goSignIn", req, resp);
			}

			
			
			
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

			HttpSession session = req.getSession();
			User userInfo = (User)session.getAttribute("current_user");
			String writer = userInfo.getEmail();
			int target_user_seq =userInfo.getSeq();

			boolean isS = comService.writeCommu(new CommuBbsDto(title, content, target_user_seq, category));

			System.out.println(isS);



			if(isS) {


			/*	Cookie cookie = new Cookie("successMsg", "글이 등록 되었습니다.");
				cookie.setMaxAge(5);
				resp.addCookie(cookie);
				*/

				resp.sendRedirect("CommuBbsController?command=list");
			}else {
				req.setAttribute("failMsg", "401");
				dispatch("CommuBbsWrite.jsp", req, resp);
			}

		}else if(command.equals("read")) {
			String Sseq = req.getParameter("seq");
			int seq = Integer.parseInt(Sseq);

			
			if(Delegator.checkSession(req, resp)) {

				
				comService.readCount(seq);
				CommuBbsDto comdto = comService.getCommu(seq);
				
				req.setAttribute("comdto", comdto);
				dispatch("CommuBbsDetail.jsp", req, resp);
				
				
			}else {
				
				req.setAttribute("returnurl", "CommuBbsController?command=read&seq="+seq);
		        dispatch("UserControl?command=goSignIn", req, resp);
			}
			
			

		}else if(command.equals("delete")) {
			String Sseq = req.getParameter("seq");
			int seq = Integer.parseInt(Sseq);
			System.out.println("삭제 시퀀스 : " + Sseq);

			boolean isS = comService.delCommu(seq);



			if(isS) {
				/*Cookie cookie = new Cookie("successMsg", "글이 삭제되었습니다.");

				cookie.setMaxAge(5);
				resp.addCookie(cookie);*/

				resp.sendRedirect("CommuBbsController?command=list");
			}else {

				req.setAttribute("failMsg", "글을 삭제할 수 없습니다. 다시 시도하세요.");

				dispatch("CommuBbsController?command=read&seq="+seq, req, resp);
			}
		}else if(command.equals("classify")) {
			String Starget_category = req.getParameter("target_category");
			int target_category = Integer.parseInt(Starget_category);

			List<CommuBbsDto> bbslist = comService.getCategory(target_category);
			//짐 싸기
			req.setAttribute("bbslist", bbslist);

			//보내주기
			dispatch("CommuBbslist.jsp", req, resp);

		}else if(command.equals("update")) {
			String Sseq = req.getParameter("seq");
			int seq = Integer.parseInt(Sseq);

			CommuBbsDto comdto = comService.getCommu(seq);


			req.setAttribute("comdto", comdto);
			dispatch("CommuBbsUdt.jsp", req, resp);
		}else if(command.equals("updateAf")) {
			  String seq = req.getParameter("seq");
		      String title = req.getParameter("title");
		      String content = req.getParameter("content");

		      CommuBbsDto comdto = new CommuBbsDto();
		      comdto.setSeq(Integer.parseInt(seq));
		      comdto.setTitle(title);
		      comdto.setContent(content);

	         boolean isS = comService.udtCommu(comdto);



	         if(isS) {
	        	 	/*Cookie cookie = new Cookie("successMsg", "글이 수정되었습니다.");

				cookie.setMaxAge(5);

				resp.addCookie(cookie);*/
	            resp.sendRedirect("CommuBbsController?command=list");

	         }else {

	            req.setAttribute("failMsg", "글을 수정할 수 없습니다. 다시 시도해주세요.");

	            dispatch("CommuBbsController?command=read", req, resp);

	         }
		}else if(command.equals("search")) {

			  String Searchtype = req.getParameter("Searchtype");             //검색종류(글쓴이,제목,내용)
			  String SearchWord = req.getParameter("SearchWord");


			  System.out.println(" search " + Searchtype +" word "+SearchWord);

			  List<CommuBbsDto> bbslist = comService.getFindCommulist(Searchtype, SearchWord);
				//짐 싸기
				req.setAttribute("bbslist", bbslist);

				//보내주기
				dispatch("CommuBbslist.jsp", req, resp);

		}
	}
	//보내주는 함수
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatch = req.getRequestDispatcher(urls);

		dispatch.forward(req, resp);

	}

}
