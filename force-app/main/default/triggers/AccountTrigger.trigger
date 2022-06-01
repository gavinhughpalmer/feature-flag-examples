trigger AccountTrigger on Account (before update) {

    // This strategy can be used when a new feature in its entirety is included
    // The same pattern can be applied directly in Apex classes
    if (FeatureManagement.checkPermission('Feature_Enabled')) {
        for (Account thisAccount : Trigger.new) {
            thisAccount.Not_Part_of_New_Feature__c = 'Updated ' + Datetime.now();
        }
    }

    for (Account thisAccount : Trigger.new) {
        thisAccount.Description = 'Updated ' + Datetime.now();
    }
}