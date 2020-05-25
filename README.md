# iOS Dictionary App

This is a bare-bones iOS dictionary app.
It uses only the device's internal dictionary, making this app offline, free, ad-free, and extremely simple to use.
Unfortunately according to Apple's developer documentation, an app that employs the "[UIReferenceLibraryViewController object should not be used to display wordlists, create a standalone dictionary app, or republish the content in any form](https://developer.apple.com/documentation/uikit/uireferencelibraryviewcontroller?language=objc)".
Furthermore, it turns out that apps built with free provisioning profiles have a [time limit of running on a device for just seven days](https://mybyways.com/blog/new-limitations-imposed-on-free-apple-developer-account) until the app boots up with black screen and immediately exits, making it unusable unless it is rebuilt.
I built this project to accompany my personal reading, but it looks like I must yet again venture on a quest to find a dictionary app that fulfills all of my requirements.

Built using Xcode 8.0.

## Demo
![demo.gif](resources/demo.gif)
