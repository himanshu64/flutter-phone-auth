import 'dart:ui' as ui;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_phone_auth/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService extends StateNotifier<AuthState> {
  AuthService() : super(const AuthState.initializing()) {
    _firebaseAuth = FirebaseAuth.instance;
    _loadCountries();
  }

  late FirebaseAuth _firebaseAuth;
  late CountryWithPhoneCode _selectedCountry;
   Map? _phoneNumber;
  late String _verificationId;
  List<CountryWithPhoneCode> countries = [];

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();
  CountryWithPhoneCode get selectedCountry => _selectedCountry;
  String get phoneCode => _selectedCountry.phoneCode;
  String get formattedPhoneNumber => _phoneNumber!['international'];

  Future<void> _loadCountries() async {
    try {
      await FlutterLibphonenumber().init();
      var _countries = CountryManager().countries;
      _countries.sort((a, b) {
        return a.countryName
            !.toLowerCase()
            .compareTo(b.countryName!.toLowerCase());
      });
      countries = _countries;

      final langCode = ui.window.locale.languageCode.toUpperCase();
      _firebaseAuth.setLanguageCode(langCode);

      var filteredCountries =
          countries.where((item) => item.countryCode == langCode);

      if (filteredCountries.isEmpty) {
        filteredCountries = countries.where((item) => item.countryCode == 'IN');
      }
      if (filteredCountries.isEmpty) {
        throw Exception('Unable to find a default country!');
      }
      setCountry(filteredCountries.first);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  void setCountry(CountryWithPhoneCode selectedCountry) {
    _selectedCountry = selectedCountry;
    state = AuthState.ready(selectedCountry);
  }

  Future<void> parsePhoneNumber(String inputText) async {
    print("format");
    _phoneNumber = await FlutterLibphonenumber().parse(
      "+${_selectedCountry.phoneCode}${inputText.replaceAll(RegExp(r'[^0-9]'), '')}",
      region: _selectedCountry.countryCode,
    );
    if (_phoneNumber!['type'] != 'mobile') {
      throw Exception('You must enter a mobile phone number.');
    }
  }

  Future<void> verifyPhone(Function() completion) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: _phoneNumber!['e164'],
      verificationCompleted: (AuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseException e) {
        throw e;
      },
      codeSent: (String verificationId, [int? resendToken]) {
        _verificationId = verificationId;
        completion();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
        completion();
      },
      timeout: const Duration(seconds: 120),
    );
  }

  Future<void> verifyCode(String smsCode, Function() completion) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );
    final user = await _firebaseAuth.signInWithCredential(credential);
  
      completion();

  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}