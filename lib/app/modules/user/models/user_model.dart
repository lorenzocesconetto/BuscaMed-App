import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.municipio,
    this.uf,
  });

  String email;
  String name;
  String cep;
  String phone;
  String password;
  String logradouro;
  String complemento;
  String bairro;
  String municipio;
  String uf;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        cep: json["cep"].toString(),
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        municipio: json["municipio"],
        uf: json["uf"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "municipio": municipio,
        "uf": uf,
      };

  Map<String, dynamic> editToJson() => {
        "name": name,
        "phone": phone,
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "municipio": municipio,
        "uf": uf,
      };
}
