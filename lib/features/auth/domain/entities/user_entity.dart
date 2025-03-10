class User {
  final String uuid;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final List<String> roles;
  final String? accessToken;

  User({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.roles,
    this.accessToken, // Optional
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json["uuid"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      username: json["username"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      roles: List<String>.from(json["roles"] ?? []),
      accessToken: json["accessToken"],
    );
  }
}
