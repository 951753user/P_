// To parse this JSON data, do
//
//     final paymentMethodModel = paymentMethodModelFromJson(jsonString);

import 'dart:convert';

PaymentMethodModel paymentMethodModelFromJson(String str) => PaymentMethodModel.fromJson(json.decode(str));

String paymentMethodModelToJson(PaymentMethodModel data) => json.encode(data.toJson());

class PaymentMethodModel {
    String? status;
    Data? data;

    PaymentMethodModel({
        this.status,
        this.data,
    });

    factory PaymentMethodModel.fromJson(Map<String, dynamic> json) => PaymentMethodModel(
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
    int? cardNumber;
    String? cardHolderName;
    String? expireDate;
    int? cvvNumber;
    String? id;
    int? v;

    Data({
        this.dataId,
        this.pancardNumber,
        this.cardNumber,
        this.cardHolderName,
        this.expireDate,
        this.cvvNumber,
        this.id,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataId: json["id"],
        pancardNumber: json["PancardNumber"],
        cardNumber: json["cardNumber"],
        cardHolderName: json["cardHolderName"],
        expireDate: json["expireDate"],
        cvvNumber: json["cvvNumber"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "id": dataId,
        "PancardNumber": pancardNumber,
        "cardNumber": cardNumber,
        "cardHolderName": cardHolderName,
        "expireDate": expireDate,
        "cvvNumber": cvvNumber,
        "_id": id,
        "__v": v,
    };
}
