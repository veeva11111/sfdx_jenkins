@IsTest
private class AccountDeletionHandlerTest {
    @IsTest
    static void testPreventAccountDeletion() {
        // Create test data
        Account accountWithOpportunity = new Account(Name = 'Test Account With Opportunity');
        insert accountWithOpportunity;

        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(30),
            AccountId = accountWithOpportunity.Id
        );
        insert opp;

        Account accountWithoutOpportunity = new Account(Name = 'Test Account Without Opportunity');
        insert accountWithoutOpportunity;

        // Add accounts to a list
        List<Account> accountsToDelete = [SELECT Id FROM Account WHERE Id IN :new Set<Id>{accountWithOpportunity.Id, accountWithoutOpportunity.Id}];

        // Call the method to test
        Test.startTest();
        AccountDeletionHandler.preventAccountDeletion(accountsToDelete);
        Test.stopTest();

        // Verify the results
        for (Account acc : accountsToDelete) {
            if (acc.Id == accountWithOpportunity.Id) {
                System.assertEquals('Cannot delete account with related opportunities.', acc.getErrors()[0].getMessage());
            } else {
                System.assertEquals(0, acc.getErrors().size());
            }
        }
    }
}