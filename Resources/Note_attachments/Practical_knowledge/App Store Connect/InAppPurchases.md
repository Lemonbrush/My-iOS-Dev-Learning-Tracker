# In-App Purchases

**1)** Make a certificate for the app

**3)** Get rid of any complains from App Store Connect (ok things you have to ok etc)

**4)** Set up everyting in **Agreements, Tax, and Banking**. It might take some time before approval 

**5)** Make sure the Apple Developer does not have any complains (ok things)

**6)** Create new app in App Store Connect

*Note:* SKU (stock keeping unit) is a unique id for identification among your apps catalogue  

SKU example: `LAB-00167`

"Lab brewery" - "App number"

**7)** Head up to the Features tab in the app's page

**8)** Create new In-App Purchase 

**9)** Fill the form

*Note:* Product id is the app's bundle ID + In-App Purchase name like so  

`com.yourCompanyName.YourAppName.YourInAppPurchaseName`

This one is also used for testing the app.

You also can keep some fields unfilled (screenshots) unill you can fill them all in future.

**10)** Go to **Targets** in the Xcode project -> Signing & Capabilities -> **plus button on the right top corner** -> In-App Purchace

*Note:* If it does not show up in the list, make sure that, in the Accounts section of Xcode preferences, you are logged in with the Apple ID you used to create the app ID.

...

### Articles

- [A Complete Guide to In-App Purchases for iOS Development](https://www.appcoda.com/in-app-purchases-guide/)
- [In-App Purchase Tutorial: Getting Started](https://www.raywenderlich.com/5456-in-app-purchase-tutorial-getting-started)
- [In‑App Purchase (Apple Developer)](https://developer.apple.com/in-app-purchase/)
- [In-App Purchase StoreKit Documentation](https://developer.apple.com/documentation/storekit/in-app_purchase)
- [Promoting Your In-App Purchases (Apple Developer)](https://developer.apple.com/app-store/promoting-in-app-purchases/)
