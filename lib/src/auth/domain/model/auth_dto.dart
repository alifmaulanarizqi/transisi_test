class AuthDto {
  final int id;
  final String token;

  const AuthDto({
    this.id = 0,
    this.token = '',
  });

  @override
  String toString() {
    return 'AuthDto{id: $id, name: $token}';
  }
}
