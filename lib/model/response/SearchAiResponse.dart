/// success : true
/// message : "The image was matched successfully with one of our missing people in database"
/// data : {"_id":"6627e8f04a55eaefd8364576","name":"محمد جمال السعيد المنياوي","dateOfLoss":"Thu Jul 20 2017 00:00:00 GMT+0000 (Coordinated Universal Time)","age":0,"description":"القصه الخياطه  دمياط","images":["413bc25a33666ec9e856da619cb2618c.jpg"],"city":"Gharbia","gender":"male","status":"done","updatedAt":"2024-06-20T15:50:18.597Z","id":"6627e8f04a55eaefd8364576"}

class SearchAiResponse {
  SearchAiResponse({
      this.success, 
      this.message, 
      this.data,});

  SearchAiResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? SearchResponse.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  SearchResponse? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// _id : "6627e8f04a55eaefd8364576"
/// name : "محمد جمال السعيد المنياوي"
/// dateOfLoss : "Thu Jul 20 2017 00:00:00 GMT+0000 (Coordinated Universal Time)"
/// age : 0
/// description : "القصه الخياطه  دمياط"
/// images : ["413bc25a33666ec9e856da619cb2618c.jpg"]
/// city : "Gharbia"
/// gender : "male"
/// status : "done"
/// updatedAt : "2024-06-20T15:50:18.597Z"
/// id : "6627e8f04a55eaefd8364576"

class SearchResponse {
  SearchResponse({
      this.id, 
      this.name, 
      this.dateOfLoss, 
      this.age, 
      this.description, 
      this.images, 
      this.city, 
      this.gender, 
      this.status,
      this.message,
      this.updatedAt, 
     });

  SearchResponse.fromJson(dynamic json) {
    id = json['id'];

    name = json['name'];
    dateOfLoss = json['dateOfLoss'];
    age = json['age'];
    description = json['description'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    city = json['city'];
    gender = json['gender'];
    status = json['status'];
    message = json['message'];
    updatedAt = json['updatedAt'];
  }
  String? id;
  String? name;
  String? dateOfLoss;
  int? age;
  String? description;
  List<String>? images;
  String? city;
  String? gender;
  String? status;
  String? message;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;

    map['name'] = name;
    map['dateOfLoss'] = dateOfLoss;
    map['age'] = age;
    map['description'] = description;
    map['images'] = images;
    map['city'] = city;
    map['gender'] = gender;
    map['status'] = status;
    map['updatedAt'] = updatedAt;
    map['message'] = message;
    return map;
  }

}