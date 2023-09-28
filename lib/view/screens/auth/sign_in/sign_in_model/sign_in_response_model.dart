class SignInResponseModel {
  String? message;
  User? user;
  String? accessToken;

  SignInResponseModel({this.message, this.user, this.accessToken});

  SignInResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
    return data;
  }
}

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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
