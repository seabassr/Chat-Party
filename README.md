# Chat Party
Chat app for iOS, only keeping messages for that session

## Description
This iOS app will allow users to create/join chat parties, that will only keep messages for that session. The message will be stored in Firebase Firestore during the session. However, once all users leave the chat server, all message in that session will be deleted from Firebase. Also, users will be be able to customize their profile with preset profile emojis and colors, which are used in the chat session. Each created session will have a unique 6 digit code, which will allow other users to join.

<img src="/Demo/App/home.png" width="294" height="600"> <img src="/Demo/App/profile.png" width="294" height="600"> <img src="/Demo/App/server.png" width="294" height="600">

<img src="/Demo/App/start.png" width="294" height="600"> <img src="/Demo/App/leave.png" width="294" height="600">

<img src="/Demo/App/chat.png" width="646" height="600">

## Requirements
- XCode 13
- iOS 15.3.1
- Internet connection
- Firebase account

## Setup
1. Create a firebase project
2. Register XCode project to firebase project

<img src="/Demo/Setup/firebase1.png" width="484" height="500">

3. Drop the "GoogleService-Info.plist" file into project folder

<img src="/Demo/Setup/firebase2.png" width="402" height="500">

4. Make sure "Copy items if needed is checked", and "Add to targets" is checked to the current project, then press save

<img src="/Demo/Setup/firebase3.png" width="849" height="500">

5. Make sure you setup Firestore with "rooms" collection

<img src="/Demo/Setup/firebase4.png" width="1115" height="500">

## Fixes
- If you're getting Firebase package errors, you'll need to reinstall Firebase
1. Go to Chat-Party project (TOP OF SIDE BAR, WITH APP STORE ICON)
2. Go to package dependencies

<img src="/Demo/Setup/package1.png" width="1226" height="400">

3. Click firebase-ios-sdk
4. Click negative symbol
5. Click plus symbol
6. Search for "firebase-ios-sdk" (ONE PACKAGE SHOULD SHOW UP)
7. Click package
8. Click "Add Package" (THIS MIGHT TAKE AWHILE)
9. Check "FirebaseFirestore"

<img src="/Demo/Setup/package2.png" width="891" height="500">

10. Click "Add Package" (GIVE A MOMENT FOR FIREBASE TO SETUP)
