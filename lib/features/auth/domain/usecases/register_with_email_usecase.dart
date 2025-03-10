import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';

class RegisterWithEmailUseCase {
  final AuthRepository repository;

  RegisterWithEmailUseCase(this.repository);

  Future<bool> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    return await repository.register({
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
    }, true);
  }
}
