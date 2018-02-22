package dao;

public class CommuBbsDao implements iCommuBbsDao{
	private static CommuBbsDao comDao = null;
	public CommuBbsDao() {
		// TODO Auto-generated constructor stub
	}
	public CommuBbsDao getInstance() {
		if(comDao==null) {
			comDao = new CommuBbsDao();
		}
		
		return comDao;
	}
	
	
}
