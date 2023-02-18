// To parse this JSON data, do
//
//     final saveModel = saveModelFromJson(jsonString);

import 'dart:convert';

class SaveModel {
  SaveModel({
    this.msg,
    this.resposeId,
    this.status,
    this.dToId,
  });

  String ?msg;
  dynamic resposeId;
  int ?status;
  dynamic dToId;

  factory SaveModel.fromRawJson(String str) => SaveModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SaveModel.fromJson(Map<String, dynamic> json) => SaveModel(
    msg: json["msg"] == null ? null : json["msg"],
    resposeId: json["resposeId"],
    status: json["status"] == null ? null : json["status"],
    dToId: json["dTOId"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg == null ? null : msg,
    "resposeId": resposeId,
    "status": status == null ? null : status,
    "dTOId": dToId,
  };
}
