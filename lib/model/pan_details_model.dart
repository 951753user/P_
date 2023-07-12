// To parse this JSON data, do
//
//     final panCardDetailsModel = panCardDetailsModelFromJson(jsonString);

import 'dart:convert';

PanCardDetailsModel panCardDetailsModelFromJson(String str) => PanCardDetailsModel.fromJson(json.decode(str));

String panCardDetailsModelToJson(PanCardDetailsModel data) => json.encode(data.toJson());

class PanCardDetailsModel {
    String? status;
    Data? data;

    PanCardDetailsModel({
        this.status,
        this.data,
    });

    factory PanCardDetailsModel.fromJson(Map<String, dynamic> json) => PanCardDetailsModel(
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
    String? firstName;
    String? middleName;
    String? lastName;
    String? gender;
    String? id;
    int? v;

    Data({
        this.dataId,
        this.pancardNumber,
        this.firstName,
        this.middleName,
        this.lastName,
        this.gender,
        this.id,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataId: json["id"],
        pancardNumber: json["PancardNumber"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        gender: json["Gender"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "id": dataId,
        "PancardNumber": pancardNumber,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "Gender": gender,
        "_id": id,
        "__v": v,
    };
}



// // To parse this JSON data, do
// //
// //     final panDetailsModel = panDetailsModelFromJson(jsonString);

// import 'dart:convert';

// PanDetailsModel panDetailsModelFromJson(String str) => PanDetailsModel.fromJson(json.decode(str));

// String panDetailsModelToJson(PanDetailsModel data) => json.encode(data.toJson());

// class PanDetailsModel {
//     String? status;
//     List<SignUp>? signUp;

//     PanDetailsModel({
//         this.status,
//         this.signUp,
//     });

//     factory PanDetailsModel.fromJson(Map<String, dynamic> json) => PanDetailsModel(
//         status: json["status"],
//         signUp: json["signUp"] == null ? [] : List<SignUp>.from(json["signUp"]!.map((x) => SignUp.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "signUp": signUp == null ? [] : List<dynamic>.from(signUp!.map((x) => x.toJson())),
//     };
// }

// class SignUp {
//     String? id;
//     int? signUpId;
//     String? pancardNumber;
//     int? v;
//     String? mobilenumber;
//     String? signUpPancardNumber;
//     String? firstName;
//     String? gender;
//     String? lastName;
//     String? middleName;
//     String? mobileNumber;
//     String? password;
//     String? aadhaarNumber;
//     String? address;
//     String? dataOfBirth;
//     String? fatherName;
//     String? martial;
//     String? pancard;
//     String? residential;
//     String? cardHolderName;
//     int? cardNumber;
//     int? cvvNumber;
//     String? expireDate;
//     String? acNumber;
//     String? acType;
//     String? signUpAddress;
//     String? bankName;
//     String? ifscNumber;
//     String? uploadDocument;

//     SignUp({
//         this.id,
//         this.signUpId,
//         this.pancardNumber,
//         this.v,
//         this.mobilenumber,
//         this.signUpPancardNumber,
//         this.firstName,
//         this.gender,
//         this.lastName,
//         this.middleName,
//         this.mobileNumber,
//         this.password,
//         this.aadhaarNumber,
//         this.address,
//         this.dataOfBirth,
//         this.fatherName,
//         this.martial,
//         this.pancard,
//         this.residential,
//         this.cardHolderName,
//         this.cardNumber,
//         this.cvvNumber,
//         this.expireDate,
//         this.acNumber,
//         this.acType,
//         this.signUpAddress,
//         this.bankName,
//         this.ifscNumber,
//         this.uploadDocument,
//     });

//     factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
//         id: json["_id"],
//         signUpId: json["id"],
//         pancardNumber: json["PancardNumber"],
//         v: json["__v"],
//         mobilenumber: json["mobilenumber"],
//         signUpPancardNumber: json["pancardNumber"],
//         firstName: json["FirstName"],
//         gender: json["Gender"],
//         lastName: json["LastName"],
//         middleName: json["MiddleName"],
//         mobileNumber: json["MobileNumber"],
//         password: json["Password"],
//         aadhaarNumber: json["AadhaarNumber"],
//         address: json["Address"],
//         dataOfBirth: json["DataOfBirth"],
//         fatherName: json["FatherName"],
//         martial: json["Martial"],
//         pancard: json["Pancard"],
//         residential: json["Residential"],
//         cardHolderName: json["cardHolderName"],
//         cardNumber: json["cardNumber"],
//         cvvNumber: json["cvvNumber"],
//         expireDate: json["expireDate"],
//         acNumber: json["acNumber"],
//         acType: json["acType"],
//         signUpAddress: json["address"],
//         bankName: json["bankName"],
//         ifscNumber: json["ifscNumber"],
//         uploadDocument: json["uploadDocument"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "id": signUpId,
//         "PancardNumber": pancardNumber,
//         "__v": v,
//         "mobilenumber": mobilenumber,
//         "pancardNumber": signUpPancardNumber,
//         "FirstName": firstName,
//         "Gender": gender,
//         "LastName": lastName,
//         "MiddleName": middleName,
//         "MobileNumber": mobileNumber,
//         "Password": password,
//         "AadhaarNumber": aadhaarNumber,
//         "Address": address,
//         "DataOfBirth": dataOfBirth,
//         "FatherName": fatherName,
//         "Martial": martial,
//         "Pancard": pancard,
//         "Residential": residential,
//         "cardHolderName": cardHolderName,
//         "cardNumber": cardNumber,
//         "cvvNumber": cvvNumber,
//         "expireDate": expireDate,
//         "acNumber": acNumber,
//         "acType": acType,
//         "address": signUpAddress,
//         "bankName": bankName,
//         "ifscNumber": ifscNumber,
//         "uploadDocument": uploadDocument,
//     };
// }



