/*
*@author - Emerson
*/
public class AccountFilter {

    public List<Account> filterByRevenue (List<Account> newAccounts, Map<Id,Account> oldAccounts) {

        List<Account> filteredAccounts = new List<Account>();

        for (Account account : newAccounts) {

            if (account.AnnualRevenue > 1000000) {
                continue;
            }

            filteredAccounts.add(account);

        }
        return filteredAccounts;

    }

}