package service;

import java.util.ArrayList;
import java.util.List;

import dao.AfterCommentDao;
import dto.AfterCommentDto;

public class AfterCommentService {
	
	private static AfterCommentService afterCommentService = null;
	public AfterCommentDao afterCommentDao;
	
	private AfterCommentService() {
		afterCommentDao = new AfterCommentDao();
	}
	
	public static AfterCommentService getInstance() {
		if(afterCommentService==null) {
			afterCommentService = new AfterCommentService();
			
		}
		return afterCommentService;
		
	}

	public List<AfterCommentDto> getAllComments(int ref){
		return afterCommentDao.getAllComments(ref);
	}
	
	public int getCommentsLength(int ref) {
		return afterCommentDao.getCommentsLength(ref);
	}
	public List<AfterCommentDto> addComment(AfterCommentDto comment) {
		// update step 
		afterCommentDao.updateStep(comment);
		
		// add comment
		boolean result = afterCommentDao.addComment(comment);
		
		System.out.println("Add comment result: "+result);
		List<AfterCommentDto> list = new ArrayList<>();
		System.out.println("comment : "+comment);
		// get comment list
		if(result) {
			
			list = afterCommentDao.getAllComments(comment.getRef());
		}

		return list;
	}

	public List<AfterCommentDto> deleteComment(int seq, int ref) {
		// TODO Auto-generated method stub
		
		boolean result = afterCommentDao.deleteComment(seq);
		
		List<AfterCommentDto> list = new ArrayList<>();
		if (result) {
			list = afterCommentDao.getAllComments(ref);
		}

		return list;
	}

	public boolean beforeDeleteCheck(int seq, int current_user_seq) {
		int target_user_seq = afterCommentDao.getTargetUserSeq(seq);
		return (target_user_seq == current_user_seq)?true:false;
	}
	
	
	

}
