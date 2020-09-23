public class AccountValidator {
    public List<Account> validateAnnualRevenue (List<Account> accounts) {
        
        for (Account account : accounts) {
            if (account.Category__c == 'Premium' && account.AnnualRevenue >= 1000000) {
                continue;
            }else {
                account.addError('Sem agendamento de apresentação para essa conta.');
            }

        }

        return accounts;
    }

}