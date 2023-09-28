class RentHistoryModel {
  List<UserWiseRent>? userWiseRent;
  Pagination? pagination;

  RentHistoryModel({this.userWiseRent, this.pagination});

  RentHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['userWiseRent'] != null) {
      userWiseRent = <UserWiseRent>[];
      json['userWiseRent'].forEach((v) {
        userWiseRent!.add(new UserWiseRent.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userWiseRent != null) {
      data['userWiseRent'] = this.userWiseRent!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class UserWiseRent {
  String? sId;
  String? rentTripNumber;
  String? totalAmount;
  String? totalHours;
  String? requestStatus;
  String? startDate;
  String? endDate;
  String? payment;
  UserId? userId;
  CarId? carId;
  HostId? hostId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserWiseRent(
      {this.sId,
        this.rentTripNumber,
        this.totalAmount,
        this.totalHours,
        this.requestStatus,
        this.startDate,
        this.endDate,
        this.payment,
        this.userId,
        this.carId,
        this.hostId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UserWiseRent.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    rentTripNumber = json['rentTripNumber'];
    totalAmount = json['totalAmount'];
    totalHours = json['totalHours'];
    requestStatus = json['requestStatus'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    payment = json['payment'];
    userId =
    json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    carId = json['carId'] != null ? new CarId.fromJson(json['carId']) : null;
    hostId =
    json['hostId'] != null ? new HostId.fromJson(json['hostId']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['rentTripNumber'] = this.rentTripNumber;
    data['totalAmount'] = this.totalAmount;
    data['totalHours'] = this.totalHours;
    data['requestStatus'] = this.requestStatus;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['payment'] = this.payment;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    if (this.carId != null) {
      data['carId'] = this.carId!.toJson();
    }
    if (this.hostId != null) {
      data['hostId'] = this.hostId!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class UserId {
  String? sId;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? dateOfBirth;
  String? password;
  String? kYC;
  String? ine;
  String? image;
  String? role;
  bool? emailVerified;
  bool? approved;
  String? isBanned;
  Null? oneTimeCode;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? rFC;
  String? creaditCardNumber;

  UserId(
      {this.sId,
        this.fullName,
        this.email,
        this.phoneNumber,
        this.gender,
        this.address,
        this.dateOfBirth,
        this.password,
        this.kYC,
        this.ine,
        this.image,
        this.role,
        this.emailVerified,
        this.approved,
        this.isBanned,
        this.oneTimeCode,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.rFC,
        this.creaditCardNumber});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
    password = json['password'];
    kYC = json['KYC'];
    ine = json['ine'];
    image = json['image'];
    role = json['role'];
    emailVerified = json['emailVerified'];
    approved = json['approved'];
    isBanned = json['isBanned'];
    oneTimeCode = json['oneTimeCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    rFC = json['RFC'];
    creaditCardNumber = json['creaditCardNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['dateOfBirth'] = this.dateOfBirth;
    data['password'] = this.password;
    data['KYC'] = this.kYC;
    data['ine'] = this.ine;
    data['image'] = this.image;
    data['role'] = this.role;
    data['emailVerified'] = this.emailVerified;
    data['approved'] = this.approved;
    data['isBanned'] = this.isBanned;
    data['oneTimeCode'] = this.oneTimeCode;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['RFC'] = this.rFC;
    data['creaditCardNumber'] = this.creaditCardNumber;
    return data;
  }
}

class CarId {
  String? sId;
  String? carModelName;
  List<String>? image;
  int? year;
  String? carLicenseNumber;
  String? carDescription;
  String? insuranceStartDate;
  String? insuranceEndDate;
  List<String>? kYC;
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
  String? carOwner;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? paymentId;

  CarId(
      {this.sId,
        this.carModelName,
        this.image,
        this.year,
        this.carLicenseNumber,
        this.carDescription,
        this.insuranceStartDate,
        this.insuranceEndDate,
        this.kYC,
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
        this.iV,
        this.paymentId});

  CarId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    carModelName = json['carModelName'];
    image = json['image'].cast<String>();
    year = json['year'];
    carLicenseNumber = json['carLicenseNumber'];
    carDescription = json['carDescription'];
    insuranceStartDate = json['insuranceStartDate'];
    insuranceEndDate = json['insuranceEndDate'];
    kYC = json['KYC'].cast<String>();
    carColor = json['carColor'];
    carDoors = json['carDoors'];
    carSeats = json['carSeats'];
    totalRun = json['totalRun'];
    hourlyRate = json['hourlyRate'];
    registrationDate = json['registrationDate'];
    popularity = json['popularity'];
    gearType = json['gearType'];
    specialCharacteristics = json['specialCharacteristics'];
    activeReserve = json['activeReserve'];
    tripStatus = json['tripStatus'];
    carOwner = json['carOwner'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    paymentId = json['paymentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['carModelName'] = this.carModelName;
    data['image'] = this.image;
    data['year'] = this.year;
    data['carLicenseNumber'] = this.carLicenseNumber;
    data['carDescription'] = this.carDescription;
    data['insuranceStartDate'] = this.insuranceStartDate;
    data['insuranceEndDate'] = this.insuranceEndDate;
    data['KYC'] = this.kYC;
    data['carColor'] = this.carColor;
    data['carDoors'] = this.carDoors;
    data['carSeats'] = this.carSeats;
    data['totalRun'] = this.totalRun;
    data['hourlyRate'] = this.hourlyRate;
    data['registrationDate'] = this.registrationDate;
    data['popularity'] = this.popularity;
    data['gearType'] = this.gearType;
    data['specialCharacteristics'] = this.specialCharacteristics;
    data['activeReserve'] = this.activeReserve;
    data['tripStatus'] = this.tripStatus;
    data['carOwner'] = this.carOwner;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['paymentId'] = this.paymentId;
    return data;
  }
}

class HostId {
  String? sId;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? dateOfBirth;
  String? password;
  String? kYC;
  String? rFC;
  String? ine;
  String? image;
  String? role;
  bool? emailVerified;
  bool? approved;
  String? isBanned;
  String? oneTimeCode;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? creaditCardNumber;

  HostId(
      {this.sId,
        this.fullName,
        this.email,
        this.phoneNumber,
        this.gender,
        this.address,
        this.dateOfBirth,
        this.password,
        this.kYC,
        this.rFC,
        this.ine,
        this.image,
        this.role,
        this.emailVerified,
        this.approved,
        this.isBanned,
        this.oneTimeCode,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.creaditCardNumber});

  HostId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
    password = json['password'];
    kYC = json['KYC'];
    rFC = json['RFC'];
    ine = json['ine'];
    image = json['image'];
    role = json['role'];
    emailVerified = json['emailVerified'];
    approved = json['approved'];
    isBanned = json['isBanned'];
    oneTimeCode = json['oneTimeCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    creaditCardNumber = json['creaditCardNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['dateOfBirth'] = this.dateOfBirth;
    data['password'] = this.password;
    data['KYC'] = this.kYC;
    data['RFC'] = this.rFC;
    data['ine'] = this.ine;
    data['image'] = this.image;
    data['role'] = this.role;
    data['emailVerified'] = this.emailVerified;
    data['approved'] = this.approved;
    data['isBanned'] = this.isBanned;
    data['oneTimeCode'] = this.oneTimeCode;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['creaditCardNumber'] = this.creaditCardNumber;
    return data;
  }
}

class Pagination {
  int? totalDocuments;
  int? totalPage;
  int? currentPage;
  Null? previousPage;
  int? nextPage;

  Pagination(
      {this.totalDocuments,
        this.totalPage,
        this.currentPage,
        this.previousPage,
        this.nextPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalDocuments = json['totalDocuments'];
    totalPage = json['totalPage'];
    currentPage = json['currentPage'];
    previousPage = json['previousPage'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalDocuments'] = this.totalDocuments;
    data['totalPage'] = this.totalPage;
    data['currentPage'] = this.currentPage;
    data['previousPage'] = this.previousPage;
    data['nextPage'] = this.nextPage;
    return data;
  }
}