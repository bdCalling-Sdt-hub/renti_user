class Sender {
  String? id;
  String? fullName;
  String ?email;
  String ?phoneNumber;
  String ?gender;
  String ?address;
  String ?dateOfBirth;
  String ?password;
  List<dynamic>? kyc;
  String ?rfc;
  String ?ine;
  String ?image;
  String ?role;
  bool ?emailVerified;
  bool ?approved;
  String? isBanned;
  dynamic? oneTimeCode;
  String ?createdAt;
  String ?updatedAt;
  int ?v;
  String ?creditCardNumber;

  Sender.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
    password = json['password'];
    kyc = json['KYC'];
    rfc = json['RFC'];
    ine = json['ine'];
    image = json['image'];
    role = json['role'];
    emailVerified = json['emailVerified'];
    approved = json['approved'];
    isBanned = json['isBanned'];
    oneTimeCode = json['oneTimeCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    creditCardNumber = json['creditCardNumber'];
  }
}

class InboxMessage {
  String? id;
  String ?message;
  String? chat; // Mark as nullable
  Sender? sender;
  String? createdAt;
  String? updatedAt;
  int? v;

  InboxMessage.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    message = json['message'];
    chat = json['chat'];
    sender = Sender.fromJson(json['sender']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
}



