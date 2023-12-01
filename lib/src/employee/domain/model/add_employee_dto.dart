class AddEmployeeDto {
  final String name;
  final String job;
  final String id;
  final String createdAt;

  const AddEmployeeDto({
    this.name = '',
    this.job = '',
    this.id = '',
    this.createdAt = '',
  });

  @override
  String toString() {
    return 'AddEmployeeDto{id: $id, name: $name}';
  }
}