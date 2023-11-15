/*
*********************************************************
Apex Trigger       : ContactTrigger
Created Date       : Nov 07, 2020
@description       : This trigger is used to run after update
@author            : Dimitar Milev
*********************************************************
*/
trigger ContactTrigger on Contact (after update) {
    //Call method updateAccountLastContactUpdate from class ContactTriggerHandler
    ContactTriggerHandler.updateAccountLastContactUpdate(trigger.New);
}
