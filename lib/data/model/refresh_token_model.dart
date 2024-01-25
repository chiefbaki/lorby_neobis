class RefreshTokenModel{
 String? tokenRefresh;
  RefreshTokenModel({required this.tokenRefresh});

  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = <String, dynamic>{};
    json["refresh"] = tokenRefresh;
    return json;
  }
}