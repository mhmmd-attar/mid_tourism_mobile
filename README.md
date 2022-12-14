MID-Tourism ✈️
==============================
by PT. Maju Indonesia Tourism <br>
**["Find your Tourism needs here! https://github.com/mhmmd-attar/mid_tourism_mobile/releases/tag/v.1"]**

###### What are the instructions to build, run, and deploy the app?
1. **Install Prerequisites**
- [Download Flutter for MacOS](https://docs.flutter.dev/get-started/install/macos) 
- [Download Flutter for Windows](https://docs.flutter.dev/get-started/install/windows)
- [Download Flutter for Linux](https://docs.flutter.dev/get-started/install/linux)
- [Download Android Studio for IDE (Recommended)](https://developer.android.com/studio)
- Run "flutter doctor on command terminal to see if there are any other prerequisites required for your device!

2. **Initialize your local environment**
- Clone the repository <br>
- `git clone` <br>

3. **Branch the Repository**
- Create a new branch for each working member
- Push into your branch when done working 
- To work at your branch, do `git checkout -b [branch name]` to create your branch in local, or `git checkout [branch name]` if the branch already exists <br>
- Push into your branch when done working `git push origin [branch name]`
- Merge into staging when done <br>
- ***Do not push your work directly to main*** 

## Workflow
1. **Researching**
- Redefining modules to-be carried over into mobile app from web app 
- Looking into flutter documentation to better understand the general workflow of developing a mobile app 
- Looking into GitHub releases to better understand how to release a mobile app 

2. **UI/UX Design**
- Creating a UI/UX draft for every app 
- Implementing said draft in Figma

3. **Prelimenary coding**
- Coding in UI/UX design into Flutter 
- Still without integration with web app 

4. **Integrating backend**
- Utilizing web version of MID-Tourism to implement a backend for the mobile version of MID-Tourism 
- JSON Data from deployed Heroku app gets fetched from a link in the web into the mobile application
- Form submissions from mobile application gets posted into a view in the Django project to update the web app database 

5. **Revisions**
- Final front-end revisions <br>
- Troubleshooting back-end to verify functionality and prevent data loss
- Pushing "Staging" to Main 

6. **Release**
- Releasing using GitHub Releases/Firebase App Distribution/Microsoft Visual Studio App Center 

## FAQ? :
###### What is MID Tourism?
MID Tourism is a **one stop mobile app** for those who want to take a break and enjoy travelling, yet struggle with the technicalities of obtaining your daily needs when arriving at your location of leisure. We aim to make your trip the easiest it has ever been, while still maintaining the authenticity of the experience you are seeking.
MID Tourism, apart from servicing its users with ease-of-use and convenience, also offers much to the locale's residents. With opportunities for veritable  yet undeservedly unrecognized businesses such as rental transportation, hotels, restaurants, and tourguides, to exposure for the local landmarks, MID Tourism is headstrong in its mission to create a genuine bond between visitor and visitee. 

###### What are the features available on MID Tourism?
MID Tourism provides you many features: ⤵️

1. **Hotels** :
This the feature where you can overview the best recommended hotels in your designated area.

2. **Resto**
This feature helps you to find the best and the most famous restaurants in your designated area.

3. **Rental Transportation** :
This feature helps you to rent transportations safely in your designated area.

4. **Landmarks** :
This feature shows you the nearest and remarkable landmarks to visit in your designated area.

5. **Tourguide** :
This feature helps you to rent tourguides in your designated area.

## Member Roles
1. Dylan Pribadi :
- UI/UX Design

2. Halomoan Geraldo :
- Transportations Module

3. Kaloosh Falito Verrell :
- Restaurants Module

4. Mohammad Attar :
- Landmarks Module

5. Nicholas Lexi :
- Hotel Module

6. Raphael Fide :
- Tourguide Module

## Possible User Roles
1. Admins: Manages creation of all objects in all modules
2. Users: Views the objects and makes reservations 
