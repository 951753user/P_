// To parse this JSON data, do
//
//     final personalDetailsModel = personalDetailsModelFromJson(jsonString);

import 'dart:convert';

PersonalDetailsModel personalDetailsModelFromJson(String str) => PersonalDetailsModel.fromJson(json.decode(str));

String personalDetailsModelToJson(PersonalDetailsModel data) => json.encode(data.toJson());

class PersonalDetailsModel {
    String? status;
    Data? data;

    PersonalDetailsModel({
        this.status,
        this.data,
    });

    factory PersonalDetailsModel.fromJson(Map<String, dynamic> json) => PersonalDetailsModel(
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
    String? pancard;
    String? dataOfBirth;
    String? fatherName;
    String? address;
    String? gender;
    String? martial;
    String? aadhaarNumber;
    String? residential;
    String? id;
    int? v;

    Data({
        this.dataId,
        this.pancardNumber,
        this.pancard,
        this.dataOfBirth,
        this.fatherName,
        this.address,
        this.gender,
        this.martial,
        this.aadhaarNumber,
        this.residential,
        this.id,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataId: json["id"],
        pancardNumber: json["PancardNumber"],
        pancard: json["Pancard"],
        dataOfBirth: json["DataOfBirth"],
        fatherName: json["FatherName"],
        address: json["Address"],
        gender: json["Gender"],
        martial: json["Martial"],
        aadhaarNumber: json["AadhaarNumber"],
        residential: json["Residential"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "id": dataId,
        "PancardNumber": pancardNumber,
        "Pancard": pancard,
        "DataOfBirth": dataOfBirth,
        "FatherName": fatherName,
        "Address": address,
        "Gender": gender,
        "Martial": martial,
        "AadhaarNumber": aadhaarNumber,
        "Residential": residential,
        "_id": id,
        "__v": v,
    };
}
