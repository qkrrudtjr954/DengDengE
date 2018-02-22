package dao;

public class AnimalCommentDao {
	private static AnimalCommentDao anicomDao = null;
	
	private AnimalCommentDao() {
	}
	
	public static AnimalCommentDao getInstance() {
		if(anicomDao == null) {
			anicomDao = new AnimalCommentDao();
		}
		return anicomDao;
	}
	

}
