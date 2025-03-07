class UserEntity {
  final String id;
  final String uuid;
  final String email;
  final String? phoneNumber;
  final String firstName;
  final String lastName;
  final String username;
  final List<String> roles;
  final bool skillOccupation;
  final String? biography;
  final DateTime registrationDate;
  final bool isActivated;

  const UserEntity({
    required this.id,
    required this.uuid,
    required this.email,
    this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.roles,
    required this.skillOccupation,
    this.biography,
    required this.registrationDate,
    required this.isActivated,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json["uuid"],
      uuid: json["uuid"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      username: json["username"],
      roles: List<String>.from(json["roles"]),
      skillOccupation: json["skillOccupation"],
      biography: json["biography"],
      registrationDate: DateTime.parse(json["registrationDate"]),
      isActivated: true,
    );
  }
}
