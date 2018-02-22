package Paging;

public class AfterPagingUtil {
	
	
	
	public static AfterPagingDto setPagingInfo(AfterPagingDto paging) {
		
		
		
		paging.setCountPerPage(10);		//1페이지당 총 글 갯수 10개	
		paging.setBlockCount(10);		//1페이지당 보여줄 blockcount 10개
		
		paging.setStartNum(				//현재 페이지 첫번째 글 number
				paging.getTotalCount() 		//총 글수 -((현재페이지-1)*페이지당보여줄 글의 갯수)
					- (paging.getNowPage()-1) * paging.getCountPerPage()
		);
		
		
		
		System.out.println("paging.getTotalCount():" + paging.getTotalCount());
		System.out.println("paging.getNowPage():" + paging.getNowPage());
		System.out.println("paging.getCountPerPage():" + paging.getCountPerPage());
		System.out.println("paging.getStartNum():" + paging.getStartNum());
		
		return paging;
		
	}
	
	

}
