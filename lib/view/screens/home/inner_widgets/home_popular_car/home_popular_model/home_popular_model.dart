import 'dart:convert';

class PopularCarModel {
  String? message;
  List<Car>? cars;
  Pagination? pagination;

  PopularCarModel({
    this.message,
    this.cars,
    this.pagination,
  });

  factory PopularCarModel.fromRawJson(String str) => PopularCarModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PopularCarModel.fromJson(Map<String, dynamic> json) => PopularCarModel(
    message: json["message"],
    cars: json["cars"] == null ? [] : List<Car>.from(json["cars"]!.map((x) => Car.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
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
  InsuranceStartDate? insuranceStartDate;
  InsuranceEndDate? insuranceEndDate;
  List<String>? kyc;
  CarColor? carColor;
  String? carDoors;
  String? carSeats;
  TotalRun? totalRun;
  String? hourlyRate;
  RegistrationDate? registrationDate;
  int? popularity;
  GearType? gearType;
  SpecialCharacteristics? specialCharacteristics;
  bool? activeReserve;
  TripStatus? tripStatus;
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
    insuranceStartDate: insuranceStartDateValues.map[json["insuranceStartDate"]]!,
    insuranceEndDate: insuranceEndDateValues.map[json["insuranceEndDate"]]!,
    kyc: json["KYC"] == null ? [] : List<String>.from(json["KYC"]!.map((x) => x)),
    carColor: carColorValues.map[json["carColor"]]!,
    carDoors: json["carDoors"],
    carSeats: json["carSeats"],
    totalRun: totalRunValues.map[json["totalRun"]]!,
    hourlyRate: json["hourlyRate"],
    registrationDate: registrationDateValues.map[json["registrationDate"]]!,
    popularity: json["popularity"],
    gearType: gearTypeValues.map[json["gearType"]]!,
    specialCharacteristics: specialCharacteristicsValues.map[json["specialCharacteristics"]]!,
    activeReserve: json["activeReserve"],
    tripStatus: tripStatusValues.map[json["tripStatus"]]!,
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
    "insuranceStartDate": insuranceStartDateValues.reverse[insuranceStartDate],
    "insuranceEndDate": insuranceEndDateValues.reverse[insuranceEndDate],
    "KYC": kyc == null ? [] : List<dynamic>.from(kyc!.map((x) => x)),
    "carColor": carColorValues.reverse[carColor],
    "carDoors": carDoors,
    "carSeats": carSeats,
    "totalRun": totalRunValues.reverse[totalRun],
    "hourlyRate": hourlyRate,
    "registrationDate": registrationDateValues.reverse[registrationDate],
    "popularity": popularity,
    "gearType": gearTypeValues.reverse[gearType],
    "specialCharacteristics": specialCharacteristicsValues.reverse[specialCharacteristics],
    "activeReserve": activeReserve,
    "tripStatus": tripStatusValues.reverse[tripStatus],
    "carOwner": carOwner?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "paymentId": paymentId,
    "carImage": carImage == null ? [] : List<dynamic>.from(carImage!.map((x) => x)),
    "userId": userId,
  };
}

enum CarColor {
  BLACK
}

final carColorValues = EnumValues({
  "Black": CarColor.BLACK
});

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
    "KYC": kyc,
    "RFC": rfc,
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
    "creaditCardNumber": creaditCardNumber,
  };
}

enum GearType {
  MANUAL
}

final gearTypeValues = EnumValues({
  "Manual": GearType.MANUAL
});

enum InsuranceEndDate {
  THE_22082023,
  THE_22082024
}

final insuranceEndDateValues = EnumValues({
  "22-08-2023": InsuranceEndDate.THE_22082023,
  "22-08-2024": InsuranceEndDate.THE_22082024
});

enum InsuranceStartDate {
  THE_22012023,
  THE_22082022
}

final insuranceStartDateValues = EnumValues({
  "22-01-2023": InsuranceStartDate.THE_22012023,
  "22-08-2022": InsuranceStartDate.THE_22082022
});

enum RegistrationDate {
  THE_22082023,
  THE_22082025
}

final registrationDateValues = EnumValues({
  "22-08-2023 ": RegistrationDate.THE_22082023,
  "22-08-2025": RegistrationDate.THE_22082025
});

enum SpecialCharacteristics {
  GPS
}

final specialCharacteristicsValues = EnumValues({
  "GPS": SpecialCharacteristics.GPS
});

enum TotalRun {
  THE_50_KM
}

final totalRunValues = EnumValues({
  "50 km": TotalRun.THE_50_KM
});

enum TripStatus {
  PENDING,
  START
}

final tripStatusValues = EnumValues({
  "Pending": TripStatus.PENDING,
  "Start": TripStatus.START
});

class Pagination {
  int? totalDocuments;
  int? totalPage;
  int? currentPage;
  dynamic previousPage;
  int? nextPage;

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
