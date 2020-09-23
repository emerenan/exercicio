/*
*@author - Emerson
*/
public class AccountTriggerHandler extends TriggerHandler{

    List<Account> newAccounts;

    Map<Id,Account> oldAccounts;

    AccountFilter filter;

    AccountValidator validator;
  
    public AccountTriggerHandler() {
        this ( (List<Account>) Trigger.new, (Map<Id,Account>) Trigger.oldMap);
    }
  
    public AccountTriggerHandler(List<Account> newAccounts, Map<Id,Account> oldAccounts) {
        
        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;

        this.filter = new AccountFilter();
        this.validator = new AccountValidator();
    }

    override
    public void beforeInsert() {
        validateAnnualRevenue ();
    }

    override
    public void afterInsert() {
        validateAnnualRevenue ();
    }

    virtual
    public void validateAnnualRevenue () {
        List<Account> filteredAccounts = this.filter.filterByRevenue(newAccounts, oldAccounts);
        
        this.validator.validateAnnualRevenue(filteredAccounts);
    }

}