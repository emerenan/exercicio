/*
*@author - Emerson
*/
public class AccountTriggerHandler extends TriggerHandler{

    List<Account> newAccounts;

    AccountFilter filter;

    AccountValidator validator;
  
    public AccountTriggerHandler() {
        this ( (List<Account>) Trigger.new);
    }
  
    public AccountTriggerHandler(List<Account> newAccounts) {
        
        this.newAccounts = newAccounts;

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
        List<Account> filteredAccounts = this.filter.filterByRevenue(newAccounts);
        
        this.validator.validateAnnualRevenue(filteredAccounts);
    }

    public static void createAccountEvent(List<Account> newAccounts) {

        List<PremierAccount__e> newEvents = new List<PremierAccount__e>();

        for (Account account : newAccounts) {
            PremierAccount__e newEvent = new PremierAccount__e();
            newEvent.Name__C = account.Name + ' Event';
            newEvent.Category__c = account.Category__c;
            newEvent.Description__c = 'Apresentar o portifolio de Produtos para o novo cliente com enfoque em nossa carteira Premium';
            newEvent.Subject__c = 'Apresentação instucional dos produtos Premium';
            newEvent.StartDateTime__c = System.Today().addDays(1);
            newEvent.EndDateTime__c = newEvent.StartDateTime__c.addHours(1);

            newEvents.add(newEvent);
        }
        if (newEvents.size() > 0) {
            insert newEvents;
        }

    }



}