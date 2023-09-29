import 'dart:convert';

class SignInResponseModel {
  String? message;
  User? user;
  String? accessToken;

  SignInResponseModel({
    this.message,
    this.user,
    this.accessToken,
  });

  factory SignInResponseModel.fromRawJson(String str) => SignInResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) => SignInResponseModel(
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user?.toJson(),
    "accessToken": accessToken,
  };
}

class User {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? dateOfBirth;
  String? password;
  List<dynamic>? kyc;
  String? ine;
  String? image;
  String? role;
  bool? emailVerified;
  bool? approved;
  String? isBanned;
  String? oneTimeCode;
  String? createdAt;
  String? updatedAt;
  int? v;

  User({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.address,
    this.dateOfBirth,
    this.password,
    this.kyc,
    this.ine,
    this.image,
    this.role,
    this.emailVerified,
    this.approved,
    this.isBanned,
    this.oneTimeCode,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    address: json["address"],
    dateOfBirth: json["dateOfBirth"],
    password: json["password"],
    kyc: json["KYC"] == null ? [] : List<dynamic>.from(json["KYC"]!.map((x) => x)),
    ine: json["ine"],
    image: json["image"],
    role: json["role"],
    emailVerified: json["emailVerified"],
    approved: json["approved"],
    isBanned: json["isBanned"],
    oneTimeCode: json["oneTimeCode"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullName": fullName,
    "email": email,
    "phoneNumber": phoneNumber,
    "gender": gender,
    "address": address,
    "dateOfBirth": dateOfBirth,
    "password": password,
    "KYC": kyc == null ? [] : List<dynamic>.from(kyc!.map((x) => x)),
    "ine": ine,
    "image": image,
    "role": role,
    "emailVerified": emailVerified,
    "approved": approved,
    "isBanned": isBanned,
    "oneTimeCode": oneTimeCode,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
