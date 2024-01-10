import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_phone_auth/services/auth_service.dart';
import 'package:flutter_phone_auth/state/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class SignInPhoneModel extends StateNotifier<SignInState> {
  SignInPhoneModel({
   required this.authService,
  }) : super(const SignInState.notValid());

  AuthService authService;

  LibPhonenumberTextFormatter get phoneNumberFormatter {
    return LibPhonenumberTextFormatter(
      phoneNumberType: PhoneNumberType.mobile,
      phoneNumberFormat: PhoneNumberFormat.international,
      country: authService.selectedCountry,
      onFormatFinished: (inputText) async => _parsePhoneNumber(inputText),
    );
  }

  Future<void> _parsePhoneNumber(String inputText) async {
    try {
      await authService.parsePhoneNumber(inputText);
      state = const SignInState.canSubmit();
    } catch (e) {
      print(e.toString());
      if (!e.toString().contains('parse')) {
        state = SignInState.error(e.toString());
      } else {
        state = const SignInState.notValid();
      }
    }
  }

  Future<void> verifyPhone() async {
    state = const SignInState.loading();
    try {
      authService.verifyPhone(() {
        state = const SignInState.success();
      });
    } catch (e) {
      state =  SignInState.error(e.toString());
    }
  }
}