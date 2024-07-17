/// success : true
/// message : "An OTP was send to Your Mailbox"

class ForgetPasswordResponse {
  ForgetPasswordResponse({
    this.success,
    this.message,
    this.status,
  });

  ForgetPasswordResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    status = json['status'];
  }
  bool? success;
  String? message;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['status'] = status;
    return map;
  }
}
