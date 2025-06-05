public class RewardsCalloutService{
    
    public static Integer submitUsersForRewardCallout(String jsonBody) {
        //Set Endpoint from Named Credential
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:IntegrationSB__BalancedLiving');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(jsonBody);
        
        //Make HTTP Callout
        try {
            HttpResponse response = http.send(request);
            
            System.debug('--- RESPONSE STATUS: ' + response.getStatusCode());
            System.debug('--- RESPONSE BODY: ' + response.getBody());
            
            return response.getStatusCode();
            
        } catch (Exception e) {
            System.debug('--- ERROR: ' + e.getMessage());
            return 500;
        }
    }
}