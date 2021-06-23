class User {
  int id;
  String name;
  int age;

  User(this.id, this.name, this.age);

  @override
  String toString() {
    return 'User{id: $id, name: $name, age: $age}';
  }
}
