// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        required this.status,
        required this.message,
        required this.userId,
        required this.organizationId,
        required this.profileId,
        required this.errorcode,
        required this.isPrimary,
        required this.createdDateDiff,
        required this.authorization,
    });

    String status;
    String message;
    int userId;
    int organizationId;
    int profileId;
    int errorcode;
    String isPrimary;
    int createdDateDiff;
    String authorization;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        message: json["message"],
        userId: json["user_id"],
        organizationId: json["OrganizationID"],
        profileId: json["ProfileID"],
        errorcode: json["Errorcode"],
        isPrimary: json["IsPrimary"],
        createdDateDiff: json["created_date_diff"],
        authorization: json["Authorization"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user_id": userId,
        "OrganizationID": organizationId,
        "ProfileID": profileId,
        "Errorcode": errorcode,
        "IsPrimary": isPrimary,
        "created_date_diff": createdDateDiff,
        "Authorization": authorization,
    };
}
