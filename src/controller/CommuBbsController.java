package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommuBbsDao;
import dao.iCommuBbsDao;
import dto.CommuBbsDto;
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
	
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text./html; charset=utf-8"); 
		
		String command = req.getParameter("command");	
		
		
		
		if(command.equals("list")) {
			
			List<CommuBbsDto> bbslist = comService.getCommulist();
			//짐 싸기
			req.setAttribute("bbslist", bbslist);
			
			//보내주기
			dispatch("TestList.jsp", req, resp);
			
		}else if(command.equals("write")) {
			dispatch("CommuBbsWrite.jsp", req, resp);
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
			
			 boolean isS = comService.writeCommu(new CommuBbsDto(title, content, 1, category));
			 //유저 시퀀스 1 로 일단 설정해둠 
				System.out.println(isS);
				if(isS) {
					req.setAttribute("msg", "글 입력 성공!");
					dispatch("CommuBbsController?command=list", req, resp);
				}else {
					req.setAttribute("msg", "글을 다시 입력 하십시오");
					dispatch("CommuBbsWrite.jsp", req, resp);
				}
			 
		}else if(command.equals("read")) {
			String Sseq = req.getParameter("seq");
			int seq = Integer.parseInt(Sseq);
			
			comService.readCount(seq);
			CommuBbsDto comdto = comService.getCommu(seq);
			
			req.setAttribute("comdto", comdto);
			dispatch("CommuBbsDetail.jsp", req, resp);
		}else if(command.equals("delete")) {
			String Sseq = req.getParameter("seq");
			int seq = Integer.parseInt(Sseq);
			System.out.println("삭제 시퀀스 : " + Sseq);
			
			boolean isS = comService.delCommu(seq);
			if(isS) {
				req.setAttribute("msg", "삭제했습니다");
				dispatch("CommuBbsController?command=list", req, resp);
			}else { 
				req.setAttribute("msg", "삭제 실패");
				dispatch("CommuBbsController?command=read&seq="+seq, req, resp);
			}
		}else if(command.equals("classify")) {
			String Starget_category = req.getParameter("target_category");
			int target_category = Integer.parseInt(Starget_category);
			
			List<CommuBbsDto> bbslist = comService.getCategory(target_category);
			//짐 싸기
			req.setAttribute("bbslist", bbslist);
			
			//보내주기
			dispatch("TestList.jsp", req, resp);
			
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
		         req.setAttribute("isS", isS);
		         		         
		         if(isS) {
		           
		            req.setAttribute("msg", "수정성공");
		            dispatch("CommuBbsController?command=list", req, resp);
		            
		         }else {
		            //JOptionPane.showMessageDialog(null, "수정실패");
		            req.setAttribute("msg", "수정실패");
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
