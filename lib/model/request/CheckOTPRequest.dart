/// identification : "osama.abdo4040@gmail.com"
/// code : "27032"

class CheckOtpRequest {
  CheckOtpRequest({
      this.identification, 
      this.code,});

  CheckOtpRequest.fromJson(dynamic json) {
    identification = json['identification'];
    code = json['code'];
  }
  String? identification;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identification'] = identification;
    map['code'] = code;
    return map;
  }

}