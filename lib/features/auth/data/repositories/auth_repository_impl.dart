import 'package:kursol/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';
import 'package:kursol/core/utils/secure_storage.dart';
import '../../../../core/utils/logger/app_logger.dart';
import '../../domain/entities/user_entity.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<User> login(String username, String password) async {
    try {
      final response = await _remoteDataSource.login(username, password);

      logger.i("📢 Server javobi: $response");

      final data = response["data"];
      if (data == null) {
        throw Exception("Login failed: 'data' bo'limi yo'q!");
      }

      if (!data.containsKey("accessToken") || !data.containsKey("user")) {
        throw Exception("Login failed: Kerakli ma'lumotlar yo'q!");
      }

      final userData = data["user"];

      final user = User(
        uuid: userData["uuid"] ?? "",
        firstName: userData["firstName"] ?? "",
        lastName: userData["lastName"] ?? "",
        username: userData["username"] ?? "",
        email: userData["email"] ?? "",
        phoneNumber: userData["phoneNumber"] ?? "",
        roles: List<String>.from(userData["roles"] ?? []),
      );

      await SecureStorage.saveAccessToken(data["accessToken"]);

      logger.i("✅ Login muvaffaqiyatli: ${user.username}");
      return user;
    } catch (e, stacktrace) {
      logger.e("🔥 Login xatosi: $e", error: e, stackTrace: stacktrace);
      throw Exception("Login failed: ${e.toString()}");
    }
  }



  @override
  Future<bool> register(Map<String, dynamic> data, bool useEmail) {
    return _remoteDataSource.register(data, useEmail);
  }

  @override
  Future<bool> verifyOtp(String otp) async {
    return await _remoteDataSource.verifyOtp(otp);
  }

  @override
  Future<bool> logout() async {
    final success = await _remoteDataSource.logout();
    if (success) {
      await SecureStorage.clearTokens();
    }
    return success;
  }

  @override
  Future<String?> refreshAccessToken(String refreshToken) {
    return _remoteDataSource.refreshAccessToken(refreshToken);
  }

  @override
  Future<bool> resetPassword(Map<String, dynamic> data) {
    return _remoteDataSource.resetPassword(data);
  }

  @override
  Future<bool> sendOtpForPasswordReset(String identifier, bool isPhone) {
    return _remoteDataSource.sendOtpForPasswordReset(identifier, isPhone);
  }

  @override
  Future<User> processGoogleGrantCode(String code) async {
    try {
      final response = await _remoteDataSource.processGoogleGrantCode(code);

      logger.i("📢 Google Login javobi: $response");

      // ✅ Serverdan kelgan ma'lumotni olish
      final data = response["data"];
      if (data == null) {
        throw Exception("Google Sign-in failed: 'data' bo'limi yo'q!");
      }

      // ✅ Token va foydalanuvchi ma'lumotlarini tekshirish
      if (!data.containsKey("accessToken") || !data.containsKey("user")) {
        throw Exception("Google Sign-in failed: Kerakli ma'lumotlar yetishmayapti!");
      }

      final userData = data["user"];

      final user = User(
        uuid: userData["uuid"] ?? "",
        firstName: userData["firstName"] ?? "",
        lastName: userData["lastName"] ?? "",
        username: userData["username"] ?? "",
        email: userData["email"] ?? "",
        phoneNumber: userData["phoneNumber"] ?? "",
        roles: List<String>.from(userData["roles"] ?? []),
      );

      // ✅ Tokenlarni saqlash
      await SecureStorage.saveAccessToken(data["accessToken"]);
      await SecureStorage.saveRefreshToken(data["refreshToken"]); // 🆕 Refresh token ham saqlanadi

      logger.i("✅ Google Sign-in muvaffaqiyatli: ${user.username}");
      return user;
    } catch (e, stacktrace) {
      logger.e("🔥 Google Sign-in xatosi: $e", error: e, stackTrace: stacktrace);
      throw Exception("Google Sign-in failed: ${e.toString()}");
    }
  }

}
