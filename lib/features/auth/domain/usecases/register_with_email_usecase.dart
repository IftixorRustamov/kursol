import 'package:kursol/features/auth/domain/entities/api_response_entity.dart';
import 'package:kursol/features/auth/domain/entities/user_entity.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';

class RegisterWithEmailUsecase {
  final AuthRepository _authRepository;

  RegisterWithEmailUsecase(this._authRepository);

  Future<ApiResponse<UserEntity>> call(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    if (email.isEmpty ||
        password.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty) {
      throw Exception("All fields must be non-empty");
    }
    return await _authRepository.registerWithEmail(
        email, password, firstName, lastName);
  }
}
