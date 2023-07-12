// To parse this JSON data, do
//
//     final bankDetailsModel = bankDetailsModelFromJson(jsonString);

import 'dart:convert';

BankDetailsModel bankDetailsModelFromJson(String str) => BankDetailsModel.fromJson(json.decode(str));

String bankDetailsModelToJson(BankDetailsModel data) => json.encode(data.toJson());

class BankDetailsModel {
    String? status;
    List<BankData>? data;

    BankDetailsModel({
        this.status,
        this.data,
    });

    factory BankDetailsModel.fromJson(Map<String, dynamic> json) => BankDetailsModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<BankData>.from(json["data"]!.map((x) => BankData.fromJson(x))),
        
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data":  data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),  
    };
}

class BankData {
    int? dataId;
    String? pancardNumber;
    String? bankName;
    String? address;
    String? acNumber;
    String? acType;
    String? ifscNumber;
    String? id;
    int? v;

    BankData({
        this.dataId,
        this.pancardNumber,
        this.bankName,
        this.address,
        this.acNumber,
        this.acType,
        this.ifscNumber,
        this.id,
        this.v,
    });

    factory BankData.fromJson(Map<String, dynamic> json) => BankData(
        dataId: json["id"],
        pancardNumber: json["PancardNumber"],
        bankName: json["bankName"],
        address: json["address"],
        acNumber: json["acNumber"],
        acType: json["acType"],
        ifscNumber: json["ifscNumber"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "id": dataId,
        "PancardNumber": pancardNumber,
        "bankName": bankName,
        "address": address,
        "acNumber": acNumber,
        "acType": acType,
        "ifscNumber": ifscNumber,
        "_id": id,
        "__v": v,
    };
}
