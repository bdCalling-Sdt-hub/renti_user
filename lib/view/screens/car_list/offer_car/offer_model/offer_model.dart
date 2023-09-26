class OfferModel {
  OfferModel({
      String? message, 
      List<Cars>? cars, 
      Pagination? pagination,}){
    _message = message;
    _cars = cars;
    _pagination = pagination;
}

  OfferModel.fromJson(dynamic json) {
    _message = json['message'];
    if (json['cars'] != null) {
      _cars = [];
      json['cars'].forEach((v) {
        _cars?.add(Cars.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  String? _message;
  List<Cars>? _cars;
  Pagination? _pagination;

  String? get message => _message;
  List<Cars>? get cars => _cars;
  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_cars != null) {
      map['cars'] = _cars?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }

}

class Pagination {
  Pagination({
      int? totalDocuments, 
      int? totalPage, 
      int? currentPage, 
      dynamic previousPage, 
      dynamic nextPage,}){
    _totalDocuments = totalDocuments;
    _totalPage = totalPage;
    _currentPage = currentPage;
    _previousPage = previousPage;
    _nextPage = nextPage;
}

  Pagination.fromJson(dynamic json) {
    _totalDocuments = json['totalDocuments'];
    _totalPage = json['totalPage'];
    _currentPage = json['currentPage'];
    _previousPage = json['previousPage'];
    _nextPage = json['nextPage'];
  }
  int? _totalDocuments;
  int? _totalPage;
  int? _currentPage;
  dynamic _previousPage;
  dynamic _nextPage;

  int? get totalDocuments => _totalDocuments;
  int? get totalPage => _totalPage;
  int? get currentPage => _currentPage;
  dynamic get previousPage => _previousPage;
  dynamic get nextPage => _nextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalDocuments'] = _totalDocuments;
    map['totalPage'] = _totalPage;
    map['currentPage'] = _currentPage;
    map['previousPage'] = _previousPage;
    map['nextPage'] = _nextPage;
    return map;
  }

}

class Cars {
  Cars({
      String? id, 
      String? carModelName, 
      List<String>? image, 
      int? year, 
      String? carLicenseNumber, 
      String? carDescription, 
      String? insuranceStartDate, 
      String? insuranceEndDate, 
      List<String>? kyc, 
      String? carColor, 
      String? carDoors, 
      String? carSeats, 
      String? totalRun, 
      String? hourlyRate, 
      String? registrationDate, 
      int? popularity, 
      String? gearType, 
      String? specialCharacteristics, 
      bool? activeReserve, 
      String? tripStatus, 
      CarOwner? carOwner, 
      String? createdAt, 
      String? updatedAt, 
      int? v,}){
    _id = id;
    _carModelName = carModelName;
    _image = image;
    _year = year;
    _carLicenseNumber = carLicenseNumber;
    _carDescription = carDescription;
    _insuranceStartDate = insuranceStartDate;
    _insuranceEndDate = insuranceEndDate;
    _kyc = kyc;
    _carColor = carColor;
    _carDoors = carDoors;
    _carSeats = carSeats;
    _totalRun = totalRun;
    _hourlyRate = hourlyRate;
    _registrationDate = registrationDate;
    _popularity = popularity;
    _gearType = gearType;
    _specialCharacteristics = specialCharacteristics;
    _activeReserve = activeReserve;
    _tripStatus = tripStatus;
    _carOwner = carOwner;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Cars.fromJson(dynamic json) {
    _id = json['_id'];
    _carModelName = json['carModelName'];
    _image = json['image'] != null ? json['image'].cast<String>() : [];
    _year = json['year'];
    _carLicenseNumber = json['carLicenseNumber'];
    _carDescription = json['carDescription'];
    _insuranceStartDate = json['insuranceStartDate'];
    _insuranceEndDate = json['insuranceEndDate'];
    _kyc = json['KYC'] != null ? json['KYC'].cast<String>() : [];
    _carColor = json['carColor'];
    _carDoors = json['carDoors'];
    _carSeats = json['carSeats'];
    _totalRun = json['totalRun'];
    _hourlyRate = json['hourlyRate'];
    _registrationDate = json['registrationDate'];
    _popularity = json['popularity'];
    _gearType = json['gearType'];
    _specialCharacteristics = json['specialCharacteristics'];
    _activeReserve = json['activeReserve'];
    _tripStatus = json['tripStatus'];
    _carOwner = json['carOwner'] != null ? CarOwner.fromJson(json['carOwner']) : null;
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _carModelName;
  List<String>? _image;
  int? _year;
  String? _carLicenseNumber;
  String? _carDescription;
  String? _insuranceStartDate;
  String? _insuranceEndDate;
  List<String>? _kyc;
  String? _carColor;
  String? _carDoors;
  String? _carSeats;
  String? _totalRun;
  String? _hourlyRate;
  String? _registrationDate;
  int? _popularity;
  String? _gearType;
  String? _specialCharacteristics;
  bool? _activeReserve;
  String? _tripStatus;
  CarOwner? _carOwner;
  String? _createdAt;
  String? _updatedAt;
  int? _v;

  String? get id => _id;
  String? get carModelName => _carModelName;
  List<String>? get image => _image;
  int? get year => _year;
  String? get carLicenseNumber => _carLicenseNumber;
  String? get carDescription => _carDescription;
  String? get insuranceStartDate => _insuranceStartDate;
  String? get insuranceEndDate => _insuranceEndDate;
  List<String>? get kyc => _kyc;
  String? get carColor => _carColor;
  String? get carDoors => _carDoors;
  String? get carSeats => _carSeats;
  String? get totalRun => _totalRun;
  String? get hourlyRate => _hourlyRate;
  String? get registrationDate => _registrationDate;
  int? get popularity => _popularity;
  String? get gearType => _gearType;
  String? get specialCharacteristics => _specialCharacteristics;
  bool? get activeReserve => _activeReserve;
  String? get tripStatus => _tripStatus;
  CarOwner? get carOwner => _carOwner;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['carModelName'] = _carModelName;
    map['image'] = _image;
    map['year'] = _year;
    map['carLicenseNumber'] = _carLicenseNumber;
    map['carDescription'] = _carDescription;
    map['insuranceStartDate'] = _insuranceStartDate;
    map['insuranceEndDate'] = _insuranceEndDate;
    map['KYC'] = _kyc;
    map['carColor'] = _carColor;
    map['carDoors'] = _carDoors;
    map['carSeats'] = _carSeats;
    map['totalRun'] = _totalRun;
    map['hourlyRate'] = _hourlyRate;
    map['registrationDate'] = _registrationDate;
    map['popularity'] = _popularity;
    map['gearType'] = _gearType;
    map['specialCharacteristics'] = _specialCharacteristics;
    map['activeReserve'] = _activeReserve;
    map['tripStatus'] = _tripStatus;
    if (_carOwner != null) {
      map['carOwner'] = _carOwner?.toJson();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

class CarOwner {
  CarOwner({
      String? id, 
      String? fullName, 
      String? email, 
      String? phoneNumber, 
      String? gender, 
      String? address, 
      String? dateOfBirth, 
      String? password, 
      String? kyc, 
      String? rfc, 
      String? ine, 
      String? image, 
      String? role, 
      bool? emailVerified, 
      bool? approved, 
      String? isBanned, 
      dynamic oneTimeCode, 
      String? createdAt, 
      String? updatedAt, 
      int? v, 
      String? creaditCardNumber,}){
    _id = id;
    _fullName = fullName;
    _email = email;
    _phoneNumber = phoneNumber;
    _gender = gender;
    _address = address;
    _dateOfBirth = dateOfBirth;
    _password = password;
    _kyc = kyc;
    _rfc = rfc;
    _ine = ine;
    _image = image;
    _role = role;
    _emailVerified = emailVerified;
    _approved = approved;
    _isBanned = isBanned;
    _oneTimeCode = oneTimeCode;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _creaditCardNumber = creaditCardNumber;
}

  CarOwner.fromJson(dynamic json) {
    _id = json['_id'];
    _fullName = json['fullName'];
    _email = json['email'];
    _phoneNumber = json['phoneNumber'];
    _gender = json['gender'];
    _address = json['address'];
    _dateOfBirth = json['dateOfBirth'];
    _password = json['password'];
    _kyc = json['KYC'];
    _rfc = json['RFC'];
    _ine = json['ine'];
    _image = json['image'];
    _role = json['role'];
    _emailVerified = json['emailVerified'];
    _approved = json['approved'];
    _isBanned = json['isBanned'];
    _oneTimeCode = json['oneTimeCode'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _creaditCardNumber = json['creaditCardNumber'];
  }
  String? _id;
  String? _fullName;
  String? _email;
  String? _phoneNumber;
  String? _gender;
  String? _address;
  String? _dateOfBirth;
  String? _password;
  String? _kyc;
  String? _rfc;
  String? _ine;
  String? _image;
  String? _role;
  bool? _emailVerified;
  bool? _approved;
  String? _isBanned;
  dynamic _oneTimeCode;
  String? _createdAt;
  String? _updatedAt;
  int? _v;
  String? _creaditCardNumber;

  String? get id => _id;
  String? get fullName => _fullName;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get gender => _gender;
  String? get address => _address;
  String? get dateOfBirth => _dateOfBirth;
  String? get password => _password;
  String? get kyc => _kyc;
  String? get rfc => _rfc;
  String? get ine => _ine;
  String? get image => _image;
  String? get role => _role;
  bool? get emailVerified => _emailVerified;
  bool? get approved => _approved;
  String? get isBanned => _isBanned;
  dynamic get oneTimeCode => _oneTimeCode;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;
  String? get creaditCardNumber => _creaditCardNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['fullName'] = _fullName;
    map['email'] = _email;
    map['phoneNumber'] = _phoneNumber;
    map['gender'] = _gender;
    map['address'] = _address;
    map['dateOfBirth'] = _dateOfBirth;
    map['password'] = _password;
    map['KYC'] = _kyc;
    map['RFC'] = _rfc;
    map['ine'] = _ine;
    map['image'] = _image;
    map['role'] = _role;
    map['emailVerified'] = _emailVerified;
    map['approved'] = _approved;
    map['isBanned'] = _isBanned;
    map['oneTimeCode'] = _oneTimeCode;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['creaditCardNumber'] = _creaditCardNumber;
    return map;
  }

}