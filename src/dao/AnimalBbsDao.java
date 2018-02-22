package dao;

public class AnimalBbsDao {
/*	
	+ getAnimalBbsList() : List<AnimalDto>
	+ wirteAimalBbs(AnimalBbsDto dto) : boolean
	+ detailAnimalBbs(int seq) : AnimalDto 
	+ deletBbs(int seq) : boolean
	+ getAnimalBbspaging(paginBean paging) : 
	List<AnimalDto>
*/
	
	private static AnimalBbsDao anibbsDao  = null;
	
	private AnimalBbsDao() {
	}
	
	public static AnimalBbsDao getInstance() {
		if(anibbsDao == null) {
			anibbsDao = new AnimalBbsDao();
		}
		return anibbsDao;
	}

}
