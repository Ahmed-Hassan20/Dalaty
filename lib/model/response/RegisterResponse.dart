/// success : true
/// message : "User created"

class RegisterResponse {
  RegisterResponse({
      this.success, 
      this.message,
      this.status,
      this.stack,
  });

  RegisterResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    status = json['status'];
    stack = json['stack'];

  }
  bool? success;
  String? message;
  String? status;
  String? stack;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['status'] = status;
    map['stack'] = stack;

    return map;
  }

}