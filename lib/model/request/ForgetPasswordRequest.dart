/// identification : "osama.abdo4040@gmail.com"

class ForgetPasswordRequest {
  ForgetPasswordRequest({
      this.identification,});

  ForgetPasswordRequest.fromJson(dynamic json) {
    identification = json['identification'];
  }
  String? identification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identification'] = identification;
    return map;
  }

}