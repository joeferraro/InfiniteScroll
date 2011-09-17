global class InfiniteScrollResponse {
	global Boolean hasMore { get; set; }
   	global Integer pageNumber { get; set; }
    global List<SObject> records { get; set; }
    global InfiniteScrollResponse(List<SObject> records) {
    	this.records = records;
    }
}