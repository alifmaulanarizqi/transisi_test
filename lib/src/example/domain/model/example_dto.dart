class ExampleDto {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const ExampleDto({
    this.id = 0,
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.avatar = '',
  });

  @override
  String toString() {
    return 'ExampleDto{id;: $id, email: $email, firstName: $firstName}';
  }
}