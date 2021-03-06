package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import delegator.Delegator;
import dto.AfterBbsDto;
import dto.AfterCommentDto;
import dto.User;
import service.AfterBbsService;
import service.AfterCommentService;

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

		if (command.equals("AfterBbslist")) {

			List<AfterBbsDto> afterBbslist = bbs.getAfterlBbsList();
			req.setAttribute("afterBbslist", afterBbslist);
			// bbs.readCount(seq);

			dispatch("AfterBbslist.jsp", req, resp);
			// 글쓰기
		} else if (command.equals("AfterBbswrite")) {

			if (Delegator.checkSession(req, resp)) {
				// 로그인이 되어있는 상태
				dispatch("AfterBbswrite.jsp", req, resp);
			} else {
				// 로그인이 안된 상태
				req.setAttribute("returnurl", "AfterBbsController?command=AfterBbswrite");
				dispatch("UserControl?command=goSignIn", req, resp);
			}

			// 글쓰기 처리
		} else if (command.equals("AfterBbswriteAf")) {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String pic1 = req.getParameter("pic1");
			 //String suserseq = req.getParameter("userseq");
			// int userseq = Integer.parseInt(suserseq);

			System.out.println(title + " " + content + " ");

			/*
			 * if(isNull(id) && isNull(title) && isNull(content)) { req.setAttribute("msg1",
			 * "글쓰기 실패"); dispatch("bbswrite.jsp", req, resp); }
			 */

			HttpSession session = req.getSession();
			User userInfo = (User) session.getAttribute("current_user");
			int target_user_seq = userInfo.getSeq();

			AfterBbsDto test = new AfterBbsDto(title, content, target_user_seq);
			test.setPic1(pic1);
			boolean isS = bbs.wirteAfterBbs(test);
			if (isS) {
				System.out.println(isS);
				

				resp.sendRedirect("AfterBbsController?command=AfterBbslist");

			} else {
				System.out.println(isS);
				req.setAttribute("mag1", "글작성 실패");
				dispatch("AfterBbswrite.jsp", req, resp);
			}
			// 디테일
		} else if (command.equals("AfterBbsDetail")) {
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt(sseq);

			if (Delegator.checkSession(req, resp)) {
				// 로그인이 되어있는 상태
				HttpSession session = req.getSession();
				User userInfo = (User) session.getAttribute("current_user");

				bbs.readCount(seq);

				AfterBbsDto bbs1 = bbs.detailAfterlBbs(seq);
				
				AfterCommentService commentService = AfterCommentService.getInstance();

				List<AfterCommentDto> comments = commentService.getAllComments(seq);
				boolean isLiked = bbs.Prevent_duplication(userInfo.getSeq(), seq);
				req.setAttribute("comments", comments);
				req.setAttribute("bbs1", bbs1);
				req.setAttribute("like_count", bbs.getLikeCount(seq));
		
				req.setAttribute("isLiked", isLiked);
				
				dispatch("AfterBbsDetail.jsp", req, resp);
			} else {
				// 로그인이 안된 상태
				req.setAttribute("returnurl", "AfterBbsController?command=AfterBbsDetail&seq=" + seq);
				dispatch("UserControl?command=goSignIn", req, resp);
			}

		} else if (command.equals("AfterBbsUpdate")) {
			String sseq = req.getParameter("seq");
			System.out.println("Update-sseq: " + sseq);
			int seq = Integer.parseInt(sseq);
			AfterBbsDto bbs2 = bbs.getBbs(seq);
			// req.setAttribute("seq", seq);
			req.setAttribute("bbs2", bbs2);
			dispatch("AfterBbsUpdate.jsp", req, resp);
			

		} else if (command.equals("AfterBbsUpdateAf")) {
			String seq = req.getParameter("seq");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String pic1 = req.getParameter("pic1");
			

			dto.setSeq(Integer.parseInt(seq));
			dto.setTitle(title);
			dto.setContent(content);
			dto.setPic1(pic1);

			System.out.println("updateBbsToString>>" + bbs.toString());

			boolean isS = bbs.AfrerBbsUpdate(dto);
			req.setAttribute("isS", isS);

			
			resp.sendRedirect("AfterBbsController?command=AfterBbslist");

		} else if (command.equals("AfterDelete")) {

			String Sseq = req.getParameter("seq");
			int seq = Integer.parseInt(Sseq);
			System.out.println("삭제 시퀀스 : " + Sseq);

			boolean isS = bbs.AfterdeletBbs(seq);
			if (isS) {
				req.setAttribute("msg2", "삭제했습니다");
				dispatch("AfterBbsController?command=AfterBbslist", req, resp);
			} else {
				req.setAttribute("msg2", "삭제 실패");
				dispatch("AfterBbsController?command=AfterBbsDetail&seq=" + seq, req, resp);
			}

		} else if (command.equals("AfterBbsSearch")) {

			String Searchtype = req.getParameter("Searchtype"); // 검색종류(글쓴이,제목,내용)
			String SearchWord = req.getParameter("SearchWord");

			System.out.println(" search " + Searchtype + " word " + SearchWord);

			List<AfterBbsDto> afterBbslist = bbs.getFindAfterlist(Searchtype, SearchWord);
			// 짐 싸기
			req.setAttribute("afterBbslist", afterBbslist);

			// 보내주기
			dispatch("AfterBbslist.jsp", req, resp);

		} else if(command.equals("like")) {
			String Sseq = req.getParameter("seq");
			int seq = Integer.parseInt(Sseq);
			String Suser = req.getParameter("userid");
			int user = Integer.parseInt(Suser);
			System.out.println("seq " + seq + " userid " + user);
			
						
			int like_count = 0; 
			HashMap<String, Integer> status = new HashMap<>();
			
			boolean check = bbs.Prevent_duplication(user, seq);
			
			if( check) {		
				// 테이블에서 해당 행을 삭제( 추가) 한다.
				bbs.likeTB_delete(user, seq);
				
				// status, like count 를 json으로 전송한다.
				status.put("status", 404);
			}else {
				// 테이블에서 해당 행을 삭제( 추가) 한다.
				bbs.likeTB_insert(user, seq);
				
				// status, like count 를 json으로 전송한다.
				status.put("status", 200);
			}

			// 테이블을 게시글 seq 로 count(*) 
			like_count = bbs.getLikeCount(seq);
			status.put("like_count", like_count);
			String json = new Gson().toJson(status);
			
			System.out.println(json);
			resp.getWriter().write(json);	
		}

	}

	public boolean isNull(String str) {
		return str == null || str.trim().equals("");
	}

	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}

}
