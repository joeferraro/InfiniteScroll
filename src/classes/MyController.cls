global with sharing class MyController {

	public Integer globalLimit {
		get; 
		set;
	}
	
	public MyController() {
		globalLimit = 5;
	}
	
	public InfiniteScrollResponse getInfiniteScrollResponse() {        
		//return InfiniteScroll.getInfiniteScrollResponse(1, false);
		return InfiniteScroll.getInfiniteScrollResponseOffset(0, globalLimit);
	}
	
	@RemoteAction
    global static InfiniteScrollResponse getMore(Integer currentPageNumber) {    	    	
    	return InfiniteScroll.getInfiniteScrollResponse(currentPageNumber, true);    	
    }

    @RemoteAction
    global static InfiniteScrollResponse getMoreOffset(Integer offset, Integer reclimit) {
    	return InfiniteScroll.getInfiniteScrollResponseOffset(offset, reclimit);
    }
    
}