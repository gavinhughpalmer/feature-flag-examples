// The access to this class will be handled by the apex class permissions in the permission set
@RestResource(urlMapping='/Account/*')
global with sharing class WebServiceFeature {
    @HttpPost
    global static String doPost(String name) {
        Account newAccount = new Account(
            Name = name,
            Description = 'Created via HTTP POST'
        );
        insert newAccount;
        return newAccount.Id;
    }
}
// can be called using the script at ./scripts/shell/callApexRest.sh