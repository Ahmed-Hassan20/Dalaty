/// fullName : "nasubusbd"
/// email : "nasubusbd@gmail.com"
/// password : "Zz01016442113"
/// confirmPassword : "Zz01016442113"
/// governorate : "cairo"
/// mobileNumber : "01006995968"

class RegisterRequest {
  RegisterRequest({
    this.fullName,
    this.email,
    this.password,
    this.confirmPassword,
    this.governorate,
    this.mobileNumber,
  });

  RegisterRequest.fromJson(dynamic json) {
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    governorate = json['governorate'];
    mobileNumber = json['mobileNumber'];
  }
  String? fullName;
  String? email;
  String? password;
  String? confirmPassword;
  String? governorate;
  String? mobileNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = fullName;
    map['email'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['governorate'] = governorate;
    map['mobileNumber'] = mobileNumber;
    return map;
  }
}
