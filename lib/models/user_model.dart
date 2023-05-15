

class UserModel {
  UserModel({
    this.id,
    this.markEdit,
    this.msg,
    this.msgType,
    this.markDisable,
    this.createdBy,
    this.createdDate,
    this.index,
    this.companyId,
    this.createdByName,
    this.branchId,
    this.deletedBy,
    this.deletedDate,
    this.igmaOwnerId,
    this.companyCode,
    this.branchSerial,
    this.igmaOwnerSerial,
    this.userCode,
    this.password,
    this.name,
    this.lang,
    this.master,
    this.token,
    this.active,
    this.inventoryId ,
    this.bankId,
    this.userScreens
  });

  int? id;
  bool? markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  int? createdBy;
  String? createdDate;
  int? index;
  dynamic companyId;
  dynamic createdByName;
  int? branchId;
  dynamic deletedBy;
  dynamic deletedDate;
  dynamic igmaOwnerId;
  dynamic companyCode;
  dynamic branchSerial;
  dynamic igmaOwnerSerial;
  String? userCode;
  String? password;
  String? name;
  dynamic lang;
  dynamic master;
  dynamic token;
  dynamic active;
  int? inventoryId ;
  int? bankId;


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] == null ? null : json["id"],
      markEdit: json["markEdit"] == null ? null : json["markEdit"],
      msg: json["msg"],
      msgType: json["msgType"],
      markDisable: json["markDisable"],
      createdBy: json["createdBy"] == null ? null : json["createdBy"],
      createdDate: json["createdDate"] == null ? null : json["createdDate"],
      index: json["index"] == null ? null : json["index"],
      companyId: json["companyId"],
      createdByName: json["createdByName"],
      branchId: json["branchId"] == null ? null : json["branchId"],
      inventoryId: json["inventoryId"] == null ? null : json["inventoryId"],
      bankId: json["bankId"] == null ? null : json["bankId"],
      deletedBy: json["deletedBy"],
      deletedDate: json["deletedDate"],
      igmaOwnerId: json["igmaOwnerId"],
      companyCode: json["companyCode"],
      branchSerial: json["branchSerial"],
      igmaOwnerSerial: json["igmaOwnerSerial"],
      userCode: json["userCode"] == null ? null : json["userCode"],
      password: json["password"] == null ? null : json["password"],
      name: json["name"] == null ? null : json["name"],
      lang: json["lang"],
      master: json["master"],
      token: json["token"],
      active: json["active"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id == null ?  null : id,
    "markEdit": markEdit == null ? null : markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate == null ? null : createdDate,
    "index": index == null ? null : index,
    "companyId": companyId,
    "createdByName": createdByName,
    "branchId": branchId == null ? null : branchId,
    "inventoryId": inventoryId == null ? null : inventoryId,
    "bankId": bankId == null ? null : bankId,
    "deletedBy": deletedBy,
    "deletedDate": deletedDate,
    "igmaOwnerId": igmaOwnerId,
    "companyCode": companyCode,
    "branchSerial": branchSerial,
    "igmaOwnerSerial": igmaOwnerSerial,
    "userCode": userCode == null ? null : userCode,
    "password": password == null ? null : password,
    "name": name == null ? null : name,
    "lang": lang,
    "master": master,
    "token": token,
    "active": active,
  };
}