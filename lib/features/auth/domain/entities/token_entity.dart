class TokenEntity {
  final String accessToken;
  final String refreshToken;
  final DateTime accessTokenExpiry;
  final DateTime refreshTokenExpiry;

  const TokenEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiry,
    required this.refreshTokenExpiry,
  });

  factory TokenEntity.fromJson(Map<String, dynamic> json) {
    return TokenEntity(
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
      accessTokenExpiry: DateTime.parse(json["accessTokenExpiry"]),
      refreshTokenExpiry: DateTime.parse(json["refreshTokenExpiry"]), 
    );
  }
}
