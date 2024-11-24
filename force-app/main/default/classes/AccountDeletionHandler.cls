public with sharing class AccountDeletionHandler {//Added comments here...
    public static void preventAccountDeletion(List<Account> accounts) {
        // Query for accounts that have related opportunities
        Set<Id> accountIdsWithOpportunities = new Set<Id>();
        for (Account a : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :accounts]) {
            accountIdsWithOpportunities.add(a.Id);
        }

        // Add error to accounts that have related opportunities
        for (Account a : accounts) {
            if (accountIdsWithOpportunities.contains(a.Id)) {
                a.addError('Cannot delete account with related opportunities.');
            }
        }
    }
}
