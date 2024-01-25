class SuccessConfirmMessageModel{
  String? message;
  SuccessConfirmMessageModel({required this.message});

  SuccessConfirmMessageModel.fromJson(Map<String, dynamic> json){
    message = json["message"];
  }
}