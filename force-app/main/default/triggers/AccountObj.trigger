trigger AccountObj on Account (before insert , before update , after update) {

    if(Trigger.isBefore && Trigger.isInsert){
        System.debug('Account obj before trigger');
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            for(Account acc : Trigger.new){
                System.debug('New name is '+acc.name);
                System.debug('old name is '+Trigger.oldMap.get(acc.id).Name);
            }
        }
    }
    
}