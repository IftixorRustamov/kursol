import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<bool> call(String otp, String newPassword, String confirmPassword) async {
    return await repository.resetPassword({
      "otp": otp,
      "newPassword": newPassword,
      "confirmPassword": confirmPassword
    });
  }
}
