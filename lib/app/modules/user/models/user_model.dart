// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.uuid,
    this.createAt,
    this.modifiedAt,
    this.deletedAt,
    this.active,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.password,
    this.document,
    this.address,
    this.description,
    this.favorites,
  });

  String uuid;
  DateTime createAt;
  DateTime modifiedAt;
  dynamic deletedAt;
  bool active;
  String firstName;
  String lastName;
  String email;
  String username;
  String password;
  String document;
  Address address;
  String description;
  List<dynamic> favorites;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uuid: json["uuid"],
        createAt: DateTime.parse(json["createAt"]),
        modifiedAt: DateTime.parse(json["modifiedAt"]),
        deletedAt: json["deletedAt"],
        active: json["active"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        document: json["document"],
        address: Address.fromJson(json["address"]),
        description: json["description"],
        favorites: json["favorites"] != null
            ? List<dynamic>.from(json["favorites"].map((x) => x))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "deletedAt": deletedAt,
        "active": active,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "username": username,
        "password": password,
        "document": document,
        "address": address.toJson(),
        "description": description,
        "favorites": favorites != null
            ? List<dynamic>.from(favorites.map((x) => x))
            : null,
      };
}

class Address {
  Address({
    this.uuid,
    this.createAt,
    this.modifiedAt,
    this.deletedAt,
    this.active,
    this.address,
    this.block,
    this.number,
    this.city,
    this.state,
    this.zipcode,
  });

  String uuid;
  DateTime createAt;
  DateTime modifiedAt;
  dynamic deletedAt;
  bool active;
  String address;
  dynamic block;
  dynamic number;
  String city;
  String state;
  dynamic zipcode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        uuid: json["uuid"],
        createAt: DateTime.parse(json["createAt"]),
        modifiedAt: DateTime.parse(json["modifiedAt"]),
        deletedAt: json["deletedAt"],
        active: json["active"],
        address: json["address"],
        block: json["block"],
        number: json["number"],
        city: json["city"],
        state: json["state"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "deletedAt": deletedAt,
        "active": active,
        "address": address,
        "block": block,
        "number": number,
        "city": city,
        "state": state,
        "zipcode": zipcode,
      };
}
