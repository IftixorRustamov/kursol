import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordViaEmailUseCase {
  final AuthRepository repository;

  ResetPasswordViaEmailUseCase(this.repository);

  Future<bool> call(String email) async {
    return await repository.sendOtpForPasswordReset(email, false);
  }
}
