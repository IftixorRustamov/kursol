class TokenEntity {
  final String accessToken;
  final String refreshToken;
  final DateTime? accessTokenExpiry;
  final DateTime? refreshTokenExpiry;

  const TokenEntity({
    required this.accessToken,
    required this.refreshToken,
    this.accessTokenExpiry,
    this.refreshTokenExpiry,
  });
}
