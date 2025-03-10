import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordViaPhoneUseCase {
  final AuthRepository repository;

  ResetPasswordViaPhoneUseCase(this.repository);

  Future<bool> call(String phone) async {
    return await repository.sendOtpForPasswordReset(phone, true);
  }
}
