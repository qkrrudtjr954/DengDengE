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
			String mmedicine[] = req.getParameterValues("medi");
			int medicine = 0;
			String nneutralization[] = req.getParameterValues("neu");
			int neutralization = 0;
			String ggender[] = req.getParameterValues("gen");
			int gender = 0;
			String title = req.getParameter("title");
			String descripttion = req.getParameter("discrip");
			String pic1 = req.getParameter("pic");
			String content = req.getParameter("content");
			
			AnimalBbsDto dto = new AnimalBbsDto(title, name, age, kinds, type, location, medicine, neutralization, gender, descripttion, pic1, content, 1, "content", "no");
			System.out.println(dto.toString());
			if(ttype != null) {
				for (int i = 0; i < ttype.length; i++) {
					type = ttype[i];					
				}
				System.out.println("t:"+type);
			}
			else if(mmedicine != null) {
				for (int i = 0; i < mmedicine.length; i++) {
					String str = "";
					str += mmedicine[i];
					System.out.println(str);
					medicine = Integer.parseInt(str);					
				}
				
				System.out.println("m:"+medicine);
			}
			else if(nneutralization != null) {
				for (int i = 0; i < nneutralization.length; i++) {
					String str = nneutralization[i];
					neutralization = Integer.parseInt(str);
				}
				System.out.println("n:"+neutralization);
			}else if(ggender != null) {
				for (int i = 0; i < ggender.length; i++) {
					String str = ggender[i];
					gender = Integer.parseInt(str);
				}
				System.out.println("g:"+gender);
			}
			/*boolean isS = aniBbService.wirteAnimalBbs(
				new AnimalBbsDto(title, name, age, kinds, type, location, 
							medicine, neutralization, gender, descripttion, 
							pic1, content, 1, "서울", "없음"));*/
			// msg
			req.setAttribute("msg", "글 작성 완료");
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
