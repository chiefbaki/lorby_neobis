class LoginModel {
  String? username;
  String? password;
  LoginModel({required this.username, required this.password});

  Map<String, String> toJson() {
    Map<String, String> json = <String, String>{};
    json["username"] = username ?? "error model";
    json["password"] = password ?? "error model";
    return json;
  }
}
