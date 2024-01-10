import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_auth/app_route.dart';
import 'package:flutter_phone_auth/firebase_options.dart';
import 'package:flutter_phone_auth/global_providers.dart';
import 'package:flutter_phone_auth/presentation/views/home_view.dart';
import 'package:flutter_phone_auth/presentation/views/landing_view.dart';
import 'package:flutter_phone_auth/presentation/widgets/error_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings)=> AppRouter.onGenerateRoute(settings),
      initialRoute: AppRoutes.startupView,
    );
  }
}

class StartupPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);
    return authStateChanges.when(
      data: (user) {
        if (user != null) {
          return const HomeView();
        } else {
          return const SignInLandingView();
        }
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, _) => ErrorPage(message: error.toString()),
    );
  }
}