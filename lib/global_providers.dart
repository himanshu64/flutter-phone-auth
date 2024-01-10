import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_phone_auth/services/auth_service.dart';
import 'package:flutter_phone_auth/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final authStateProvider = StateNotifierProvider<AuthService, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService;
});

final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(authServiceProvider).authStateChanges());