/// success : true
/// result : {"_id":"666b24b7b91e0f64acce6e1a","fullName":"Ahmed Hassan","email":"ahmed1234@gmail.com","role":"user","governorate":"Cairo","isActive":true,"mobileNumber":"01091407560","createdAt":"2024-06-13T16:56:23.926Z","updatedAt":"2024-06-13T16:56:23.926Z","__v":0}

class LoggedUserInfo {
  LoggedUserInfo({
      this.success, 
      this.result,});

  LoggedUserInfo.fromJson(dynamic json) {
    success = json['success'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  bool? success;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}

/// _id : "666b24b7b91e0f64acce6e1a"
/// fullName : "Ahmed Hassan"
/// email : "ahmed1234@gmail.com"
/// role : "user"
/// governorate : "Cairo"
/// isActive : true
/// mobileNumber : "01091407560"
/// createdAt : "2024-06-13T16:56:23.926Z"
/// updatedAt : "2024-06-13T16:56:23.926Z"
/// __v : 0

class Result {
  Result({
      this.id, 
      this.fullName, 
      this.email, 
      this.role, 
      this.governorate, 
      this.isActive, 
      this.mobileNumber, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Result.fromJson(dynamic json) {
    id = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    role = json['role'];
    governorate = json['governorate'];
    isActive = json['isActive'];
    mobileNumber = json['mobileNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? fullName;
  String? email;
  String? role;
  String? governorate;
  bool? isActive;
  String? mobileNumber;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    map['role'] = role;
    map['governorate'] = governorate;
    map['isActive'] = isActive;
    map['mobileNumber'] = mobileNumber;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}