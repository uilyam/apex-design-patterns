public with sharing class DeactivateAccount implements ICommand {
    private Account acct;

    public DeactivateAccount(Account acct) {
        this.acct = acct;
    }

    public void execute() {
        this.acct.Is_Activated__c = true;
    }
}
