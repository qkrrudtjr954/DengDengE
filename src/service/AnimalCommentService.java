package service;

public class AnimalCommentService {
	private static AnimalCommentService animalbbscommService = null;
	
	private AnimalCommentService() {
	}
	
	public static AnimalCommentService getInstance() {
		if(animalbbscommService == null) {
			animalbbscommService = new AnimalCommentService();
		}
		return animalbbscommService;
	}
}
