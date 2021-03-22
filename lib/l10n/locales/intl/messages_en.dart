// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(param) => "Add new ${param}";

  static m1(param) => "Edit ${param}";

  static m2(emailId) => "An Email has been sent to ${emailId}. Please check your inbox.";

  static m3(param) => "Hello ${param}";

  static m4(param) => "${param} is required";

  static m5(param) => "Select ${param}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "aboutUs" : MessageLookupByLibrary.simpleMessage("About Us"),
    "addNewParam" : m0,
    "applicationLegalese" : MessageLookupByLibrary.simpleMessage("©2020-2021 Big Panther Technologies Inc."),
    "changePassword" : MessageLookupByLibrary.simpleMessage("Change password"),
    "clear" : MessageLookupByLibrary.simpleMessage("Clear"),
    "confirmPassword" : MessageLookupByLibrary.simpleMessage("Confirm password"),
    "create" : MessageLookupByLibrary.simpleMessage("Create"),
    "createdAt" : MessageLookupByLibrary.simpleMessage("Created at"),
    "cricpantherTitle" : MessageLookupByLibrary.simpleMessage("Cric Panther"),
    "edit" : MessageLookupByLibrary.simpleMessage("Edit"),
    "editParam" : m1,
    "email" : MessageLookupByLibrary.simpleMessage("Email"),
    "emailNotVerified" : MessageLookupByLibrary.simpleMessage("This Email Id is not yet verified. Please try again."),
    "emailSent" : m2,
    "forgotPassword" : MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "helloParam" : m3,
    "home" : MessageLookupByLibrary.simpleMessage("Home"),
    "iVerified" : MessageLookupByLibrary.simpleMessage("I verified"),
    "lastUpdate" : MessageLookupByLibrary.simpleMessage("Last update"),
    "loginError" : MessageLookupByLibrary.simpleMessage("An error occured during log-in. Please retry."),
    "logout" : MessageLookupByLibrary.simpleMessage("Logout"),
    "madeWithLove" : MessageLookupByLibrary.simpleMessage("Built with ♥️ in Canada"),
    "name" : MessageLookupByLibrary.simpleMessage("Name"),
    "newPassword" : MessageLookupByLibrary.simpleMessage("New password"),
    "oldPassword" : MessageLookupByLibrary.simpleMessage("Old password"),
    "paramRequired" : m4,
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "passwordDoesntMatch" : MessageLookupByLibrary.simpleMessage("Passwords do not match"),
    "profile" : MessageLookupByLibrary.simpleMessage("Profile"),
    "reachUsAt" : MessageLookupByLibrary.simpleMessage("Reach us at"),
    "register" : MessageLookupByLibrary.simpleMessage("Register"),
    "resendEmail" : MessageLookupByLibrary.simpleMessage("Resend email"),
    "resetPassword" : MessageLookupByLibrary.simpleMessage("Reset Password"),
    "resetPasswordMessage" : MessageLookupByLibrary.simpleMessage("An email with the reset link would be sent to you."),
    "save" : MessageLookupByLibrary.simpleMessage("Save"),
    "selectParam" : m5,
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "signIn" : MessageLookupByLibrary.simpleMessage("Sign In"),
    "username" : MessageLookupByLibrary.simpleMessage("Username"),
    "welcome" : MessageLookupByLibrary.simpleMessage("Welcome to Cric Panther")
  };
}
