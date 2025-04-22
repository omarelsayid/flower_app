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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your Email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your Password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forgetPassword {
    return Intl.message(
      'Forget password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Continue as guest`
  String get continueAsGuest {
    return Intl.message(
      'Continue as guest',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get haveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter first name`
  String get enterFirstName {
    return Intl.message(
      'Enter first name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter last name`
  String get enterLastName {
    return Intl.message(
      'Enter last name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message('First name', name: 'firstName', desc: '', args: []);
  }

  /// `Last name`
  String get lastName {
    return Intl.message('Last name', name: 'lastName', desc: '', args: []);
  }

  /// `Enter phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Creating an account, you agree to our`
  String get agreeToTerms {
    return Intl.message(
      'Creating an account, you agree to our',
      name: 'agreeToTerms',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginLink {
    return Intl.message('Login', name: 'loginLink', desc: '', args: []);
  }

  /// `Sign up`
  String get signUpLink {
    return Intl.message('Sign up', name: 'signUpLink', desc: '', args: []);
  }

  /// `Email cannot be empty`
  String get emailRequired {
    return Intl.message(
      'Email cannot be empty',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get emailInvalid {
    return Intl.message(
      'Please enter a valid email',
      name: 'emailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get passwordRequired {
    return Intl.message(
      'Password cannot be empty',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter and one number`
  String get passwordInvalid {
    return Intl.message(
      'Password must contain at least one uppercase letter and one number',
      name: 'passwordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Email verification`
  String get emailVerification {
    return Intl.message(
      'Email verification',
      name: 'emailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code sent to your email address`
  String get enterCodeSentToEmail {
    return Intl.message(
      'Please enter the code sent to your email address',
      name: 'enterCodeSentToEmail',
      desc: '',
      args: [],
    );
  }

  /// `Resend in`
  String get resendIn {
    return Intl.message('Resend in', name: 'resendIn', desc: '', args: []);
  }

  /// `Didn't receive code?`
  String get didNotReceiveCode {
    return Intl.message(
      'Didn\'t receive code?',
      name: 'didNotReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Please enter your email associated to your account`
  String get forgetPasswordDescription {
    return Intl.message(
      'Please enter your email associated to your account',
      name: 'forgetPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Guest User`
  String get guestUser {
    return Intl.message('Guest User', name: 'guestUser', desc: '', args: []);
  }

  /// `My orders`
  String get myOrders {
    return Intl.message('My orders', name: 'myOrders', desc: '', args: []);
  }

  /// `Saved address`
  String get savedAddress {
    return Intl.message(
      'Saved address',
      name: 'savedAddress',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `About us`
  String get aboutUs {
    return Intl.message('About us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Occasions`
  String get occasions {
    return Intl.message('Occasions', name: 'occasions', desc: '', args: []);
  }

  /// `Best Sellers`
  String get BestSellers {
    return Intl.message(
      'Best Sellers',
      name: 'BestSellers',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `View all`
  String get viewAll {
    return Intl.message('View all', name: 'viewAll', desc: '', args: []);
  }

  /// `confirm logout`
  String get confirmLogout {
    return Intl.message(
      'confirm logout',
      name: 'confirmLogout',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message('cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Saved Addresses`
  String get saved_addresses {
    return Intl.message(
      'Saved Addresses',
      name: 'saved_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get add_new_addresses {
    return Intl.message(
      'Add New Address',
      name: 'add_new_addresses',
      desc: '',
      args: [],
    );
  }

  /// `No address found.`
  String get no_address_found {
    return Intl.message(
      'No address found.',
      name: 'no_address_found',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Address Details`
  String get address_details {
    return Intl.message(
      'Address Details',
      name: 'address_details',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Street`
  String get street {
    return Intl.message('Street', name: 'street', desc: '', args: []);
  }

  /// `Bloom with our exquisite best sellers`
  String get bloomwithourexquisitebestsellers {
    return Intl.message(
      'Bloom with our exquisite best sellers',
      name: 'bloomwithourexquisitebestsellers',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Delivery time`
  String get deliveryTime {
    return Intl.message(
      'Delivery time',
      name: 'deliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message('Schedule', name: 'schedule', desc: '', args: []);
  }

  /// `Instant`
  String get instant {
    return Intl.message('Instant', name: 'instant', desc: '', args: []);
  }

  /// `Arrive by`
  String get arriveBy {
    return Intl.message('Arrive by', name: 'arriveBy', desc: '', args: []);
  }

  /// `Delivery Address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery Address',
      name: 'deliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add new`
  String get addNew {
    return Intl.message('Add new', name: 'addNew', desc: '', args: []);
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cash on delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Credit card`
  String get creditCard {
    return Intl.message('Credit card', name: 'creditCard', desc: '', args: []);
  }

  /// `It is a gift`
  String get itIsAGift {
    return Intl.message('It is a gift', name: 'itIsAGift', desc: '', args: []);
  }
  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Sub Total`
  String get subTotal {
    return Intl.message('Sub Total', name: 'subTotal', desc: '', args: []);
  }

  /// `Delivery Fee`
  String get deliveryFee {
    return Intl.message(
      'Delivery Fee',
      name: 'deliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Place order`
  String get placeOrder {
    return Intl.message('Place order', name: 'placeOrder', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
