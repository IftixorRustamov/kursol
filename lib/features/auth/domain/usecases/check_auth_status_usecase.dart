import 'package:kursol/features/auth/domain/entities/user_entity.dart';

import '../repositories/auth_repository.dart';

class CheckAuthStatusUseCase {
  final AuthRepository _authRepository;

  CheckAuthStatusUseCase(this._authRepository);

  bool call() {
    return _authRepository.isUserLoggedIn();
  }

  UserEntity? getCurrentUser() {
    return _authRepository.getCurrentUser();
  }
}
