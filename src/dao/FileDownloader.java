package dao;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AnimalBbsService;

public class FileDownloader extends HttpServlet {
	private static final int BUFFER_SIZE = 8192; // 8k
	// getRealPath 경로를 취득하기 위함
	private ServletConfig mConfig = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		mConfig = config;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("FileDownloader doGet");
		
		String filename = new String(req.getParameter("filename").getBytes("8859_1"), "KSC5601");
		System.out.println("filename:"+filename);
		
		// download 횟수 증가
		String pdsseq = req.getParameter("seq");
		int seq = Integer.parseInt(pdsseq); 
		
		
		BufferedOutputStream out = new BufferedOutputStream(resp.getOutputStream());
		String filePath = "";
		
		if(pdsseq != null) {
			// tomcat
			//filePath = mConfig.getServletContext().getRealPath("/upload");
			
			// 개인 폴더(절대경로)
			filePath = "c:\\tmp";
		}
		
		try {
			filePath = filePath + "\\" + filename;
			File f = new File(filePath);
			System.out.println("filePath:"+filePath);
			
			// 파일 여부, 파일 읽을수 있는 여부
			if(f.exists() && f.canRead()) {
				// 다운로드 윈도우 창 설정
				resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
				resp.setHeader("Content-Transfer-Encoding", "binary;");
				resp.setHeader("Content-Length", "" + f.length());
				resp.setHeader("Pragma", "no-cache;"); 
				resp.setHeader("Expires", "-1;");		// 기간 -1은 기간 없음
				
				BufferedInputStream fileInput = new BufferedInputStream(new FileInputStream(f));
				byte buffer[] = new byte[BUFFER_SIZE];
				
				int read = 0;
				
				while((read = fileInput.read(buffer)) != -1) {
					// 읽어드린 데이터를 파일을 만들고 써준다
					out.write(buffer, 0, read);					
				}
				fileInput.close();
				out.flush();				
			}
			else {
				System.out.println("파일이 존재하지 않습니다");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(out != null) {
				out.flush();
				out.close();
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("FileDownloader doPost");
	}

}












