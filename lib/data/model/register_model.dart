class RegisterModel {
  String? email;
  String? username;
  String? password;
  String? passwordConfirm;

  RegisterModel(
      {required this.email,
      required this.username,
      required this.password,
      required this.passwordConfirm});


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json["email"] = email;
    json["username"] = username;
    json["password"] = password;
    json["password_confirm"] = passwordConfirm;
    return json;
  }
}
