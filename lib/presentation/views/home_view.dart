import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_auth/global_providers.dart';
import 'package:flutter_phone_auth/presentation/widgets/buttons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final phoneNumberProvider = Provider.autoDispose<String>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.formattedPhoneNumber;
});

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumber = ref.watch(phoneNumberProvider);
    return DoubleBackToCloseApp(
        snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Firebase Phone Auth",
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 80),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "You have successfully signed in with phone number",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                phoneNumber,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                    title: "Sign out",
                    onPressed: () {
                      final authService = ref.read(authServiceProvider);
                      authService.signOut();
                    }),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}