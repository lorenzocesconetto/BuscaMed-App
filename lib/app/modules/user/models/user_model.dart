import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.uuid,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.address,
  });

  String uuid;
  String name;
  String phone;
  String email;
  String password;
  String address;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "address": address,
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
