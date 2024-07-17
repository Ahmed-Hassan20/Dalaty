/// identification : "osama.abdo4040@gmail.com"
/// code : "83973"
/// newPassword : "Os#123456"
/// confirmNewPassword : "Os#123456"

class ChangePasswordRequest {
  ChangePasswordRequest({
      this.identification, 
      this.code, 
      this.newPassword, 
      this.confirmNewPassword,});

  ChangePasswordRequest.fromJson(dynamic json) {
    identification = json['identification'];
    code = json['code'];
    newPassword = json['newPassword'];
    confirmNewPassword = json['confirmNewPassword'];
  }
  String? identification;
  String? code;
  String? newPassword;
  String? confirmNewPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identification'] = identification;
    map['code'] = code;
    map['newPassword'] = newPassword;
    map['confirmNewPassword'] = confirmNewPassword;
    return map;
  }

}