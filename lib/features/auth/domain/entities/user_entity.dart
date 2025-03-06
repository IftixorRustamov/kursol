class UserEntity {
  final String id;
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
}
