package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import delegator.Delegator;
import dto.AnimalBbsDto;
import dto.AnimalCommentDto;
import dto.BookDto;
import dto.User;
import service.AnimalBbsService;
import service.AnimalCommentService;
import service.BookService;

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
		BookService bookService = BookService.getInstance();
		if(command.equals("animlist")) {
			List<AnimalBbsDto> animlist = aniBbService.getAnimalBbsList();
			System.out.println("animlist: "+animlist);
			req.setAttribute("animlist", animlist);
			dispatch("AnimalBbslist.jsp", req, resp);
		}
		else if(command.equals("detail")) {         
	         //로그인 안되었을 때 알림창 띄워주기   
			
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt (sseq);
			System.out.println("s"+seq);		
			
			if(Delegator.checkSession(req, resp)) {
				HttpSession session = req.getSession();
		        User userInfo = (User)session.getAttribute("current_user");
		        String email = userInfo.getEmail();
		        
				aniBbService.readCount(seq);		
				
				BookService bookservice = BookService.getInstance();
				List<BookDto> booklist = bookservice.getBookList(seq);
				req.setAttribute("booking", booklist);
				AnimalCommentService commentService = AnimalCommentService.getInstance();
				List<AnimalCommentDto> comments =commentService.getAllComments(seq); 
				AnimalBbsDto aniBbsDto  = aniBbService.detailAnimalBbs(seq);
				
				boolean isLiked = aniBbService.Prevent_duplication(userInfo.getSeq(), seq);
				boolean bookS = bookService.checkBook(email,seq);
				
				System.out.println(bookS);
	            req.setAttribute("aniBbsDto", aniBbsDto);
	            req.setAttribute("bookS", bookS);
	            req.setAttribute("like_count", aniBbService.getLikeCount(seq));
				req.setAttribute("isLiked", isLiked);
				req.setAttribute("comments", comments);
				
	            
	            dispatch("AnimalBbsdetail.jsp", req , resp);
	         } else {
	            // 로그인이 안된 상태 
	            req.setAttribute("returnurl", "AnimalBbsController?command=detail&seq=" + seq);
	            dispatch("UserControl?command=goSignIn", req, resp);
	         }
		}
		else if(command.equals("write")) {	
			
			if(Delegator.checkSession(req, resp)) {
	            // 로그인이 되어있는 상태 
	            dispatch("AnimalBbswrite.jsp", req, resp);            
	         } else {
	            // 로그인이 안된 상태 
	            req.setAttribute("returnurl", "AnimalBbsController?command=write");
	            dispatch("UserControl?command=goSignIn", req, resp);
	         }
		}
		else if(command.equals("writeAf")) {
			String name = req.getParameter("name");
			String aage = req.getParameter("age");
			int age = Integer.parseInt(aage);
			String kinds = req.getParameter("kinds");
			String ttype[] = req.getParameterValues("type");
			String type = null;
			String location = req.getParameter("location");
			String pic1 = req.getParameter("pic1");
			
			String mmedicine = req.getParameter("medi");
			int medicine;
			if(mmedicine.equals("YES")) {
				medicine = 1;
			}else {
				medicine = 0;
			}
			System.out.println("m:"+medicine);	
			
			
			String nneutralization = req.getParameter("neu");
			int neutralization;
			if(nneutralization.equals("YES")) {
				neutralization = 1;
			}else {
				neutralization = 0;
			}
			System.out.println("n:"+neutralization);	
			
			
			String ggender = req.getParameter("gen");
			int gender;
			if(ggender.equals("여자")) {
				gender = 1;
			}else {
				gender = 0;
			}System.out.println("g:"+gender);	
			
			String title = req.getParameter("title");
			String descripttion = req.getParameter("descrip");
			String content = req.getParameter("content");
			
			String contact = req.getParameter("contact");
			String description = req.getParameter("desc");
			
			HttpSession session = req.getSession();
	         User userInfo = (User)session.getAttribute("current_user");
	         String complete_email = userInfo.getEmail();
	         int target_user_seq =userInfo.getSeq();
	
			
			if(ttype != null) {
				for (int i = 0; i < ttype.length; i++) {
					type = ttype[i];					
				}
				System.out.println("t:"+type);
			}   
	         
			
			boolean isS = aniBbService.wirteAnimalBbs(
					new AnimalBbsDto(title, name, age, kinds, type, location, 
												medicine, neutralization, gender, descripttion, pic1, content, 
												target_user_seq, contact, description, complete_email));
			
			if(isS) {
				// msg
				System.out.println(isS);
				req.setAttribute("msg", "글 작성 완료");
				dispatch("AnimalBbsController?command=animlist", req, resp);
			}else {
				// msg
				System.out.println(isS);
				req.setAttribute("msg", "글 작성 실패");
				dispatch("AnimalBbslist.jsp", req, resp);
			}
			
			}
		else if(command.equals("update")) {
				String sseq = req.getParameter("seq");
				int seq = Integer.parseInt(sseq);
				
				
				AnimalBbsDto aniBbsDto  = aniBbService.detailAnimalBbs(seq);
				req.setAttribute("aniBbsDto", aniBbsDto);
				dispatch("AnimalBbsupdate.jsp", req, resp);
			}
		else if(command.equals("updateAf")) {
				String sseq = req.getParameter("seq");
				int seq = Integer.parseInt(sseq);
				String title = req.getParameter("title");
				String content = req.getParameter("content");
				
				boolean isS = aniBbService.updateAnimalBbs(seq, new AnimalBbsDto(title, content));
				if(isS) {
					req.setAttribute("msg", "글 수정 성공");
					dispatch("AnimalBbsController?command=animlist", req, resp);
				}else {
					req.setAttribute("msg", "글 수정 실패");
					dispatch("AnimalBbsController?command=animlist", req, resp);
				}
		}
		else if(command.equals("delete")) {
				int  seq = Integer.parseInt(req.getParameter("seq"));
				boolean isS = aniBbService.deleteBbs(seq);
				
				if(isS) {
					req.setAttribute("msg", "글 삭제 성공");
					dispatch("AnimalBbsController?command=animlist", req, resp);
				}else {
					req.setAttribute("msg", "글 삭제 실패");
					dispatch("AnimalBbsController?command=animlist", req, resp);
				}
			}
		else if(command.equals("search")) {
			String Searchtype = req.getParameter("Searchtype");             //검색종류(글쓴이,제목,내용)
	        String SearchWord = req.getParameter("SearchWord");   
	           
	           
	           System.out.println(" search " + Searchtype +" word "+SearchWord);
	          
	           List<AnimalBbsDto> animlist = aniBbService.getFindBbslist(Searchtype, SearchWord);
	            //짐 싸기
	            req.setAttribute("animlist", animlist);
	            
	            //보내주기
	            dispatch("AnimalBbslist.jsp", req, resp);
		}
		else if(command.equals("btnsearch")) {
			String ssearchBtn = req.getParameter("searchBtn");
			
			String searchBtn = ssearchBtn.substring(0, 1);
			
			if(ssearchBtn.equals("경기도")) {
				searchBtn = ssearchBtn.substring(0, 2);
			}
			List<AnimalBbsDto> animlist = aniBbService.getFindBtnlist(searchBtn);
			req.setAttribute("animlist", animlist);
			
			dispatch("AnimalBbslist.jsp", req, resp);
		}
		else if(command.equals("like")) {
			String Sseq = req.getParameter("seq");
			int seq = Integer.parseInt(Sseq);
			String Suser = req.getParameter("userid");
			int user = Integer.parseInt(Suser);
			System.out.println("seq " + seq + " userid " + user);
			
						
			int like_count = 0; 
			HashMap<String, Integer> status = new HashMap<>();
			
			boolean check = aniBbService.Prevent_duplication(user, seq);
			
			if( check) {		
				// 테이블에서 해당 행을 삭제( 추가) 한다.
				aniBbService.likeTB_delete(user, seq);
				
				// status, like count 를 json으로 전송한다.
				status.put("status", 404);
			}else {
				// 테이블에서 해당 행을 삭제( 추가) 한다.
				aniBbService.likeTB_insert(user, seq);
				
				// status, like count 를 json으로 전송한다.
				status.put("status", 200);
			}

			// 테이블을 게시글 seq 로 count(*) 
			like_count = aniBbService.getLikeCount(seq);
			status.put("like_count", like_count);
			String json = new Gson().toJson(status);
			
			System.out.println(json);
			resp.getWriter().write(json);	
			
			
		}
			
			
			
		}
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}

}
