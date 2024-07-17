import 'dart:io';

class CreateCaseRequest {
  CreateCaseRequest(
      {this.name,
        this.gender,
        this.age,
        this.city,
        this.locationOfLoss,
        this.dateOfLoss,
        this.description,
        this.image,
        this.status,
        this.mobileNumber});

  CreateCaseRequest.fromJson(dynamic json) {
    name = json['name'];
    gender = json['gender'];
    age = json['age'];
    city = json['city'];
    locationOfLoss = json['locationOfLoss'];
    dateOfLoss = json['dateOfLoss'];
    description = json['description'];
    image = json['image'] != null ? File(json['image']) : null;
    status = json['status'];
    mobileNumber = json['mobileNumber'];
  }

  String? name;
  String? gender;
  int? age;
  String? city;
  String? locationOfLoss;
  String? dateOfLoss;
  String? description;
  File? image;
  String? status;
  String? mobileNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['gender'] = gender;
    map['age'] = age;
    map['city'] = city;
    map['locationOfLoss'] = locationOfLoss;
    map['dateOfLoss'] = dateOfLoss;
    map['description'] = description;
    map['image'] = image?.path;
    map['status'] = status;
    map['mobileNumber'] = mobileNumber;
    return map;
  }
}
