# User Authentication & Auth Status Management

## Learning Topics
* How authentication works in Flutter Apps
* Signup & Login
* Managing User Sessions

I created a new authentication screen that will capture the user's email and password. I'm
using [Firebase](https://firebase.google.com/docs/auth) for my authentication. 

This image shows how authentication is just a feature of Firebase in the menu.

![](images/auth_menu.png)

This is the link to the firebase REST API docs: [Firebase Auth REST API](https://firebase.google.com/docs/reference/rest/auth)

## Tokens
The token is used to track the user's login state, so that they don't have to login again. After I authenticate the user, I pull the user's token, expiryDate, and userId.

```dart
_token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
          notifyListeners();
```
The parameters `idToken`, `localId`, and `expiresIn` are found in the [Firebase Auth Documentation](https://firebase.google.com/docs/reference/rest/auth#section-sign-in-email-password). 

![auth response image](images/auth_response_payload.png)
