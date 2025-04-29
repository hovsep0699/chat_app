// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(statusCode, message) =>
      "Response failed with status code ${statusCode}: ${message}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appName": MessageLookupByLibrary.simpleMessage("ChatApp"),
    "btnCreateAccount": MessageLookupByLibrary.simpleMessage("Create account"),
    "btnLogin": MessageLookupByLibrary.simpleMessage("Log In"),
    "conflictErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Conflict error",
    ),
    "hintRepeatPassword": MessageLookupByLibrary.simpleMessage(
      "Repeat password",
    ),
    "hintYourEmail": MessageLookupByLibrary.simpleMessage("email@domain.com"),
    "hintYourFirstname": MessageLookupByLibrary.simpleMessage("First name"),
    "hintYourLastname": MessageLookupByLibrary.simpleMessage("Last name"),
    "hintYourPassword": MessageLookupByLibrary.simpleMessage("Password"),
    "incorrectCredentialsErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Incorrect credentials",
    ),
    "invalidRequestErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Invalid Request",
    ),
    "lblAlreadyRegistered": MessageLookupByLibrary.simpleMessage(
      "Already registered? Login to your account",
    ),
    "lblConfirmPassword": MessageLookupByLibrary.simpleMessage(
      "Please confirm your password",
    ),
    "lblEmailRequire": MessageLookupByLibrary.simpleMessage(
      "Email is required",
    ),
    "lblEnterPassword": MessageLookupByLibrary.simpleMessage(
      "Enter your email and password to create \n an account. Confirmation mail will be sent to \n your email.",
    ),
    "lblLogin": MessageLookupByLibrary.simpleMessage("Log in"),
    "lblLoginFailed": MessageLookupByLibrary.simpleMessage("Login failed"),
    "lblNotYetRegistered": MessageLookupByLibrary.simpleMessage(
      "Not yet registered? Sign up with your email",
    ),
    "lblPasswordDontMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "lblPasswordLength": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters",
    ),
    "lblRequirePassword": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "lblSignUp": MessageLookupByLibrary.simpleMessage("Sign up"),
    "lblUnableSignup": MessageLookupByLibrary.simpleMessage(
      "Unable to sign up",
    ),
    "lblValidEmail": MessageLookupByLibrary.simpleMessage(
      "Enter a valid email address",
    ),
    "nullResponseMessage": MessageLookupByLibrary.simpleMessage(
      "Response is null",
    ),
    "permissionErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Permission denied",
    ),
    "requestAccessErrorMessage": MessageLookupByLibrary.simpleMessage(
      "No Access to perform the request",
    ),
    "resourceErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Resource was not found or does not exist",
    ),
    "responseFailedErrorMessage": m0,
    "serverCommunicationErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Error while communicating to the server",
    ),
    "serverSideErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Request failed due to server-side",
    ),
    "unknownErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Unknown Error",
    ),
    "validationErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Validation error",
    ),
  };
}
