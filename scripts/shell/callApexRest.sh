# this does require httpie, which can be installed through homebrew using "brew install httpie"

baseUrl=
accountName=Gavin
bearerToken=

https $baseUrl/services/apexrest/Account name=$accountName -A bearer -a $bearerToken