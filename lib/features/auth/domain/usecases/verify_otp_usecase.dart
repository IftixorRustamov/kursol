import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<bool> call(String otp) async {
    return await repository.verifyOtp(otp);
  }
}
