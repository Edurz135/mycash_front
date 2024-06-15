import 'dart:convert';

/*
  id
  name
  lastname
  email
  password
  creationDate
  modifiedDate
  active
  */

User usuarioFromJson(String str) => User.fromJson(json.decode(str));
String usuarioToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  String lastname;
  String email;
  String password;
  DateTime creationDate;
  DateTime modifiedDate;
  bool active;

  User.empty()
      : id = 0,
        name = '',
        lastname = '',
        email = '',
        password = '',
        creationDate = DateTime.now(),
        modifiedDate = DateTime.now(),
        active = true;

  User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.password,
    required this.creationDate,
    required this.modifiedDate,
    required this.active,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
        creationDate: json["creationDate"],
        modifiedDate: json["modifiedDate"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "password": password,
        "creationDate": creationDate,
        "modifiedDate": modifiedDate,
        "active": active,
      };

  @override
  String toString() {
    // TODO: implement toString
    return 'Usuario -> id: ${this.id}, name: ${this.name}, lastname: ${this.lastname}, email: ${this.email}, password: ${this.password}, creationDate: ${this.creationDate}, modifiedDate: ${this.modifiedDate}, active: ${this.active} ';
  }
}