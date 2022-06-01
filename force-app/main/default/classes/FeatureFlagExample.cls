// can be executed by executing the anonymous apex scripts/apex/FeatureFlagBranchingLogic.apex

// This option can be used to handle divergent logic for new features.
// For example a new feature is to introduce new logic to cover a changed regulation, but until the date the old logic should still run
public with sharing class FeatureFlagExample {

    public static String run() {
        // This logic can be extracted into a factory class to simplify the changes in the future to the changes for the interface as nessisary
        FeatureInterface feature = FeatureManagement.checkPermission('Feature_Enabled') ? (FeatureInterface) new FeatureEnabled() : (FeatureInterface) new FeatureDisabled();
        return feature.run();
    }

    // Note this would most likely be in seperate files, this has been written this way for simplicity
    private interface FeatureInterface {
        String run();
    }

    private class FeatureEnabled implements FeatureInterface {
        public String run() {
            return 'The feature is enabled!';
        }
    }

    private class FeatureDisabled implements FeatureInterface {
        public String run() {
            return 'The feature is disabled!';
        }
    }
}
