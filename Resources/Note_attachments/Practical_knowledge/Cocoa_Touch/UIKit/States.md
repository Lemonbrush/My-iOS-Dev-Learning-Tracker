# The App Life Cycle

### Scene based life-cycle events
![AppStatesDiagram](https://github.com/Lemonbrush/My-iOS-Dev-Learning-Tracker/blob/main/Resources/Images/Other/AppStates.png)

### App based life-cycle
![AppStatesDiagram](https://github.com/Lemonbrush/My-iOS-Dev-Learning-Tracker/blob/main/Resources/Images/Other/AppBasedLifeCycle.png)

1) App Launched  
2) App Visible  
3) App Recedes into Background  
4) Resources Reclaimed  

##### Basic steps an app goes through   

1) **`application(_:didFinishLaunchingWithOptions:)`**  
2) **`scene(_:willConnectTo:oprions:)`**  
3) `viewDidLoad`  
4) `viewWillAppear`  
5) **`sceneWillEnterForeground(_:)`**  
6) **`sceneDidBecomeActive(_:)`**  
7) `viewDidAppear`  

##### When user switches to another app

1) **`sceneWillResignActive(_:)`**  
2) **`sceneDidEnterBackground(_:)`**

##### When user switches back to the app

1) **`sceneDidBecomeActive(_:)`**  
2) **`sceneWillResignActive(_:)`**

##### When user closes the app

1) **`sceneDidDisconnect(_:)`**  
2) **`application(_:didDiscardSceneSessions:)`**

### Official Documentation 

- [Managing Your App's Life Cycle](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle)