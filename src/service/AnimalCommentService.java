package service;

import java.util.ArrayList;
import java.util.List;

import dao.AnimalCommentDao;
import dto.AfterCommentDto;
import dto.AnimalCommentDto;

public class AnimalCommentService {
	private static AnimalCommentService aniComService = null;
	public AnimalCommentDao aniComManagaer;
	
	private AnimalCommentService() {
		aniComManagaer = new AnimalCommentDao();
	}
	
	public static AnimalCommentService getInstance() {
		if(aniComService == null) {
			aniComService = new AnimalCommentService();
		}
		return aniComService;
	}
	
	
	public List<AnimalCommentDto> getAllComments(int ref){
		return aniComManagaer.getAllComments(ref);
		
	}
	
	public int getCommentsLength(int ref) {
		return aniComManagaer.getCommentsLength(ref);
		
	}
	
	public List<AnimalCommentDto> addComment(AnimalCommentDto comment) {
		// update step 
		aniComManagaer.updateStep(comment);
		
		// add comment
		boolean result = aniComManagaer.addComment(comment);
		
		System.out.println("Add comment result: "+result);
		
		List<AnimalCommentDto> list = new ArrayList<>();
		
		System.out.println("comment : "+comment);
		
		// get comment list
		if (result) {

			list = aniComManagaer.getAllComments(comment.getRef());
		}
		System.out.println("servise list : "+list);
		return list;

	}
	
	
	
}
