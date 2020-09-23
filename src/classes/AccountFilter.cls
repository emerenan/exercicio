/*
*@author - Emerson
*/
public with sharing class AccountFilter {

    public List<Account> filterByRevenue (List<Account> newAccounts) {

        List<Account> filteredAccounts = new List<Account>();

        String category;

        for (Account account : newAccounts) {

            if (account.AnnualRevenue > 1000000) {
                category = 'Premium';
                account.Category__c = category;
            }else {
                category = 'Standard';
                account.Category__c = category;
            }

            filteredAccounts.add(account);

        }
        return filteredAccounts;

    }

}