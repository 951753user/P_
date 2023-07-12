// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    String? status;
    Data? data;

    RegisterModel({
        this.status,
        this.data,
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    int? dataId;
    String? pancardNumber;
    String? mobileNumber;
    String? password;
    String? id;
    int? v;

    Data({
        this.dataId,
        this.pancardNumber,
        this.mobileNumber,
        this.password,
        this.id,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataId: json["id"],
        pancardNumber: json["PancardNumber"],
        mobileNumber: json["MobileNumber"],
        password: json["Password"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "id": dataId,
        "PancardNumber": pancardNumber,
        "MobileNumber": mobileNumber,
        "Password": password,
        "_id": id,
        "__v": v,
    };
}
