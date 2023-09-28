import 'dart:convert';

class AllCarsModel {
  int? totalCar;
  int? activeCar;
  int? reservedCar;
  List<Car>? cars;
  Pagination? pagination;

  AllCarsModel({
    this.totalCar,
    this.activeCar,
    this.reservedCar,
    this.cars,
    this.pagination,
  });

  factory AllCarsModel.fromRawJson(String str) => AllCarsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllCarsModel.fromJson(Map<String, dynamic> json) => AllCarsModel(
    totalCar: json["totalCar"],
    activeCar: json["activeCar"],
    reservedCar: json["reservedCar"],
    cars: json["cars"] == null ? [] : List<Car>.from(json["cars"]!.map((x) => Car.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "totalCar": totalCar,
    "activeCar": activeCar,
    "reservedCar": reservedCar,
    "cars": cars == null ? [] : List<dynamic>.from(cars!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Car {
  String? id;
  String? carModelName;
  dynamic image;
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
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? paymentId;
  List<String>? carImage;
  String? userId;

  Car({
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
    this.paymentId,
    this.carImage,
    this.userId,
  });

  factory Car.fromRawJson(String str) => Car.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    id: json["_id"],
    carModelName: json["carModelName"],
    image: json["image"],
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
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    paymentId: json["paymentId"],
    carImage: json["carImage"] == null ? [] : List<String>.from(json["carImage"]!.map((x) => x)),
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "carModelName": carModelName,
    "image": image,
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
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "paymentId": paymentId,
    "carImage": carImage == null ? [] : List<dynamic>.from(carImage!.map((x) => x)),
    "userId": userId,
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
  dynamic kyc;
  String? rfc;
  String? creaditCardNumber;
  String? ine;
  String? image;
  String? role;
  bool? emailVerified;
  bool? approved;
  String? isBanned;
  String? oneTimeCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

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
    this.creaditCardNumber,
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

  factory CarOwner.fromRawJson(String str) => CarOwner.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CarOwner.fromJson(Map<String, dynamic> json) => CarOwner(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    address: json["address"],
    dateOfBirth: json["dateOfBirth"],
    password: json["password"],
    kyc: json["KYC"],
    rfc: json["RFC"],
    creaditCardNumber: json["creaditCardNumber"],
    ine: json["ine"],
    image: json["image"],
    role: json["role"],
    emailVerified: json["emailVerified"],
    approved: json["approved"],
    isBanned: json["isBanned"],
    oneTimeCode: json["oneTimeCode"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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
    "KYC": kyc,
    "RFC": rfc,
    "creaditCardNumber": creaditCardNumber,
    "ine": ine,
    "image": image,
    "role": role,
    "emailVerified": emailVerified,
    "approved": approved,
    "isBanned": isBanned,
    "oneTimeCode": oneTimeCode,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
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

  factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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