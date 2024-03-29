import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appName" : MessageLookupByLibrary.simpleMessage("Firebase starter"),
    "cancelButtonLabel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "confirmPasswordFieldLabel" : MessageLookupByLibrary.simpleMessage("Confirm password"),
    "confirmPasswordValidationEmptyError" : MessageLookupByLibrary.simpleMessage("Please confirm password"),
    "confirmPasswordValidationMatchError" : MessageLookupByLibrary.simpleMessage("Passwords do not match"),
    "editProfile" : MessageLookupByLibrary.simpleMessage("Edit Profile"),
    "emailFieldlabel" : MessageLookupByLibrary.simpleMessage("Email"),
    "emailValidationError" : MessageLookupByLibrary.simpleMessage("Please enter email"),
    "googleButtonText" : MessageLookupByLibrary.simpleMessage("Continue with Google"),
    "introFinishButtonLabel" : MessageLookupByLibrary.simpleMessage("Get Started"),
    "loginButtonText" : MessageLookupByLibrary.simpleMessage("Login"),
    "loginPageSubtitleText" : MessageLookupByLibrary.simpleMessage("Our awesome login app"),
    "loginPageTitleText" : MessageLookupByLibrary.simpleMessage("Welcome"),
    "logoutButtonText" : MessageLookupByLibrary.simpleMessage("Log out"),
    "nameFieldLabel" : MessageLookupByLibrary.simpleMessage("Name"),
    "passwordFieldLabel" : MessageLookupByLibrary.simpleMessage("Password"),
    "passwordValidationError" : MessageLookupByLibrary.simpleMessage("Please enter password"),
    "pickFromCameraButtonLabel" : MessageLookupByLibrary.simpleMessage("Take Photo"),
    "pickFromGalleryButtonLabel" : MessageLookupByLibrary.simpleMessage("Gallery"),
    "pickImageDialogTitle" : MessageLookupByLibrary.simpleMessage("Pick Image"),
    "profilePageTitle" : MessageLookupByLibrary.simpleMessage("Profile"),
    "saveButtonLabel" : MessageLookupByLibrary.simpleMessage("Save"),
    "signupButtonText" : MessageLookupByLibrary.simpleMessage("Sign up")
  };
}
