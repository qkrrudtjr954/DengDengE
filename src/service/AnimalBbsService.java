package service;

import java.util.List;

import dao.AnimalBbsDao;
import dto.AnimalBbsDto;

public class AnimalBbsService {
	private static AnimalBbsService aniBbService;
	public AnimalBbsDao aniBbsManager;
	
	private AnimalBbsService() {
		aniBbsManager = new AnimalBbsDao();
	}
	
	public static AnimalBbsService getInatance() {
		if(aniBbService == null) {
			aniBbService  = new AnimalBbsService();
		}
		return aniBbService;
	}
	
		// 글목록
		public List<AnimalBbsDto> getAnimalBbsList() {
			return aniBbsManager.getAnimalBbsList();
		}
		
		// 입양하기 글 작성
		public boolean wirteAnimalBbs(AnimalBbsDto anibDto) {
			return aniBbsManager.wirteAnimalBbs(anibDto);
		}
		
		// 입양하기 글 디테일
		public AnimalBbsDto detailAnimalBbs(int seq) {
			return aniBbsManager.detailAnimalBbs(seq);
		}
		
		// 입양하기 글 삭제
		public boolean deleteBbs(int seq) {
			return false;
		}
		
		/*
		// 페이징 처리
		public List<AnimalBbsDto> getAnimalBbspaging(paginBean paging) {
			return null;
		}
		*/
}
