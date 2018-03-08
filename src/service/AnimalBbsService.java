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
		if (aniBbService == null) {
			aniBbService = new AnimalBbsService();
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
			return aniBbsManager.deleteAnimalBbs(seq);
		}

		// 입양하기 글 수정
		public boolean updateAnimalBbs(int seq, AnimalBbsDto aniBbsDto) {
			return aniBbsManager.updateAnimalBbs(seq, aniBbsDto);
		}

		// 조회수
		public void readCount(int seq) {
			aniBbsManager.readCount(seq);
	      }

		// 입력하는 검색
		 public List<AnimalBbsDto> getFindBbslist(String Searchtype, String Searchtext){
			 return aniBbsManager.getFindBbslist(Searchtype, Searchtext);
		 }

		 // 버튼 검색 분류
		 public List<AnimalBbsDto> getFindBtnlist(String searchBtn){
			 return aniBbsManager.getFindBtnlist(searchBtn);
		 }
		// 버튼 검색 지역
		 public List<AnimalBbsDto> getFindBtnlistlocal(String searchBtn1){
			 return aniBbsManager.getFindBtnlistlocal(searchBtn1);
		 }

		 // 예약 확정
		 public boolean bookBbs(int seq, String complete_email) {
			 return aniBbsManager.bookBbs(seq, complete_email);
		 }

		 public boolean Prevent_duplication(int target_user_seq, int target_bbs_seq) {
	 		return aniBbsManager.Prevent_duplication(target_user_seq, target_bbs_seq);
	 	}

	 	public void likeTB_delete(int target_user_seq, int target_bbs_seq) {
	 		aniBbsManager.likeTB_delete(target_user_seq, target_bbs_seq);
	 	}

	 	public void likeTB_insert(int target_user_seq, int target_bbs_seq) {
	 		aniBbsManager.likeTB_insert(target_user_seq, target_bbs_seq);
	 	}

	 	public int getLikeCount(int bbs_seq) {
	 		return aniBbsManager.getLikeCount(bbs_seq);
	 	}
}
