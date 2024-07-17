/// success : true
/// message : "Code is correct"

class CheckOtpResponse {
  CheckOtpResponse({
      this.success, 
      this.message,
    this.status,
  });

  CheckOtpResponse.fromJson(dynamic json) {
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