import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';
import 'package:kursol/features/auth/data/repositories/auth_repository_impl.dart';

import '../../../../core/utils/logger/app_logger.dart';
import '../../data/datasources/auth_remote_data_source.dart';


final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dioClient = Dio(); //
  final remoteDataSource = AuthRemoteDataSourceImpl(dioClient);
  return AuthRepositoryImpl(remoteDataSource);
});

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<bool>>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});

class AuthNotifier extends StateNotifier<AsyncValue<bool>> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(const AsyncValue.data(false));

  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.login(username, password);

      if (user != null) {
        logger.i("✅ Foydalanuvchi tizimga kirdi: ${user.username}");
        state = const AsyncValue.data(true);
      } else {
        logger.w("⚠️ Login muvaffaqiyatsiz bo'ldi!");
        state = AsyncValue.error("Login failed: User ma'lumotlari noto‘g‘ri", StackTrace.current);
      }
    } catch (e, stacktrace) {
      logger.e("🔥 AuthProvider Login xatosi: $e", error: e, stackTrace: stacktrace);
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }



  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.logout();
      state = const AsyncValue.data(false);
    } catch (e) {
      state = AsyncValue.error("Logout failed", StackTrace.current);
    }
  }
}

final registerProvider =
    StateNotifierProvider<RegisterNotifier, AsyncValue<bool>>((ref) {
  return RegisterNotifier(ref.watch(authRepositoryProvider));
});

class RegisterNotifier extends StateNotifier<AsyncValue<bool>> {
  final AuthRepository _authRepository;

  RegisterNotifier(this._authRepository) : super(const AsyncValue.data(false));

  Future<bool> register({
    required String firstName,
    required String lastName,
    required String emailOrPhone,
    required String password,
    required bool useEmail,
  }) async {
    state = const AsyncValue.loading();
    try {
      final success = await _authRepository.register(
        {
          "firstName": firstName,
          "lastName": lastName,
          useEmail ? "email" : "phoneNumber": emailOrPhone,
          "password": password
        },
        useEmail,
      );

      if (!success) {
        state = AsyncValue.error(
            "Registration failed. Try again.", StackTrace.current);
        return false;
      }

      state = const AsyncValue.data(true);
      return true;
    } catch (e) {
      if (e
          .toString()
          .contains("duplicate key value violates unique constraint")) {
        state = AsyncValue.error(
            "This phone number is already registered. Try logging in.",
            StackTrace.current);
      } else {
        state = AsyncValue.error(e.toString(), StackTrace.current);
      }
      return false;
    }
  }
}

final otpProvider = StateNotifierProvider<OtpNotifier, AsyncValue<bool>>((ref) {
  return OtpNotifier(ref.watch(authRepositoryProvider));
});

class OtpNotifier extends StateNotifier<AsyncValue<bool>> {
  final AuthRepository _authRepository;
  OtpNotifier(this._authRepository) : super(const AsyncValue.data(false));

  Future<bool> verifyOtp(String otp) async {
    print("Sending OTP: $otp");
    state = const AsyncValue.loading();
    try {
      final success = await _authRepository.verifyOtp(otp);
      if (success) {
        state = const AsyncValue.data(true);
      } else {
        state = AsyncValue.error("OTP verification failed", StackTrace.current);
      }
      return success;
    } catch (e) {
      print("Error verifying OTP: $e");
      state = AsyncValue.error(e.toString(), StackTrace.current);
      return false;
    }
  }
}


final resendOtpProvider =
    StateNotifierProvider<ResendOtpNotifier, AsyncValue<bool>>((ref) {
  return ResendOtpNotifier(ref.watch(authRepositoryProvider));
});

class ResendOtpNotifier extends StateNotifier<AsyncValue<bool>> {
  final AuthRepository _authRepository;

  ResendOtpNotifier(this._authRepository) : super(const AsyncValue.data(false));

  Future<bool> resendOtp(String identifier) async {
    state = const AsyncValue.loading();
    try {
      final success =
          await _authRepository.sendOtpForPasswordReset(identifier, false);
      state = AsyncValue.data(success);
      return success;
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
      return false;
    }
  }

  Future<void> processGoogleGrantCode(String code) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.processGoogleGrantCode(code);

      if (user != null) {
        logger.i("✅ Google orqali tizimga kirdi: ${user}");
        state = const AsyncValue.data(true);
      } else {
        logger.w("⚠️ Google Sign-in muvaffaqiyatsiz!");
        state = AsyncValue.error("Google Sign-in failed: User data is missing", StackTrace.current);
      }
    } catch (e, stacktrace) {
      logger.e("🔥 AuthProvider Google Sign-in xatosi: $e", error: e, stackTrace: stacktrace);
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

}
abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String username, String password);
  Future<bool> verifyOtp(String otp);
  Future<bool> register(Map<String, dynamic> data, bool useEmail);
  Future<bool> logout();
  Future<String?> refreshAccessToken(String refreshToken);
  Future<bool> resetPassword(Map<String, dynamic> data);
  Future<bool> sendOtpForPasswordReset(String identifier, bool isPhone);
  Future<bool> processGoogleGrantCode(String code);
}
