class PrivatePolicyModel {
  PrivatePolicyModel({
    String? message,
    PrivacyPolicy? privacyPolicy,}){
    _message = message;
    _privacyPolicy = privacyPolicy;
  }

  PrivatePolicyModel.fromJson(dynamic json) {
    _message = json['message'];
    _privacyPolicy = json['privacyPolicy'] != null ? PrivacyPolicy.fromJson(json['privacyPolicy']) : null;
  }
  String? _message;
  PrivacyPolicy? _privacyPolicy;

  String? get message => _message;
  PrivacyPolicy? get privacyPolicy => _privacyPolicy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_privacyPolicy != null) {
      map['privacyPolicy'] = _privacyPolicy?.toJson();
    }
    return map;
  }

}

class PrivacyPolicy {
  PrivacyPolicy({
    String? id,
    String? content,
    String? createdAt,
    String? updatedAt,
    int? v,}){
    _id = id;
    _content = content;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  PrivacyPolicy.fromJson(dynamic json) {
    _id = json['_id'];
    _content = json['content'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _content;
  String? _createdAt;
  String? _updatedAt;
  int? _v;

  String? get id => _id;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['content'] = _content;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}