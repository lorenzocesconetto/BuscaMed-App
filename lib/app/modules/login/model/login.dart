class LoginModel {
  final String email;
  final String password;

  LoginModel({this.email, this.password});

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "password": password == null ? null : password,
      };
}
