
public with sharing class ActivateAccount implements ICommand {
    private Account acct;

    public ActivateAccount(Account acct) {
        this.acct = acct;
    }

    public void execute() {
        this.acct.Is_Activated__c = true;
    }
}
