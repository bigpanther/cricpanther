// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class CricpantherLocalizations {
  CricpantherLocalizations();

  static CricpantherLocalizations? _current;

  static CricpantherLocalizations get current {
    assert(_current != null, 'No instance of CricpantherLocalizations was loaded. Try to initialize the CricpantherLocalizations delegate before accessing CricpantherLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<CricpantherLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = CricpantherLocalizations();
      CricpantherLocalizations._current = instance;
 
      return instance;
    });
  } 

  static CricpantherLocalizations of(BuildContext context) {
    final instance = CricpantherLocalizations.maybeOf(context);
    assert(instance != null, 'No instance of CricpantherLocalizations present in the widget tree. Did you add CricpantherLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static CricpantherLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<CricpantherLocalizations>(context, CricpantherLocalizations);
  }

  /// `{param} is required`
  String paramRequired(Object param) {
    return Intl.message(
      '$param is required',
      name: 'paramRequired',
      desc: 'Param required',
      args: [param],
    );
  }

  /// `Hello {param}`
  String helloParam(Object param) {
    return Intl.message(
      'Hello $param',
      name: 'helloParam',
      desc: 'Hello param',
      args: [param],
    );
  }

  /// `Edit {param}`
  String editParam(Object param) {
    return Intl.message(
      'Edit $param',
      name: 'editParam',
      desc: 'Edit param',
      args: [param],
    );
  }

  /// `Add new {param}`
  String addNewParam(Object param) {
    return Intl.message(
      'Add new $param',
      name: 'addNewParam',
      desc: 'Add new param',
      args: [param],
    );
  }

  /// `Select {param}`
  String selectParam(Object param) {
    return Intl.message(
      'Select $param',
      name: 'selectParam',
      desc: 'Select param',
      args: [param],
    );
  }

  /// `Created at`
  String get createdAt {
    return Intl.message(
      'Created at',
      name: 'createdAt',
      desc: 'Created at ',
      args: [],
    );
  }

  /// `Last update`
  String get lastUpdate {
    return Intl.message(
      'Last update',
      name: 'lastUpdate',
      desc: 'Last update ',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: 'Email',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: 'Home',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: 'Logout',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: 'Sign In',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: 'Register',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Settings',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: 'About Us',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: 'Password',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: 'Name',
      args: [],
    );
  }

  /// `Welcome to Cric Panther`
  String get welcome {
    return Intl.message(
      'Welcome to Cric Panther',
      name: 'welcome',
      desc: 'Welcome to Cric Panther',
      args: [],
    );
  }

  /// `An Email has been sent to {emailId}. Please check your inbox.`
  String emailSent(Object emailId) {
    return Intl.message(
      'An Email has been sent to $emailId. Please check your inbox.',
      name: 'emailSent',
      desc: 'An Email has been sent',
      args: [emailId],
    );
  }

  /// `This Email Id is not yet verified. Please try again.`
  String get emailNotVerified {
    return Intl.message(
      'This Email Id is not yet verified. Please try again.',
      name: 'emailNotVerified',
      desc: 'This Email Id is not yet verified. Please try again.',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: 'Reset Password',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: 'Forgot Password?',
      args: [],
    );
  }

  /// `An email with the reset link would be sent to you.`
  String get resetPasswordMessage {
    return Intl.message(
      'An email with the reset link would be sent to you.',
      name: 'resetPasswordMessage',
      desc: 'Reset password message',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: 'profile',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: 'save',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: 'edit',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: 'create',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordDoesntMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordDoesntMatch',
      desc: 'Passwords do not match',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: 'Username',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: 'Confirm password',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: 'Change password',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: 'new password',
      args: [],
    );
  }

  /// `Old password`
  String get oldPassword {
    return Intl.message(
      'Old password',
      name: 'oldPassword',
      desc: 'old password',
      args: [],
    );
  }

  /// `I verified`
  String get iVerified {
    return Intl.message(
      'I verified',
      name: 'iVerified',
      desc: 'I verified',
      args: [],
    );
  }

  /// `Resend email`
  String get resendEmail {
    return Intl.message(
      'Resend email',
      name: 'resendEmail',
      desc: 'Resend email',
      args: [],
    );
  }

  /// `An error occured during log-in. Please retry.`
  String get loginError {
    return Intl.message(
      'An error occured during log-in. Please retry.',
      name: 'loginError',
      desc: 'An error occured during log-in. Please retry.',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: 'clear',
      args: [],
    );
  }

  /// `Cric Panther`
  String get cricpantherTitle {
    return Intl.message(
      'Cric Panther',
      name: 'cricpantherTitle',
      desc: 'Cric Panther',
      args: [],
    );
  }

  /// `©2020-2021 Big Panther Technologies Inc.`
  String get applicationLegalese {
    return Intl.message(
      '©2020-2021 Big Panther Technologies Inc.',
      name: 'applicationLegalese',
      desc: '©2020-2021 Big Panther Technologies Inc.',
      args: [],
    );
  }

  /// `Built with ♥️ in Canada`
  String get madeWithLove {
    return Intl.message(
      'Built with ♥️ in Canada',
      name: 'madeWithLove',
      desc: 'Built with ♥️ in Canada',
      args: [],
    );
  }

  /// `Reach us at`
  String get reachUsAt {
    return Intl.message(
      'Reach us at',
      name: 'reachUsAt',
      desc: 'Reach us at',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<CricpantherLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pa'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<CricpantherLocalizations> load(Locale locale) => CricpantherLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}