global class AccessibilityProjectBilling{
     
     @future(callout=true)
     public static void callBillingService(String projectId, Decimal billingAmount){
          //Setup username, password, billAmount, and projectid in BillingServiceProxy.project and then call billProject method
          BillingServiceProxy.InvoicesPortSoap11 stub = new BillingServiceProxy.InvoicesPortSoap11();
          BillingServiceProxy.project project = new BillingServiceProxy.project();
          
          project.projectid = projectId;
          project.billAmount = Double.valueOf(billingAmount);
          project.username = '{!$Credential.BillingServiceCredential.username}';
          project.password = '{!$Credential.BillingServiceCredential.password}';
          
          //If response is ok set Accessibility Project Status = Complete
          try {
               String status = stub.billProject(project);
               
               if (status == 'ok') {
                    
                    Accessibility_Project__c accProject = [SELECT Id, Status__c FROM Accessibility_Project__c WHERE Id = :projectId WITH SECURITY_ENFORCED LIMIT 1];
                    accProject.Status__c = 'Complete';
                    
                    update as user accProject;
               }
          } catch (Exception e) {
               System.debug('--- SOAP CALL ERROR: ' + e.getMessage());
          }
     }
}