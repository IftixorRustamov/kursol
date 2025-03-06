import 'package:kursol/features/auth/domain/entities/api_response_entity.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository _authRepository;

  LogoutUsecase(this._authRepository);

  Future<ApiResponse<void>> call() async => await _authRepository.logout();
}
