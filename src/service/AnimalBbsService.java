package service;

public class AnimalBbsService {
	private static AnimalBbsService animalbbsService = null;
	
	private AnimalBbsService() {
	}

	public static  AnimalBbsService getInstance() {
		if(animalbbsService == null) {
			animalbbsService = new AnimalBbsService();
		}
		return animalbbsService;
	}
}
