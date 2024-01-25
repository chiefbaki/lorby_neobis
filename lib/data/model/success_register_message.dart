class SuccessRegisterMessageModel{
  String? message;
  SuccessRegisterMessageModel({required this.message});

  SuccessRegisterMessageModel.fromJson(Map<String, dynamic> json){
    message = json["message"];
  }
}