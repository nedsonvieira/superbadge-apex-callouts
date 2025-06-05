@isTest
global class RewardsCalloutServiceMock implements HttpCalloutMock {
    
    global HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"status" : "Success"}');
        response.setStatusCode(200);
        
        return response;
    }
}