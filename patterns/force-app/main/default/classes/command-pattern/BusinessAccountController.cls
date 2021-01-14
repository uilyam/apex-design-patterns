public with sharing class BusinessAccountController {
    
    public void activate(List<Id> accountIds){
        List<ICommand> commands = new List<ICommand>();
        List<Account> accts = this.retrieveAccounts(accountIds);
        
        for (Account acct: accts) {
            ActivateAccount command = new ActivateAccount(acct);
            commands.add(command);
        }

        this.dispatch(commands);

        update accts;
    }

    public void deactivate(List<Id> accountIds){
        List<ICommand> commands = new List<ICommand>();
        List<Account> accts = this.retrieveAccounts(accountIds);
        
        for (Account acct: accts) {
            DeactivateAccount command = new DeactivateAccount(acct);
            commands.add(command);
        }

        this.dispatch(commands);

        update accts;
    }

    public Account[] retrieveAccounts(List<Id> accountIds) {
        return [
            SELECT
                Is_Activated__c
            FROM
                Account
            WHERE
                Id IN :accountIds
        ];
    }

    public void dispatch(ICommand[] commands) {
        for (ICommand command : commands) {
            command.execute();
        }
    }
}
