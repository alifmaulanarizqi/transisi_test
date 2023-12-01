class EmployeeDto {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const EmployeeDto({
    this.id = 0,
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.avatar = '',
  });

  @override
  String toString() {
    return 'EmployeeDto{id;: $id, email: $email, firstName: $firstName}';
  }
}