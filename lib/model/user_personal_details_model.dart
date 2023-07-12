// To parse this JSON data, do
//
//     final userPersonalDetailsModel = userPersonalDetailsModelFromJson(jsonString);

import 'dart:convert';

UserPersonalDetailsModel userPersonalDetailsModelFromJson(String str) => UserPersonalDetailsModel.fromJson(json.decode(str));

String userPersonalDetailsModelToJson(UserPersonalDetailsModel data) => json.encode(data.toJson());

class UserPersonalDetailsModel {
    String? status;
    List<Datum>? data;

    UserPersonalDetailsModel({
        this.status,
        this.data,
    });

    factory UserPersonalDetailsModel.fromJson(Map<String, dynamic> json) => UserPersonalDetailsModel(
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
    String? pancard;
    String? dataOfBirth;
    String? fatherName;
    String? address;
    String? gender;
    String? martial;
    String? aadhaarNumber;
    String? residential;
    int? v;

    Datum({
        this.id,
        this.datumId,
        this.pancardNumber,
        this.pancard,
        this.dataOfBirth,
        this.fatherName,
        this.address,
        this.gender,
        this.martial,
        this.aadhaarNumber,
        this.residential,
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        datumId: json["id"],
        pancardNumber: json["PancardNumber"],
        pancard: json["Pancard"],
        dataOfBirth: json["DataOfBirth"],
        fatherName: json["FatherName"],
        address: json["Address"],
        gender: json["Gender"],
        martial: json["Martial"],
        aadhaarNumber: json["AadhaarNumber"],
        residential: json["Residential"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "id": datumId,
        "PancardNumber": pancardNumber,
        "Pancard": pancard,
        "DataOfBirth": dataOfBirth,
        "FatherName": fatherName,
        "Address": address,
        "Gender": gender,
        "Martial": martial,
        "AadhaarNumber": aadhaarNumber,
        "Residential": residential,
        "__v": v,
    };
}
