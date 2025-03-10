import 'package:kursol/core/utils/secure_storage.dart';

class CheckAuthStatusUseCase {
  Future<bool> call() async {
    final accessToken = await SecureStorage.getAccessToken();
    return accessToken != null;
  }
}
