import { LightningElement } from 'lwc';
import hasPermission from '@salesforce/customPermission/Feature_Enabled'

export default class FeatureFlagTest extends LightningElement {
    body = hasPermission ? 'Feature Enabled!' : 'Feature Disabled';
}