@isTest
global class RewardsCalloutServiceExceptionMock implements HttpCalloutMock {
    
    global HTTPResponse respond(HTTPRequest req) {
        throw new CalloutException('Callout Error');
    }
}