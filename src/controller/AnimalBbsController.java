package controller;

import java.io.IOException;
import java.sql.Date;
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
			int medicine = Integer.parseInt(mmedicine);
			System.out.println("m:"+mmedicine);
			
			String nneutralization = req.getParameter("neu");
			int neutralization = Integer.parseInt(nneutralization);
			System.out.println("n:"+nneutralization);
			
			String ggender = req.getParameter("gen");
			int gender =  Integer.parseInt(ggender);
			System.out.println("g:"+ggender);
			
			String title = req.getParameter("title");
			String descripttion = req.getParameter("descrip");
			String pic1 = req.getParameter("pic");
			String content = req.getParameter("content");
	
			
			if(ttype != null) {
				for (int i = 0; i < ttype.length; i++) {
					type = ttype[i];					
				}
				System.out.println("t:"+type);
			}
			
			boolean isS = aniBbService.wirteAnimalBbs(
					new AnimalBbsDto(title, name, age, kinds, type, location, medicine, neutralization, gender, descripttion, pic1, content, 1, "연락처", "내용"));
			
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
			
			
			
		}
	
	
	public boolean isNull(String str) {
		return str == null || str.trim().equals("");
	}
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}

}
