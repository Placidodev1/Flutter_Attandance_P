
class User {
  String name;
  int age;

  User({required this.name, required this.age});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(name: json['name'], age: json['age']);
  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };
}
