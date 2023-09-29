class CarDetailModel {
  String message;
  Rents rents;

  CarDetailModel({
    required this.message,
    required this.rents,
  });

}

class Rents {
  String rentTripNumber;
  String totalAmount;
  String totalHours;
  String requestStatus;
  DateTime startDate;
  DateTime endDate;
  String payment;
  UserId userId;
  CarId carId;
  String hostId;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Rents({
    required this.rentTripNumber,
    required this.totalAmount,
    required this.totalHours,
    required this.requestStatus,
    required this.startDate,
    required this.endDate,
    required this.payment,
    required this.userId,
    required this.carId,
    required this.hostId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

}

class CarId {
  String id;
  String carModelName;
  List<String> image;
  int year;
  String carLicenseNumber;
  String carDescription;
  String insuranceStartDate;
  String insuranceEndDate;
  List<String> kyc;
  String carColor;
  String carDoors;
  String carSeats;
  String totalRun;
  String hourlyRate;
  String registrationDate;
  int popularity;
  String gearType;
  String specialCharacteristics;
  bool activeReserve;
  String tripStatus;
  String carOwner;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String paymentId;
  List<String> carImage;
  String userId;

  CarId({
    required this.id,
    required this.carModelName,
    required this.image,
    required this.year,
    required this.carLicenseNumber,
    required this.carDescription,
    required this.insuranceStartDate,
    required this.insuranceEndDate,
    required this.kyc,
    required this.carColor,
    required this.carDoors,
    required this.carSeats,
    required this.totalRun,
    required this.hourlyRate,
    required this.registrationDate,
    required this.popularity,
    required this.gearType,
    required this.specialCharacteristics,
    required this.activeReserve,
    required this.tripStatus,
    required this.carOwner,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.paymentId,
    required this.carImage,
    required this.userId,
  });

}

class UserId {
  String id;
  String fullName;
  String email;
  String phoneNumber;
  String gender;
  String address;
  String dateOfBirth;
  String password;
  List<dynamic> kyc;
  String ine;
  String image;
  String role;
  bool emailVerified;
  bool approved;
  String isBanned;
  String oneTimeCode;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  UserId({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.address,
    required this.dateOfBirth,
    required this.password,
    required this.kyc,
    required this.ine,
    required this.image,
    required this.role,
    required this.emailVerified,
    required this.approved,
    required this.isBanned,
    required this.oneTimeCode,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

}
