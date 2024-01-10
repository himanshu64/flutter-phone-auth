import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_auth/app_route.dart';
import 'package:flutter_phone_auth/presentation/widgets/buttons.dart';

class SignInLandingView extends StatelessWidget {
  const SignInLandingView({super.key});

  Future<void> _openSignup(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      AppRoutes.signInPhoneView,
      arguments: () => navigator.pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Firebase Phone Auth",
        ),
        automaticallyImplyLeading: false,
      ),
      
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              const Center(child: FlutterLogo(size: 120)),
              const SizedBox(height: 30),
              Text(
                "Welcome to this demo app using Firebase Phone Authentication ",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  title: "Sign in",
                  onPressed: () => _openSignup(context),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}