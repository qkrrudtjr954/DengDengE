package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AnimalBbsDto;
import service.AnimalBbsService;

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
		
		if(command.equals("animlist")) {
			List<AnimalBbsDto> animlist = aniBbService.getAnimalBbsList();
			
			req.setAttribute("animlist", animlist);
			dispatch("AnimalBbslist.jsp", req, resp);
		}
		else if(command.equals("detail")) {
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt(sseq);
			System.out.println("s"+seq);
			
			aniBbService.readCount(seq);			
			AnimalBbsDto aniBbsDto  = aniBbService.detailAnimalBbs(seq);
			req.setAttribute("aniBbsDto", aniBbsDto);
			dispatch("AnimalBbsdetail.jsp", req, resp);
		}
		else if(command.equals("write")) {
			// id
			dispatch("AnimalBbswrite.jsp", req, resp);
		}
		else if(command.equals("writeAf")) {
			// 입력값
			String name = req.getParameter("name");
			String aage = req.getParameter("age");
			int age = Integer.parseInt(aage);
			String kinds = req.getParameter("kinds");
			String ttype[] = req.getParameterValues("type");
			String type = null;
			String location = req.getParameter("location");
			
			String mmedicine = req.getParameter("medi");
			int medicine;
			if(mmedicine.equals("YES")) {
				medicine = 1;
			}else {
				medicine = 0;
			}System.out.println("m:"+medicine);	
			
			
			String nneutralization = req.getParameter("neu");
			int neutralization;
			if(nneutralization.equals("YES")) {
				neutralization = 1;
			}else {
				neutralization = 0;
			}System.out.println("n:"+neutralization);	
			
			
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
			
			String contect = req.getParameter("contect");
			String description = req.getParameter("desc");
	
			
			if(ttype != null) {
				for (int i = 0; i < ttype.length; i++) {
					type = ttype[i];					
				}
				System.out.println("t:"+type);
			}
			
			boolean isS = aniBbService.wirteAnimalBbs(
					new AnimalBbsDto(title, name, age, kinds, type, location, medicine, neutralization, gender, descripttion, null, content, 1, contect, description));
			
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
			
			
			
		}
	
	
	public boolean isNull(String str) {
		return str == null || str.trim().equals("");
	}
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}

}
