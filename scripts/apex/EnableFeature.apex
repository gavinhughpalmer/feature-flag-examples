String featurePermissionSet = 'Enable_Feature';

PermissionSet enableFeaturePermissionSet = [
    SELECT Id
    FROM PermissionSet
    WHERE Name = :featurePermissionSet
];

List<User> allActiveUsers = [
    SELECT Id
    FROM User
    WHERE IsActive = true
];

List<PermissionSetAssignment> assignments = new List<PermissionSetAssignment>();
for (User aUser : allActiveUsers) {
    assignments.add(
        new PermissionSetAssignment(
            AssigneeId = aUser.Id,
            PermissionSetId = enableFeaturePermissionSet.Id
        )
    );
}