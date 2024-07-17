/// success : true
/// data : {"person":{"name":"last test for now6","gender":"male","age":99,"locationOfLoss":"fayoum","dateOfLoss":"2024-04-10","description":"Tall with blue eyes","images":[],"status":"missing","addedBy":"6630fddb968875e839d6c6d1","mobileNumber":"01012345678","_id":"663652959a40b45c6e551789","createdAt":"2024-05-04T15:21:57.745Z","updatedAt":"2024-05-04T15:21:57.745Z","__v":0,"id":"663652959a40b45c6e551789"}}

class CreateCaseResponse {
  CreateCaseResponse({this.success, this.data, this.status, this.message});

  CreateCaseResponse.fromJson(dynamic json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  Data? data;
  String? status;
  String? message;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// person : {"name":"last test for now6","gender":"male","age":99,"locationOfLoss":"fayoum","dateOfLoss":"2024-04-10","description":"Tall with blue eyes","images":[],"status":"missing","addedBy":"6630fddb968875e839d6c6d1","mobileNumber":"01012345678","_id":"663652959a40b45c6e551789","createdAt":"2024-05-04T15:21:57.745Z","updatedAt":"2024-05-04T15:21:57.745Z","__v":0,"id":"663652959a40b45c6e551789"}

class Data {
  Data({
    this.person,
  });

  Data.fromJson(dynamic json) {
    person = json['person'] != null ? Person.fromJson(json['person']) : null;
  }
  Person? person;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (person != null) {
      map['person'] = person?.toJson();
    }
    return map;
  }
}

/// name : "last test for now6"
/// gender : "male"
/// age : 99
/// locationOfLoss : "fayoum"
/// dateOfLoss : "2024-04-10"
/// description : "Tall with blue eyes"
/// images : []
/// status : "missing"
/// addedBy : "6630fddb968875e839d6c6d1"
/// mobileNumber : "01012345678"
/// _id : "663652959a40b45c6e551789"
/// createdAt : "2024-05-04T15:21:57.745Z"
/// updatedAt : "2024-05-04T15:21:57.745Z"
/// __v : 0
/// id : "663652959a40b45c6e551789"

class Person {
  Person({
    this.name,
    this.gender,
    this.age,
    this.locationOfLoss,
    this.dateOfLoss,
    this.description,
    this.images,
    this.status,
    this.addedBy,
    this.mobileNumber,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Person.fromJson(dynamic json) {
    name = json['name'];
    gender = json['gender'];
    age = json['age'];
    locationOfLoss = json['locationOfLoss'];
    dateOfLoss = json['dateOfLoss'];
    description = json['description'];
    images = json['images']?.cast<String>();
    status = json['status'];
    addedBy = json['addedBy'];
    mobileNumber = json['mobileNumber'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
  String? name;
  String? gender;
  int? age;
  String? locationOfLoss;
  String? dateOfLoss;
  String? description;
  List<dynamic>? images;
  String? status;
  String? addedBy;
  String? mobileNumber;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['gender'] = gender;
    map['age'] = age;
    map['locationOfLoss'] = locationOfLoss;
    map['dateOfLoss'] = dateOfLoss;
    map['description'] = description;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['addedBy'] = addedBy;
    map['mobileNumber'] = mobileNumber;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['id'] = id;
    return map;
  }
}
