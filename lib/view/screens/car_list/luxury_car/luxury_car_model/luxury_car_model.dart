
import 'dart:convert';

LuxuryCarModel luxuryCarModelFromJson(String str) => LuxuryCarModel.fromJson(json.decode(str));

String luxuryCarModelToJson(LuxuryCarModel data) => json.encode(data.toJson());

class LuxuryCarModel {
  String? message;
  List<LuxuryCar>? luxuryCars;
  Pagination? pagination;

  LuxuryCarModel({
    this.message,
    this.luxuryCars,
    this.pagination,
  });

  factory LuxuryCarModel.fromJson(Map<String, dynamic> json) => LuxuryCarModel(
    message: json["message"],
    luxuryCars: json["luxuryCars"] == null ? [] : List<LuxuryCar>.from(json["luxuryCars"]!.map((x) => LuxuryCar.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "luxuryCars": luxuryCars == null ? [] : List<dynamic>.from(luxuryCars!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class LuxuryCar {
  String? id;
  String? carModelName;
  List<String>? image;
  int? year;
  String? carLicenseNumber;
  String? carDescription;
  String? insuranceStartDate;
  String? insuranceEndDate;
  List<String>? kyc;
  String? carColor;
  String? carDoors;
  String? carSeats;
  String? totalRun;
  String? hourlyRate;
  String? registrationDate;
  int? popularity;
  String? gearType;
  String? specialCharacteristics;
  bool? activeReserve;
  String? tripStatus;
  CarOwner? carOwner;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? carType;
  String? paymentId;
  List<dynamic>? carImage;
  String? userId;
  int? averageRatings;
  String? offerHourlyRate;

  LuxuryCar({
    this.id,
    this.carModelName,
    this.image,
    this.year,
    this.carLicenseNumber,
    this.carDescription,
    this.insuranceStartDate,
    this.insuranceEndDate,
    this.kyc,
    this.carColor,
    this.carDoors,
    this.carSeats,
    this.totalRun,
    this.hourlyRate,
    this.registrationDate,
    this.popularity,
    this.gearType,
    this.specialCharacteristics,
    this.activeReserve,
    this.tripStatus,
    this.carOwner,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.carType,
    this.paymentId,
    this.carImage,
    this.userId,
    this.averageRatings,
    this.offerHourlyRate,
  });

  factory LuxuryCar.fromJson(Map<String, dynamic> json) => LuxuryCar(
    id: json["_id"],
    carModelName: json["carModelName"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    year: json["year"],
    carLicenseNumber: json["carLicenseNumber"],
    carDescription: json["carDescription"],
    insuranceStartDate: json["insuranceStartDate"],
    insuranceEndDate: json["insuranceEndDate"],
    kyc: json["KYC"] == null ? [] : List<String>.from(json["KYC"]!.map((x) => x)),
    carColor: json["carColor"],
    carDoors: json["carDoors"],
    carSeats: json["carSeats"],
    totalRun: json["totalRun"],
    hourlyRate: json["hourlyRate"],
    registrationDate: json["registrationDate"],
    popularity: json["popularity"],
    gearType: json["gearType"],
    specialCharacteristics: json["specialCharacteristics"],
    activeReserve: json["activeReserve"],
    tripStatus: json["tripStatus"],
    carOwner: json["carOwner"] == null ? null : CarOwner.fromJson(json["carOwner"]),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    carType: json["carType"],
    paymentId: json["paymentId"],
    carImage: json["carImage"] == null ? [] : List<dynamic>.from(json["carImage"]!.map((x) => x)),
    userId: json["userId"],
    averageRatings: json["averageRatings"],
    offerHourlyRate: json["offerHourlyRate"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "carModelName": carModelName,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "year": year,
    "carLicenseNumber": carLicenseNumber,
    "carDescription": carDescription,
    "insuranceStartDate": insuranceStartDate,
    "insuranceEndDate": insuranceEndDate,
    "KYC": kyc == null ? [] : List<dynamic>.from(kyc!.map((x) => x)),
    "carColor": carColor,
    "carDoors": carDoors,
    "carSeats": carSeats,
    "totalRun": totalRun,
    "hourlyRate": hourlyRate,
    "registrationDate": registrationDate,
    "popularity": popularity,
    "gearType": gearType,
    "specialCharacteristics": specialCharacteristics,
    "activeReserve": activeReserve,
    "tripStatus": tripStatus,
    "carOwner": carOwner?.toJson(),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "carType": carType,
    "paymentId": paymentId,
    "carImage": carImage == null ? [] : List<dynamic>.from(carImage!.map((x) => x)),
    "userId": userId,
    "averageRatings": averageRatings,
    "offerHourlyRate": offerHourlyRate,
  };
}

class CarOwner {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? dateOfBirth;
  String? password;
  List<String>? kyc;
  String? rfc;
  String? ine;
  String? image;
  String? role;
  bool? emailVerified;
  bool? approved;
  String? isBanned;
  dynamic oneTimeCode;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? creaditCardNumber;

  CarOwner({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.address,
    this.dateOfBirth,
    this.password,
    this.kyc,
    this.rfc,
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
    this.creaditCardNumber,
  });

  factory CarOwner.fromJson(Map<String, dynamic> json) => CarOwner(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    address: json["address"],
    dateOfBirth: json["dateOfBirth"],
    password: json["password"],
    kyc: json["KYC"] == null ? [] : List<String>.from(json["KYC"]!.map((x) => x)),
    rfc: json["RFC"],
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
    creaditCardNumber: json["creaditCardNumber"],
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
    "RFC": rfc,
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
    "creaditCardNumber": creaditCardNumber,
  };
}

class Pagination {
  int? totalDocuments;
  int? totalPage;
  int? currentPage;
  dynamic previousPage;
  dynamic nextPage;

  Pagination({
    this.totalDocuments,
    this.totalPage,
    this.currentPage,
    this.previousPage,
    this.nextPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalDocuments: json["totalDocuments"],
    totalPage: json["totalPage"],
    currentPage: json["currentPage"],
    previousPage: json["previousPage"],
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalDocuments": totalDocuments,
    "totalPage": totalPage,
    "currentPage": currentPage,
    "previousPage": previousPage,
    "nextPage": nextPage,
  };
}
