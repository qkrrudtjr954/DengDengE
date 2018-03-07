package controller;

import java.io.IOException;
import java.net.URLEncoder;
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
import dto.CategoryDto;
import dto.CommuBbsComment;
import dto.CommuBbsDto;
import dto.User;
import service.CommuBbsCommentService;
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

		// Delegator delegator = delegator.getInstance();

		req.setCharacterEncoding("utf-8");
		resp.setContentType("text./html; charset=utf-8");

		String command = req.getParameter("command");

		System.out.println(command);

		if (command.equals("list")) {

			CommuBbsService comService = CommuBbsService.getInstance();
			List<CommuBbsDto> bbslist = comService.getCommulist();
			List<CategoryDto> categories = comService.getCategories();
			// 짐 싸기
			req.setAttribute("categories", categories);
			req.setAttribute("bbslist", bbslist);

			// 보내주기
			dispatch("CommuBbslist.jsp", req, resp);

		} else if (command.equals("write")) {
			CommuBbsService comService = CommuBbsService.getInstance();

			if (Delegator.checkSession(req, resp)) {
				List<CategoryDto> categories = comService.getCategories();
				req.setAttribute("categories", categories);

				dispatch("CommuBbsWrite.jsp", req, resp);
			} else {

				req.setAttribute("returnurl", "CommuBbsController?command=write");
				dispatch("UserControl?command=goSignIn", req, resp);
			}

		} else if (command.equals("writeAf")) {
			CommuBbsService comService = CommuBbsService.getInstance();

			// String id = req.getParameter("id");
			System.out.println("writeAf 들어옴");

			String Scategory = req.getParameter("category");
			int category = Integer.parseInt(Scategory);
			String title = req.getParameter("title");
			String content = req.getParameter("content");

			System.out.println("category : " + Scategory);
			System.out.println("title : " + title);
			System.out.println("content : " + content);

			HttpSession session = req.getSession();
			User userInfo = (User) session.getAttribute("current_user");
			int target_user_seq = userInfo.getSeq();

			CommuBbsDto dto = new CommuBbsDto(title, content, target_user_seq, category);
			boolean isS = comService.writeCommu(dto);

			System.out.println("CommuDto : " + dto);

			if (isS) {

				/*
				 * Cookie cookie = new Cookie("successMsg", "글이 등록 되었습니다.");
				 * cookie.setMaxAge(5); resp.addCookie(cookie);
				 */

				resp.sendRedirect("CommuBbsController?command=list");
			} else {
				req.setAttribute("failMsg", "401");
				dispatch("CommuBbsWrite.jsp", req, resp);
			}

		} else if (command.equals("read")) {
			String Sseq = req.getParameter("seq");
			int seq = Integer.parseInt(Sseq);

			HttpSession session = req.getSession();

			User current_user = (User) session.getAttribute("current_user");

			if (Delegator.checkSession(req, resp)) {

				CommuBbsService comService = CommuBbsService.getInstance();
				CommuBbsCommentService commentService = CommuBbsCommentService.getInstance();
				List<CommuBbsComment> comments = commentService.getAllComments(seq);
				comService.readCount(seq);
				CommuBbsDto comdto = comService.getCommu(seq);
				boolean isLiked = comService.Prevent_duplication(current_user.getSeq(), seq);
				req.setAttribute("comments", comments);
				req.setAttribute("comdto", comdto);
				req.setAttribute("like_count", comService.getLikeCount(seq));
				req.setAttribute("isLiked", isLiked);
				dispatch("CommuBbsDetail.jsp", req, resp);

			} else {

				req.setAttribute("returnurl", "CommuBbsController?command=read&seq=" + seq);
				dispatch("UserControl?command=goSignIn", req, resp);
			}

		} else if (command.equals("delete")) {
			String Sseq = req.getParameter("seq");
			int seq = Integer.parseInt(Sseq);
			System.out.println("삭제 시퀀스 : " + Sseq);
			CommuBbsService comService = CommuBbsService.getInstance();

			boolean isS = comService.delCommu(seq);

			if (isS) {
				/*
				 * Cookie cookie = new Cookie("successMsg", "글이 삭제되었습니다.");
				 * 
				 * cookie.setMaxAge(5); resp.addCookie(cookie);
				 */

				resp.sendRedirect("CommuBbsController?command=list");
			} else {

				req.setAttribute("failMsg", "글을 삭제할 수 없습니다. 다시 시도하세요.");

				dispatch("CommuBbsController?command=read&seq=" + seq, req, resp);
			}
		} else if (command.equals("classify")) {
			String sseq = req.getParameter("target_category");
			int seq = Integer.parseInt(sseq);
			CommuBbsService comService = CommuBbsService.getInstance();

			List<CommuBbsDto> bbslist = comService.getCategory(seq);
			List<CategoryDto> categories = comService.getCategories();
			// 짐 싸기
			req.setAttribute("categories", categories);
			req.setAttribute("bbslist", bbslist);

			// 보내주기
			dispatch("CommuBbslist.jsp", req, resp);

		} else if (command.equals("update")) {
			String Sseq = req.getParameter("seq");
			int seq = Integer.parseInt(Sseq);
			CommuBbsService comService = CommuBbsService.getInstance();

			CommuBbsDto comdto = comService.getCommu(seq);

			req.setAttribute("comdto", comdto);
			dispatch("CommuBbsUdt.jsp", req, resp);
		} else if (command.equals("updateAf")) {
			String seq = req.getParameter("seq");
			String title = req.getParameter("title");
			String content = req.getParameter("content");

			CommuBbsDto comdto = new CommuBbsDto();
			comdto.setSeq(Integer.parseInt(seq));
			comdto.setTitle(title);
			comdto.setContent(content);
			CommuBbsService comService = CommuBbsService.getInstance();

			boolean isS = comService.udtCommu(comdto);

		} else if (command.equals("search")) {

			String Searchtype = req.getParameter("Searchtype"); // 검색종류(글쓴이,제목,내용)
			String SearchWord = req.getParameter("SearchWord");

			System.out.println(" search " + Searchtype + " word " + SearchWord);
			CommuBbsService comService = CommuBbsService.getInstance();

			List<CommuBbsDto> bbslist = comService.getFindCommulist(Searchtype, SearchWord);
			// 짐 싸기
			req.setAttribute("bbslist", bbslist);

			// 보내주기
			dispatch("CommuBbslist.jsp", req, resp);

		} else if (command.equals("like")) {
			String Sseq = req.getParameter("seq");
			int seq = Integer.parseInt(Sseq);
			String Suser = req.getParameter("userid");
			int user = Integer.parseInt(Suser);
			System.out.println("seq " + seq + " userid " + user);

			CommuBbsService comService = CommuBbsService.getInstance();

			int like_count = 0;
			HashMap<String, Integer> status = new HashMap<>();

			boolean check = comService.Prevent_duplication(user, seq);

			if (check) {
				// 테이블에서 해당 행을 삭제( 추가) 한다.
				comService.likeTB_delete(user, seq);

				// status, like count 를 json으로 전송한다.
				status.put("status", 404);
			} else {
				// 테이블에서 해당 행을 삭제( 추가) 한다.
				comService.likeTB_insert(user, seq);

				// status, like count 를 json으로 전송한다.
				status.put("status", 200);
			}

			// 테이블을 게시글 seq 로 count(*)
			like_count = comService.getLikeCount(seq);
			status.put("like_count", like_count);
			String json = new Gson().toJson(status);

			System.out.println(json);
			resp.getWriter().write(json);

		}
	}

	// 보내주는 함수
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		RequestDispatcher dispatch = req.getRequestDispatcher(urls);

		dispatch.forward(req, resp);

	}

}
