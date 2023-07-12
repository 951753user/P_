// To parse this JSON data, do
//
//     final userAllDetailsModel = userAllDetailsModelFromJson(jsonString);

import 'dart:convert';

UserAllDetailsModel userAllDetailsModelFromJson(String str) => UserAllDetailsModel.fromJson(json.decode(str));

String userAllDetailsModelToJson(UserAllDetailsModel data) => json.encode(data.toJson());

class UserAllDetailsModel {
    String? status;
    List<Datum>? data;

    UserAllDetailsModel({
        this.status,
        this.data,
    });

    factory UserAllDetailsModel.fromJson(Map<String, dynamic> json) => UserAllDetailsModel(
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
    int? v;
    String? firstName;
    String? gender;
    String? lastName;
    String? middleName;
    String? mobileNumber;
    String? password;
    String? aadhaarNumber;
    String? address;
    String? dataOfBirth;
    String? fatherName;
    String? martial;
    String? pancard;
    String? residential;
    String? acNumber;
    String? acType;
    String? datumAddress;
    String? bankName;
    String? ifscNumber;

    Datum({
        this.id,
        this.datumId,
        this.pancardNumber,
        this.v,
        this.firstName,
        this.gender,
        this.lastName,
        this.middleName,
        this.mobileNumber,
        this.password,
        this.aadhaarNumber,
        this.address,
        this.dataOfBirth,
        this.fatherName,
        this.martial,
        this.pancard,
        this.residential,
        this.acNumber,
        this.acType,
        this.datumAddress,
        this.bankName,
        this.ifscNumber,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        datumId: json["id"],
        pancardNumber: json["PancardNumber"],
        v: json["__v"],
        firstName: json["FirstName"],
        gender: json["Gender"],
        lastName: json["LastName"],
        middleName: json["MiddleName"],
        mobileNumber: json["MobileNumber"],
        password: json["Password"],
        aadhaarNumber: json["AadhaarNumber"],
        address: json["Address"],
        dataOfBirth: json["DataOfBirth"],
        fatherName: json["FatherName"],
        martial: json["Martial"],
        pancard: json["Pancard"],
        residential: json["Residential"],
        acNumber: json["acNumber"],
        acType: json["acType"],
        datumAddress: json["address"],
        bankName: json["bankName"],
        ifscNumber: json["ifscNumber"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "id": datumId,
        "PancardNumber": pancardNumber,
        "__v": v,
        "FirstName": firstName,
        "Gender": gender,
        "LastName": lastName,
        "MiddleName": middleName,
        "MobileNumber": mobileNumber,
        "Password": password,
        "AadhaarNumber": aadhaarNumber,
        "Address": address,
        "DataOfBirth": dataOfBirth,
        "FatherName": fatherName,
        "Martial": martial,
        "Pancard": pancard,
        "Residential": residential,
        "acNumber": acNumber,
        "acType": acType,
        "address": datumAddress,
        "bankName": bankName,
        "ifscNumber": ifscNumber,
    };
}
