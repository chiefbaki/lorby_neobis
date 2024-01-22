class EmailConfirm{
  String code;
  EmailConfirm({required this.code});
  
  Map<String, String> toJson(){
    Map<String, String> json = <String, String>{};
    json["code"] = code;
    return json;
  }
}