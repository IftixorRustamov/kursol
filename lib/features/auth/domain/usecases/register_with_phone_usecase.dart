import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';

class RegisterWithPhoneUseCase {
  final AuthRepository repository;

  RegisterWithPhoneUseCase(this.repository);

  Future<bool> call({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
  }) async {
    return await repository.register({
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "password": password,
    }, false);
  }
}
