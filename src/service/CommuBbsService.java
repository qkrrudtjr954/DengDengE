package service;

import java.util.List;

import dao.iCommuBbsDao;
import dao.CommuBbsDao;
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
			return manager.udtCommu(comdto);
		}
}


