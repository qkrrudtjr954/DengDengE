package service;

import dao.SendMsgDao;

public class SendMasterService {
	
	private static SendMasterService sendService = null;
	
	public SendMsgDao manager;

	private SendMasterService() {
		manager = new SendMsgDao();
	}
	public static SendMasterService getInstance() {
		if(sendService==null) {
			sendService = new SendMasterService();
		}

		return sendService;
	}
	
	public boolean sendToMaster(int userseq, String category, String title, String email, String content) {
		return manager.sendToMaster(userseq, category, title, email, content);
	}

}
