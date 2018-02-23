package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.AfterBbsDto;
import service.AfterBbsService;

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
		
		
		
		if(command.equals("AfterBbslist")) {
			
			List<AfterBbsDto> afterBbslist = bbs.getAfterlBbsList();
			req.setAttribute("afterBbslist", afterBbslist);
			
			dispatch("AfterBbslist.jsp", req, resp);
			
		}else if(command.equals("AfterBbswrite")) {
			dispatch("AfterBbswrite.jsp", req, resp);
		}else if(command.equals("AfterBbswriteAf")) {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			//String suserseq = req.getParameter("userseq");
			//int userseq = Integer.parseInt(suserseq);
			
			System.out.println(title+" " + content + " ");
			
			/*if(isNull(id) && isNull(title) && isNull(content)) {
				req.setAttribute("msg1", "글쓰기 실패");
				dispatch("bbswrite.jsp", req, resp);
			}*/
			
			boolean isS = bbs.wirtelAfterBbs(new AfterBbsDto(title, content, 1));
			
			if(isS) {
				System.out.println(isS);
				req.setAttribute("msg1", "글작성 완료");
				dispatch("AfterBbsController?command=AfterBbslist", req, resp);
			}else {
				System.out.println(isS);
				req.setAttribute("mag1", "글작성 실패");
				dispatch("AfterBbswrite.jsp", req, resp);
			}
			
		}else if(command.equals("AfterBbsDetail")) {
			String sseq = req.getParameter("seq"); 
			System.out.println("delete-sseq: "+sseq);
			int seq = Integer.parseInt(sseq);
			AfterBbsDto bbs1 = bbs.detailAfterlBbs(seq);
			req.setAttribute("seq", seq);
			req.setAttribute("bbs1", bbs1);
			dispatch("AfterBbsDetail.jsp", req, resp);
			
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
