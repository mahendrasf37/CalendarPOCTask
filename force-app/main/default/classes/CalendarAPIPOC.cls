public class CalendarAPIPOC {
    
@AuraEnabled
    public static list<CalendarWrapper>  getCalendar()
    {
        list<Object> mapJsonData = new list<Object> ();
        List<CalendarWrapper> calList = new List<CalendarWrapper>();
        HttpRequest req = new HttpRequest();
		Http http = new Http();
		req.setMethod('GET');
        req.setEndpoint('https://calendarific.com/api/v2/holidays?country=CA&year=2020&api_key=6a44420c05daf841fcbad29dbcecdbe2d4a353cd');
        HTTPResponse resp = http.send(req);
        Integer iStatusCode=resp.getStatusCode();
            if(iStatusCode==200)
            {
              // System.debug(resp.getBody());
                
                Map<String, Object> results = (Map<String, Object>)System.JSON.deserializeUntyped(resp.getBody());
                
                Map<String, Object> meta = (Map<String, Object>)(results.get('response'));
                mapJsonData = (list<Object>) meta.get('holidays');

                for(Integer i=0; i < mapJsonData.size(); i++ )
                {
                    Map<String,Object> m = (Map<String,Object>) mapJsonData[i];
                    Map<String,Object> n = (Map<String,Object>) m.get('date');
                    CalendarWrapper cw = new CalendarWrapper();
                    cw.sno = i;
                    cw.name = (String)m.get('name');
                    cw.description =(String)m.get('description');
                    cw.cdate =(String) n.get('iso');
                    calList.add(cw);
                }
                              
            }
        	return calList;
    }

    public class CalendarWrapper {
        @AuraEnabled
        public String name{get;set;}
        
        @AuraEnabled
        public String cdate{get;set;}
        
        @AuraEnabled
        public String description{get;set;}
        
        @AuraEnabled
        public Integer sno{get;set;}
        
    }
}