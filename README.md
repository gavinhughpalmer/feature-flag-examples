# Feature Flag POC

This repository contains a number of patterns for handling feature flagging within Salesforce. The idea centralises around a single mechanism to controll access to all facets of a feature on the Salesforce platform, including configuration (eg fields/flows) and code. For that reason Custom Permissions are used as the base, which are then assigned to a permission set and assigned to users to enable the feature. For communities Audiences also have to be used to enable the feature.

There are a number of scripts written below to toggle the feature on or off, run some of the example code (through apex anonymous) and fully enable a feature (ie assign to all users) and finally to execute a rest request against a class, that has been disabled via the permission set.

