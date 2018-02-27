package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
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
			//bbs.readCount(seq);
			
			dispatch("AfterBbslist.jsp", req, resp);
		//글쓰기	
		}else if(command.equals("AfterBbswrite")) {
			dispatch("AfterBbswrite.jsp", req, resp);
		// 글쓰기 처리	
		}else if(command.equals("AfterBbswriteAf")) {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			//String pic1 = req.getParameter("pic1");
			//String suserseq = req.getParameter("userseq");
			//int userseq = Integer.parseInt(suserseq);
			
			System.out.println(title+" " + content + " ");
			
			/*if(isNull(id) && isNull(title) && isNull(content)) {
				req.setAttribute("msg1", "글쓰기 실패");
				dispatch("bbswrite.jsp", req, resp);
			}*/
			
			boolean isS = bbs.wirtelAfterBbs(new AfterBbsDto(title, content, 1));
			Cookie cookie = null;
			if(isS) {
				System.out.println(isS);
				/*req.setAttribute("msg1", "글작성 완료");
				dispatch("AfterBbsController?command=AfterBbslist", req, resp);*/
				
				
				/*cookie = new Cookie("afterwirtemsg", "글작성완료");
				cookie.setMaxAge(5);
				resp.addCookie(cookie);*/
								
				resp.sendRedirect("AfterBbsController?command=AfterBbslist");
				
			}else {
				System.out.println(isS);
				req.setAttribute("mag1", "글작성 실패");
				dispatch("AfterBbswrite.jsp", req, resp);
			}
			//디테일
		}else if(command.equals("AfterBbsDetail")) {
			String sseq = req.getParameter("seq"); 
			System.out.println("detail-sseq: "+sseq);
			int seq = Integer.parseInt(sseq);
			bbs.readCount(seq);
			System.out.println("seq + " + seq);
			AfterBbsDto bbs1 = bbs.detailAfterlBbs(seq);
			System.out.println("Combbs1 = "  + bbs1);
			req.setAttribute("bbs1", bbs1);
			dispatch("AfterBbsDetail.jsp", req, resp);
			
		}else if(command.equals("AfterBbsUpdate")) {  
			String sseq = req.getParameter("seq");
			System.out.println("Update-sseq: "+sseq);
			int seq = Integer.parseInt(sseq);
			AfterBbsDto bbs2 = bbs.getBbs(seq);
			//req.setAttribute("seq", seq);
			req.setAttribute("bbs2", bbs2);
			dispatch("AfterBbsUpdate.jsp", req, resp);
			
		}else if(command.equals("AfterBbsUpdateAf")){
			String seq = req.getParameter("seq");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			//String pic1 = req.getParameter("pic1");
			//String suserseq = req.getParameter("userseq");
			//int userseq = Integer.parseInt(suserseq);
			
			dto.setSeq(Integer.parseInt(seq));
			dto.setTitle(title);
			dto.setContent(content);
			
			System.out.println("updateBbsToString>>"+bbs.toString());
			
			boolean isS = bbs.AfrerBbsUpdate(dto);
			req.setAttribute("isS", isS);
			
			
			if(isS) {
				//JOptionPane.showMessageDialog(null, "수정성공");
				req.setAttribute("msg", "수정성공");
				dispatch("AfterBbsController?command=AfterBbslist", req, resp);
				
			}else {
				//JOptionPane.showMessageDialog(null, "수정실패");
				req.setAttribute("msg", "수정실패");
				dispatch("AfterBbsController?command=AfterBbsDetail", req, resp);
				
			}	
			
			
		}else if(command.equals("AfterDelete")) {
			
			String Sseq = req.getParameter("seq");
	         int seq = Integer.parseInt(Sseq);
	         System.out.println("삭제 시퀀스 : " + Sseq);
	         
	         boolean isS = bbs.AfterdeletBbs(seq);
	         if(isS) {
	            req.setAttribute("msg2", "삭제했습니다");
	            dispatch("AfterBbsController?command=AfterBbslist", req, resp);
	         }else { 
	            req.setAttribute("msg2", "삭제 실패");
	            dispatch("AfterBbsController?command=AfterBbsDetail&seq="+seq, req, resp);
	         }
			
			
		}else if(command.equals("AfterBbsSearch")) {
	         
	           String Searchtype = req.getParameter("Searchtype");             //검색종류(글쓴이,제목,내용)
	           String SearchWord = req.getParameter("SearchWord");   
	           
	           
	           System.out.println(" search " + Searchtype +" word "+SearchWord);
	          
	           List<AfterBbsDto> afterBbslist = bbs.getFindAfterlist(Searchtype, SearchWord);
	            //짐 싸기
	            req.setAttribute("afterBbslist", afterBbslist);
	            
	            //보내주기
	            dispatch("AfterBbslist.jsp", req, resp);
	           
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
