import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kursol/features/auth/domain/entities/api_response_entity.dart';
import 'package:kursol/features/auth/domain/entities/user_entity.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';
import 'package:kursol/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:kursol/core/network/dio_client.dart';

// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(DioClient());
});

// State notifier for sign-up
class SignUpNotifier extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository;

  SignUpNotifier(this._authRepository) : super(const AsyncValue.data(null));

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String emailOrPhone,
    required String password,
    required bool useEmail,
  }) async {
    state = const AsyncValue.loading();

    final response = useEmail
        ? await _authRepository.registerWithEmail(emailOrPhone, password, firstName, lastName)
        : await _authRepository.registerWithPhone(emailOrPhone, password, firstName, lastName);

    if (response.success) {
      state = const AsyncValue.data(null);
    } else {
      state = AsyncValue.error(response.error?.message ?? "Something went wrong", StackTrace.current);
    }
  }
}

// State notifier provider
final signUpProvider = StateNotifierProvider<SignUpNotifier, AsyncValue<void>>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return SignUpNotifier(authRepo);
});


// State notifier for sign-in
class SignInNotifier extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository;

  SignInNotifier(this._authRepository) : super(const AsyncValue.data(null));

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final response = await _authRepository.login(email, password);

    if (response.success) {
      state = const AsyncValue.data(null);
    } else {
      state = AsyncValue.error(response.error?.message ?? "Something went wrong", StackTrace.current);
    }
  }
}

// State notifier provider
final signInProvider = StateNotifierProvider<SignInNotifier, AsyncValue<void>>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return SignInNotifier(authRepo);
});