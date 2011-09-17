global with sharing class InfiniteScroll {
	
	static final Integer pageSize = 10;
	static final String soql = 'select id, name from account order by name';
	
    static ApexPages.StandardSetController getSObjectFeed() {
    	return new ApexPages.StandardSetController(Database.query(soql));     
    }
    
    public static InfiniteScrollResponse getInfiniteScrollResponse(Integer currentPageNumber, Boolean isGetMore) {
    	ApexPages.StandardSetController feed = getSObjectFeed();    	     	
        feed.setPageSize(pageSize);
        feed.setPageNumber(currentPageNumber);               
        if (!isGetMore) {
        	InfiniteScrollResponse r = new InfiniteScrollResponse((List<SObject>)feed.getRecords());
	        r.hasMore = feed.getHasNext();
	        r.pageNumber = feed.getPageNumber();
	        return r;
        } else {
        	if (feed.getHasNext()) {
		    	feed.next();
		        InfiniteScrollResponse r = new InfiniteScrollResponse((List<SObject>)feed.getRecords());
		        r.hasMore = feed.getHasNext();
		        r.pageNumber = feed.getPageNumber();
		        return r;
        	} else {
	    		InfiniteScrollResponse r = new InfiniteScrollResponse(null);
		        r.hasMore = false;
		        r.pageNumber = feed.getPageNumber();
		        return r;
        	}
    	}        
    }
	    
    static testmethod void testInfiniteScroll() {
    	
    }
}