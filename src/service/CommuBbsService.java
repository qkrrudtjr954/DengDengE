package service;

public class CommuBbsService {
	// service는 dao만 콜할 수 있습니다.
		private static CommuBbsService comService = null;
		
		private CommuBbsService() {
			
		}
		public static CommuBbsService getInstance() {
			if(comService==null) {
				comService = new CommuBbsService();
			}
			
			return comService;
		}
		
		// service 는 dao를 singleton으로 호출합니다.
}
