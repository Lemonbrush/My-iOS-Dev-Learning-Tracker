# Project structure organisation

![ProjectStructureExample](https://github.com/Lemonbrush/My-iOS-Dev-Learning-Tracker/blob/main/Resources/Images/Other/ProjectStructureExample.png)

To keep all those hundreds of source files from ending up in the same directory, it's a good idea to set up some folder structure depending on your architecture. For instance, you can use the following:

    ├─ Models
    ├─ Views
    ├─ Controllers (or ViewModels, if your architecture is MVVM)
    ├─ Stores
    ├─ Helpers

First, create them as groups (little yellow "folders") within the group with your project's name in Xcode's Project Navigator. Then, for each of the groups, link them to an actual directory in your project path by opening their File Inspector on the right, hitting the little gray folder icon, and creating a new subfolder with the name of the group in your project directory.   

[**`The source`**](https://github.com/futurice/ios-good-practices)