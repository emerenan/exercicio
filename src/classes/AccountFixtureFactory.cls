/**
 * @author - Emerson Renan
 */
@isTest
public class AccountFixtureFactory {

    public static Account newAccount (String name, Double revenue, String category) {

        Account account = newAccount(name, revenue, category);
        return account;

    }

    public static Account createAccount ( String name, Double revenue, String category) {

        return createAccount ( newAccount(name, revenue, category) );
    
    }

    public static Account createAccount ( Account account ) {
        insert account;
        return account;
    }

}