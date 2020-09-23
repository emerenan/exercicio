@isTest
public class AccountFilterTest {

    @isTest public static void filterPremiumAccountByRevenueTest () {
        Account account = new Account (Name = 'Teste 01', AnnualRevenue = 1000000);

        AccountFilter filter = new AccountFilter(account);

    }
    @isTest public static void filterPremiumAccountByRevenueLowerOneMilionTest () {
        Account account = new Account (Name = 'Teste 02', AnnualRevenue = 900000);

        AccountFilter filter = new AccountFilter(account);

    }
    @isTest public static void filterStandardAccountByRevenueTest () {
        Account account = new Account (Name = 'Teste 03', AnnualRevenue = 600000);

        AccountFilter filter = new AccountFilter(account);

    }

}