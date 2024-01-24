class RefreshTokenModel{
  String? accessToken;
  RefreshTokenModel({required this.accessToken});

  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = <String, dynamic>{};
    json["refresh"] = accessToken;
    return json;
  }
}