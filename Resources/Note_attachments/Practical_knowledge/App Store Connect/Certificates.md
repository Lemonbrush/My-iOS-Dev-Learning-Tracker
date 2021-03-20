# Certificates

In order to register your app ID you need to go from Apple Developer to

`Certificates, IDs & Profiles -> Identifiers, App IDs -> *plus button*`

Here should be filling form like that 

![screen](Resources/Images/Other/AppIDDescription.jpeg)

There should be list apple services so you also can tick those you need to include in your app

Then `Continue -> Register -> Done`

Now the server should process this request so it can take a while to reflect chosen services 

### Note:

- Bundle IDs have to be unique so it is a good idea to use reverse domain name like so

`com.yourCompanyName.YourAppName`