trigger AccountTrigger on Account (before insert, after insert) {
    if (Trigger.isBefore && Trigger.isInsert) {

        new AccountTriggerHandler().run();
    }
 
}