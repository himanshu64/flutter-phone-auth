import 'package:flutter/material.dart';
import 'package:flutter_phone_auth/main.dart';
import 'package:flutter_phone_auth/presentation/views/countries_view.dart';
import 'package:flutter_phone_auth/presentation/views/phone_view.dart';
import 'package:flutter_phone_auth/presentation/views/verification_view.dart';

class AppRoutes {
  static const startupView = '/startup-view';
  static const countriesView = '/countries-view';
  static const signInPhoneView = '/sign-in-phone-view';
  static const signInVerificationView = '/sign-in-verification-view';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.startupView:
        return MaterialPageRoute<dynamic>(
          builder: (_) => StartupPage(),
          settings: settings,
        );
      case AppRoutes.countriesView:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const CountriesView(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.signInPhoneView:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const  SignInPhoneViewBuilder(),
          settings: settings,
        );
      case AppRoutes.signInVerificationView:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignInVerificationViewBuilder(),
          settings: settings,
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Container(),
          settings: settings,
        );
    }
  }
}