class Missing {
  Missing({
    this.success,
    this.page,
    this.data,
    this.status,
    this.message,
  });

  Missing.fromJson(dynamic json) {
    success = json['success'];
    page = json['page'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  int? page;
  String? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['page'] = page;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.missingPersons,
  });

  Data.fromJson(dynamic json) {
    if (json['missingPersons'] != null) {
      missingPersons = [];
      json['missingPersons'].forEach((v) {
        missingPersons?.add(MissingPersons.fromJson(v));
      });
    }
  }
  List<MissingPersons>? missingPersons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (missingPersons != null) {
      map['missingPersons'] = missingPersons?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class MissingPersons {
  MissingPersons({
    this.id,
    this.name,
    this.gender,
    this.age,
    this.city,
    this.locationOfLoss,
    this.dateOfLoss,
    this.description,
    this.images,
    this.status,
    this.addedBy,
    this.createdAt,
    this.mobileNumber,
    this.updatedAt,
    this.v,
  });

  MissingPersons.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    age = json['age'];
    city = json['city'];
    locationOfLoss = json['locationOfLoss'];
    dateOfLoss = json['dateOfLoss'];
    description = json['description'];
    images = json['images']?.cast<String>(); // Update this line
    status = json['status'];
    addedBy = json['addedBy'];
    createdAt = json['createdAt'];
    mobileNumber = json['mobileNumber'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? gender;
  int? age;
  String? city;
  String? locationOfLoss;
  String? dateOfLoss;
  String? description;
  List<dynamic>? images;
  String? status;
  dynamic addedBy;
  String? createdAt;
  String? mobileNumber;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['gender'] = gender;
    map['age'] = age;
    map['city'] = city;
    map['locationOfLoss'] = locationOfLoss;
    map['dateOfLoss'] = dateOfLoss;
    map['description'] = description;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['addedBy'] = addedBy;
    map['createdAt'] = createdAt;
    map['mobileNumber'] = mobileNumber;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['id'] = id;
    return map;
  }
}
