

import 'dart:async';

import 'package:flutter_phone_auth/services/auth_service.dart';
import 'package:flutter_phone_auth/state/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const delayBeforeUserCanRequestNewCode = 3000;

class SignInVerificationModel extends StateNotifier<SignInState> {
  SignInVerificationModel({
   required this.authService,
  }) : super(const SignInState.notValid()) {
    _startTimer();
  }

  AuthService authService;
  String get formattedPhoneNumber => authService.formattedPhoneNumber;

  late Timer _timer;
  StreamController<int> countdown = StreamController<int>();
  late int _countdown;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _countdown = delayBeforeUserCanRequestNewCode;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_countdown == 0) {
          timer.cancel();
        } else {
          _countdown--;
          countdown.add(_countdown);
        }
      },
    );
  }

  void resendCode() {
    state = const SignInState.loading();
    try {
      authService.verifyPhone(() {
        state = const SignInState.canSubmit();
        _startTimer();
      });
    } catch (e) {
      state = SignInState.error(e.toString());
    }
  }

  Future<void> verifyCode(String smsCode) async {
    state = const SignInState.loading();
    try {
      await authService.verifyCode(smsCode, () {
        state = const SignInState.success();
      });
    } catch (e) {
    }
  }
}