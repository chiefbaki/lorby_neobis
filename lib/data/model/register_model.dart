class RegisterModel{
  final String? email;
  final String? username;
  final String? password;
  final String? passwordConfirm;
  
  RegisterModel.toJson(this.email, this.username, this.password, this.passwordConfirm){
    Map<String, dynamic> json = {};
    json["email"] = email;
    json["username"] = username;
    json["password"] = password;
    json["passwordConfirm"] = passwordConfirm;
  }
}