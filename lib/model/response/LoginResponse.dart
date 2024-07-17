/// success : true
/// message : "User logged in"
/// token : "secret_eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MzBiYjRlN2FlZGExZjFhM2FlMTZiYiIsImVtYWlsIjoib3NhbWEuYWJkbzQwNDBAZ21haWwuY29tIiwiaWF0IjoxNzE0NDY5NzYzfQ.VtQ1ArPTalx-Mo7fkcVmUbhSwe-m5Cpo_LHZCXqTBlI"

class LoginResponse {
  LoginResponse({
      this.success, 
      this.message, 
      this.token,
      this.status});

  LoginResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    status = json['status'];

  }
  bool? success;
  String? message;
  String? token;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['token'] = token;
    map['status'] = status;
    return map;
  }

}