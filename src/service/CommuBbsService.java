package service;

import java.util.List;

import javax.swing.plaf.synth.SynthScrollBarUI;

import dao.iCommuBbsDao;
import dao.CommuBbsDao;
import dto.CategoryDto;
import dto.CommuBbsDto;

public class CommuBbsService {
	// service는 dao만 콜할 수 있습니다.
		private static CommuBbsService comService = null;
		public iCommuBbsDao manager;

		private CommuBbsService() {
			manager = new CommuBbsDao();
		}
		public static CommuBbsService getInstance() {
			if(comService==null) {
				comService = new CommuBbsService();
			}

			return comService;
		}

		// service 는 dao를 singleton으로 호출합니다.

		public List<CommuBbsDto> getCommulist(){
			return manager.getCommulist();
		}

		public boolean writeCommu(CommuBbsDto comdto) {
			// TODO Auto-generated method stub
			return manager.writeCommu(comdto);
		}

		public CommuBbsDto getCommu(int seq) {
			return manager.getCommu(seq);
		}

		public boolean delCommu(int seq) {
			return manager.delCommu(seq);
		}

		public List<CommuBbsDto> getCategory(int target_category){
			return manager.getCategory(target_category);
		}

		public void readCount(int seq) {
			 manager.readCount(seq);
			 
		}
		

		public boolean udtCommu(CommuBbsDto comdto) {
			System.out.println(comdto.getPic1());
			if(comdto.getPic1() == null || comdto.getPic1().equals("")) {
				return manager.udtCommu(comdto);
			
			}else {
				return manager.udtCommuPic1(comdto);
			}
			
			
		}

		public List<CommuBbsDto> getFindCommulist(String Searchtype, String SearchWord){
			return manager.getFindCommulist(Searchtype, SearchWord);
		}


		public boolean Prevent_duplication(int target_user_seq, int target_bbs_seq) {
			return manager.Prevent_duplication(target_user_seq, target_bbs_seq);
		}

		public void likeTB_delete(int target_user_seq, int target_bbs_seq) {
			manager.likeTB_delete(target_user_seq, target_bbs_seq);
		}

		public void likeTB_insert(int target_user_seq, int target_bbs_seq) {
			manager.likeTB_insert(target_user_seq, target_bbs_seq);
		}
		public List<CategoryDto> getCategories() {
			return manager.getCategories();
		}
		
		public int getLikeCount(int bbs_seq) {
			return manager.getLikeCount(bbs_seq);
		}

}
