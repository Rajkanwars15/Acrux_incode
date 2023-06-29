import 'package:flutter/foundation.dart';

class UserProfile {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });
}

class UserProfileProvider with ChangeNotifier {
  UserProfile _userProfile = UserProfile(
    firstName: '',
    lastName: '',
    phoneNumber: '',
    email: '',
  );

  UserProfile get userProfile => _userProfile;

  void setUserProfile(UserProfile userProfile) {
    _userProfile = userProfile;
    notifyListeners();
  }

  void setFirstName(String firstName) {
    _userProfile.firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName) {
    _userProfile.lastName = lastName;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _userProfile.phoneNumber = phoneNumber;
    notifyListeners();
  }

  void setEmail(String email) {
    _userProfile.email = email;
    notifyListeners();
  }
}
