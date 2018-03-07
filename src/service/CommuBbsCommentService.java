package service;

import java.util.ArrayList;
import java.util.List;

import dao.CommuBbsCommentDao;
import dao.CommuBbsDao;
import dto.AfterCommentDto;
import dto.CommuBbsComment;


public class CommuBbsCommentService {
	
	private static CommuBbsCommentService commuBbsCommentService = null;
	public CommuBbsCommentDao commBbsCommentDao;
	
	private CommuBbsCommentService() {
		commBbsCommentDao = new CommuBbsCommentDao();	
	}
	
	public static CommuBbsCommentService getInstance() {
		
		if(commuBbsCommentService==null) {
			commuBbsCommentService = new CommuBbsCommentService();
			
		}
		return commuBbsCommentService;
	}
	
	public List<CommuBbsComment> getAllComments(int ref){
		return commBbsCommentDao.getAllComments(ref);
	}
	
	public int getCommentsLength(int ref) {
		return commBbsCommentDao.getCommentsLength(ref);
	}
	
	public List<CommuBbsComment> addComment(CommuBbsComment comment) {
		// update step 
		commBbsCommentDao.updateStep(comment);
		
		// add comment
		boolean result = commBbsCommentDao.addComment(comment);
		
		System.out.println("Add comment result: "+result);
		List<CommuBbsComment> list = new ArrayList<>();
		System.out.println("comment : "+comment);
		// get comment list
		if(result) {
			
			list = commBbsCommentDao.getAllComments(comment.getRef());
		}

		return list;
	}
	
	public List<CommuBbsComment> deleteComment(int seq, int ref) {
		// TODO Auto-generated method stub
		
		boolean result = commBbsCommentDao.deleteComment(seq);
		
		List<CommuBbsComment> list = new ArrayList<>();
		if (result) {
			list = commBbsCommentDao.getAllComments(ref);
		}

		return list;
	}
	
	public boolean beforeDeleteCheck(int seq, int current_user_seq) {
		int target_user_seq = commBbsCommentDao.getTargetUserSeq(seq);
		return (target_user_seq == current_user_seq)?true:false;
	}
	
	
	
	
	
	

	

}
