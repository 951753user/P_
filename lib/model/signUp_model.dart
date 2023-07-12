// To parse this JSON data, do
//
//     final signUpDetailsModel = signUpDetailsModelFromJson(jsonString);

import 'dart:convert';

SignUpDetailsModel signUpDetailsModelFromJson(String str) => SignUpDetailsModel.fromJson(json.decode(str));

String signUpDetailsModelToJson(SignUpDetailsModel data) => json.encode(data.toJson());

class SignUpDetailsModel {
    String? status;
    Data? data;

    SignUpDetailsModel({
        this.status,
        this.data,
    });

    factory SignUpDetailsModel.fromJson(Map<String, dynamic> json) => SignUpDetailsModel(
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
    String? id;
    int? v;

    Data({
        this.dataId,
        this.pancardNumber,
        this.id,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataId: json["id"],
        pancardNumber: json["PancardNumber"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "id": dataId,
        "PancardNumber": pancardNumber,
        "_id": id,
        "__v": v,
    };
}
