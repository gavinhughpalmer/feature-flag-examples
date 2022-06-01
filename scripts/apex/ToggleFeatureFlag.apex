Id currentUserId = UserInfo.getUserId();
PermissionSet enableFeaturePermissionSet = [
    SELECT Id
    FROM PermissionSet
    WHERE Name = 'Enable_Feature'
];

List<PermissionSetAssignment> permissionSetAssignments = [
    SELECT Id
    FROM PermissionSetAssignment
    WHERE AssigneeId = :currentUserId
    AND PermissionSetId = :enableFeaturePermissionSet.Id
    AND IsActive = true
];
if (permissionSetAssignments.isEmpty()) {
    insert new PermissionSetAssignment(
        AssigneeId = currentUserId,
        PermissionSetId = enableFeaturePermissionSet.Id
    );
    System.debug('Feature is enabled');
} else {
    delete permissionSetAssignments[0];
    System.debug('Feature is disabled');
}