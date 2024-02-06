public with sharing class ThreadTokenController {
    public class Request {
        @InvocableVariable(required=true)
        public String recordId;
    }

    public class Response {
        @InvocableVariable
        public String formattedToken;
    }

    @InvocableMethod(label='Get Formatted Threading Token' description='Returns the formatted threading token for given record IDs.')
    public static List<Response> getTokens(List<Request> requests) {
        List<Response> responses = new List<Response>();
        
        for (Request req : requests) {
            Response res = new Response();
            try {
                ID recordId = Id.valueOf(req.recordId);
                res.formattedToken = EmailMessages.getFormattedThreadingToken(recordId);
            } catch(Exception e) {
                // Handle exception, e.g., invalid ID format
                res.formattedToken = 'Error: ' + e.getMessage();
            }
            responses.add(res);
        }          
        return responses;
    }
}