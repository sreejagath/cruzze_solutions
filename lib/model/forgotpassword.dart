// To parse this JSON data, do
//
//     final forgotPassword = forgotPasswordFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ForgotPassword forgotPasswordFromJson(String str) => ForgotPassword.fromJson(json.decode(str));

String forgotPasswordToJson(ForgotPassword data) => json.encode(data.toJson());

class ForgotPassword {
    ForgotPassword({
        required this.errorcode,
        required this.message,
    });

    int errorcode;
    String message;

    factory ForgotPassword.fromJson(Map<String, dynamic> json) => ForgotPassword(
        errorcode: json["Errorcode"],
        message: json["Message"],
    );

    Map<String, dynamic> toJson() => {
        "Errorcode": errorcode,
        "Message": message,
    };
}
