@isTest
private class RewardsCalloutServiceTest {
    
    @isTest
    static void testSubmitUsersWithStatus200() {
        Test.setMock(HttpCalloutMock.class, new RewardsCalloutServiceMock());
        
        Date startDate = getStartDate();
        Date endDate = getEndDate();
        
        List<Wellness_Journey__c> lstJourney = new List<Wellness_Journey__c>();
        User testUser = [SELECT Id, Name, Email, Username FROM User WHERE Id = :UserInfo.getUserId()];
        
        for (Integer i = 0; i < 12; i++) {
            Wellness_Journey__c journey = new Wellness_Journey__c();
            journey.OwnerId = testUser.Id;
            
            lstJourney.add(journey);
        }
        
        insert lstJourney;
        
        Test.startTest();
        Database.executeBatch(new WellnessJourneyRewardsBatch());
        Test.stopTest();
        
        System.debug('Start Date: ' + startDate);
        System.debug('End Date: ' + endDate);
        
        String jsonBody = JSON.serialize(lstJourney);
        Integer responseCode = RewardsCalloutService.submitUsersForRewardCallout(jsonBody);
        
        System.assertEquals(200, responseCode, 'Status Code should be 200');
    }
    
    @isTest
    static void testSubmitUsersWithStatus500() {
        Test.setMock(HttpCalloutMock.class, new RewardsCalloutServiceExceptionMock());
        
        String jsonError = '[{"userId" : "0001", "fullName" : "Test User", "email" : "user@test.com", "username" : "testUser"}]';
        
        Test.startTest();
        Integer responseCode = RewardsCalloutService.submitUsersForRewardCallout(jsonError);
        Test.stopTest();
        
        System.assertEquals(500, responseCode, 'Status Code should be 200');
    }
    
    private static Date getStartDate() {
        Date today = Date.today();
        Integer month = today.month();
        Integer year = today.year();
        
        Integer startMonth = ((month - 1) / 3) * 3 + 1 - 3;
        if (startMonth <= 0) {
            startMonth += 12;
            year--;
        }
        
        Date startDate = Date.newInstance(year, startMonth, 1);
        return startDate;
    }
    
    private static Date getEndDate() {
        Date endDate = getStartDate().addMonths(3).addDays(-1);
        return endDate;
    }
}