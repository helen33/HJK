package util;

// 자료실
public class PageHelper {
	
	private int pageSize = 10; // 한 페이지당 보이는 게시물 수
	private int blockSize = 10; //보이는 페이지 수

	public int getPageSize() {
		return pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	// 현재 페이지와 전체 레코드수를 입력 받아 페이징 표시 문자열을 반환한다. 
	public StringBuffer getPageUrl(int currentPage, int totalNum) {
		
		StringBuffer PageUrl = new StringBuffer();
		int startPage = 0;
		int lastPage = 0;
		
		//표시할 시작페이지와 끝페이지 계산 
		startPage = ((currentPage-1) / blockSize) * blockSize + 1;
		lastPage = startPage + blockSize - 1;
		
		//전체 페이지 수와 블럭수 계산  
		int totalPage = totalNum/pageSize + 1;
		int totalBlock = totalPage/blockSize + 1;
		int currentBlock = currentPage/blockSize + 1;      
		 
		
		System.out.println("페이지헬퍼 1 ");
		
		//표시되는 끝 페이지가 전체 마지막 페이지인 경우 전체 페이지보다 큰 경우 발생시  조정 
		if(lastPage > (totalNum / pageSize) ) {
			lastPage = (totalNum /pageSize) + 1;
		}
 
		if(currentBlock > 1){
			PageUrl.append("<span><a href=\"esmain.do?es_page=/libraryForm.do?page=" + (currentPage-1) + "\"><이전></a>&nbsp;&nbsp;");
		}else{
			PageUrl.append("<span>");
		}
			
		for(int i = startPage ; i <= lastPage ; i++) {
			if(i == currentPage){
				PageUrl.append(".&nbsp;<strong>");
				PageUrl.append( i );
				PageUrl.append("&nbsp;</strong>");
			} else {
				PageUrl.append(".&nbsp;<a href=\"esmain.do?es_page=/libraryForm.do?page=" +i + "\" class=\"page\">" + i + "</a>&nbsp;");
			}		
		}

		if(currentBlock <= totalBlock){
			PageUrl.append(".&nbsp;&nbsp;<a href=\"esmain.do?es_page=/libraryForm.do?page=" + (currentPage+1) + "\"><다음></a></span>");
		}else{
			PageUrl.append(".</span>");
		}
			
		return PageUrl;
	}

}
