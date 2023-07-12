// To parse this JSON data, do
//
//     final userBankDetailsModel = userBankDetailsModelFromJson(jsonString);

import 'dart:convert';

UserBankDetailsModel userBankDetailsModelFromJson(String str) => UserBankDetailsModel.fromJson(json.decode(str));

String userBankDetailsModelToJson(UserBankDetailsModel data) => json.encode(data.toJson());

class UserBankDetailsModel {
    String? status;
    List<Datum>? data;

    UserBankDetailsModel({
        this.status,
        this.data,
    });

    factory UserBankDetailsModel.fromJson(Map<String, dynamic> json) => UserBankDetailsModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    int? datumId;
    String? pancardNumber;
    String? bankName;
    String? address;
    String? acNumber;
    String? acType;
    String? ifscNumber;
    int? v;

    Datum({
        this.id,
        this.datumId,
        this.pancardNumber,
        this.bankName,
        this.address,
        this.acNumber,
        this.acType,
        this.ifscNumber,
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        datumId: json["id"],
        pancardNumber: json["PancardNumber"],
        bankName: json["bankName"],
        address: json["address"],
        acNumber: json["acNumber"],
        acType: json["acType"],
        ifscNumber: json["ifscNumber"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "id": datumId,
        "PancardNumber": pancardNumber,
        "bankName": bankName,
        "address": address,
        "acNumber": acNumber,
        "acType": acType,
        "ifscNumber": ifscNumber,
        "__v": v,
    };
}
