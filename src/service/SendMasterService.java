package service;

import java.util.List;

import dao.SendMsgDao;
import dto.SendMaster;

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
	
	public boolean sendToMaster(SendMaster sendMaster) {
		return manager.sendToMaster(sendMaster);
	}
	public List<SendMaster> getAllSendMaster(int seq) {
		return manager.getAllSendMaster(seq);
	}
	
	public SendMaster getInquiry(int seq) {
		return manager.getInquiry(seq);
	}

}
