// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

class OrdersModel {
  OrdersModel({
    this.id,
    this.serial,
    this.date,
    this.waitingTimePacking,
    this.waitingTimeDelivery,
    this.endDatePacking,
    this.endDateDelivery,
    this.deliveryBy,
    this.deliveryDate,
    this.packingBy,
    this.packingDate,
    this.status,
    this.detailDataAPiDtoList,
  });

  int? id;
  int ?serial;
  DateTime? date;
  int ?waitingTimePacking;
  int ?waitingTimeDelivery;
  DateTime? endDatePacking;
  DateTime? endDateDelivery;
  String?deliveryBy;
  DateTime?deliveryDate;
  String?packingBy;
  DateTime?packingDate;
  dynamic? status;
  List<DetailDataAPiDtoList>? detailDataAPiDtoList;

  factory OrdersModel.fromRawJson(String str) => OrdersModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    id: json["id"] == null ? null : json["id"],
    serial: json["serial"] == null ? null : json["serial"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    waitingTimeDelivery: json["waitingTimeDelivery"] == null ? null : json["waitingTimeDelivery"],
    endDateDelivery: json["endDateDelivery"] == null ? null : DateTime.parse(json["endDateDelivery"]),
    waitingTimePacking: json["waitingTimePacking"] == null ? null : json["waitingTimePacking"],
    endDatePacking: json["endDatePacking"] == null ? null : DateTime.parse(json["endDatePacking"]),
    deliveryBy: json["deliveryBy"] == null ? null : json["deliveryBy"],
    deliveryDate: json["deliveryDate"] == null ? null : DateTime.parse(json["deliveryDate"]),
    packingBy: json["packingBy"] == null ? null : json["packingBy"],
    packingDate: json["packingDate"] == null ? null : DateTime.parse(json["packingDate"]),
    status: json["status"],
    detailDataAPiDtoList: json["detailDataAPiDTOList"] == null ? null : List<DetailDataAPiDtoList>.from(json["detailDataAPiDTOList"].map((x) => DetailDataAPiDtoList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "serial": serial == null ? null : serial,
    "date": date == null ? null : date,
    "waitingTimeDelivery": waitingTimeDelivery == null ? null : waitingTimeDelivery,
    "endDateDelivery": endDateDelivery == null ? null : endDateDelivery,
    "waitingTimePacking": waitingTimePacking == null ? null : waitingTimePacking,
    "endDatePacking": endDatePacking == null ? null : endDatePacking,
    "deliveryBy": deliveryBy == null ? null : deliveryBy,
    "deliveryDate": deliveryDate == null ? null : deliveryDate!.toIso8601String(),
    "packingBy": packingBy == null ? null : packingBy,
    "packingDate": packingDate == null ? null : packingDate!.toIso8601String(),
    "status": status,
    "detailDataAPiDTOList": detailDataAPiDtoList == null ? null : List<dynamic>.from(detailDataAPiDtoList!.map((x) => x.toJson())),
  };
}

class DetailDataAPiDtoList {
  DetailDataAPiDtoList({
    this.quantity,
    this.addtionsDtoList,
    this.itemName,
  });

  num ?quantity;
  List<AddtionsDtoList>? addtionsDtoList;
  String? itemName;

  factory DetailDataAPiDtoList.fromRawJson(String str) => DetailDataAPiDtoList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailDataAPiDtoList.fromJson(Map<String, dynamic> json) => DetailDataAPiDtoList(
    quantity: json["quantity"] == null ? null : json["quantity"],
    addtionsDtoList: json["addtionsDTOList"] == null ? null : List<AddtionsDtoList>.from(json["addtionsDTOList"].map((x) => AddtionsDtoList.fromJson(x))),
    itemName: json["itemName"] == null ? null : json["itemName"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity == null ? null : quantity,
    "addtionsDTOList": addtionsDtoList == null ? null : List<dynamic>.from(addtionsDtoList!.map((x) => x.toJson())),
    "itemName": itemName == null ? null : itemName,
  };
}

class AddtionsDtoList {
  AddtionsDtoList({
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
    this.name,
    this.price,
    this.serial,
    this.appId,
    this.appName,
    this.itemId,
    this.hallId,
    this.discount,
    this.discountType,
    this.priceOriginal,
    this.additionsGroupId,
    this.additionsGroupName,
    this.mainAdditionId,
  });

  int ?id;
  bool ?markEdit;
  dynamic? msg;
  dynamic ?msgType;
  dynamic ?markDisable;
  int ?createdBy;
  String? createdDate;
  int ?index;
  dynamic companyId;
  dynamic createdByName;
  dynamic branchId;
  dynamic deletedBy;
  dynamic deletedDate;
  dynamic igmaOwnerId;
  dynamic companyCode;
  dynamic branchSerial;
  dynamic igmaOwnerSerial;
  dynamic userCode;
  String? name;
  num ?price;
  int ?serial;
  int ?appId;
  String? appName;
  int ?itemId;
  dynamic hallId;
  dynamic discount;
  dynamic discountType;
  dynamic priceOriginal;
  dynamic additionsGroupId;
  dynamic additionsGroupName;
  int ?mainAdditionId;

  factory AddtionsDtoList.fromRawJson(String str) => AddtionsDtoList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddtionsDtoList.fromJson(Map<String, dynamic> json) => AddtionsDtoList(
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
    branchId: json["branchId"],
    deletedBy: json["deletedBy"],
    deletedDate: json["deletedDate"],
    igmaOwnerId: json["igmaOwnerId"],
    companyCode: json["companyCode"],
    branchSerial: json["branchSerial"],
    igmaOwnerSerial: json["igmaOwnerSerial"],
    userCode: json["userCode"],
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"],
    serial: json["serial"] == null ? null : json["serial"],
    appId: json["appId"] == null ? null : json["appId"],
    appName: json["appName"] == null ? null : json["appName"],
    itemId: json["itemId"] == null ? null : json["itemId"],
    hallId: json["hallId"],
    discount: json["discount"],
    discountType: json["discountType"],
    priceOriginal: json["priceOriginal"],
    additionsGroupId: json["additionsGroupId"],
    additionsGroupName: json["additionsGroupName"],
    mainAdditionId: json["mainAdditionId"] == null ? null : json["mainAdditionId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "markEdit": markEdit == null ? null : markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate == null ? null : createdDate,
    "index": index == null ? null : index,
    "companyId": companyId,
    "createdByName": createdByName,
    "branchId": branchId,
    "deletedBy": deletedBy,
    "deletedDate": deletedDate,
    "igmaOwnerId": igmaOwnerId,
    "companyCode": companyCode,
    "branchSerial": branchSerial,
    "igmaOwnerSerial": igmaOwnerSerial,
    "userCode": userCode,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "serial": serial == null ? null : serial,
    "appId": appId == null ? null : appId,
    "appName": appName == null ? null : appName,
    "itemId": itemId == null ? null : itemId,
    "hallId": hallId,
    "discount": discount,
    "discountType": discountType,
    "priceOriginal": priceOriginal,
    "additionsGroupId": additionsGroupId,
    "additionsGroupName": additionsGroupName,
    "mainAdditionId": mainAdditionId == null ? null : mainAdditionId,
  };
}
