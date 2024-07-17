/// success : true
/// data : [{"_id":"6665e1ac4cfda5ba9744fc09","name":"محمود عبدالرحمن عبدالله","gender":"male","age":10,"locationOfLoss":"fayoum","dateOfLoss":"2024-04-10","city":"cairo","description":"Tall with blue eyes","images":["17179529401021ca8ff30807fbda4f02be13c94d2cec5.jpg"],"status":"missing","addedBy":"6634e034aefadba42041059f","mobileNumber":"01007995921","createdAt":"2024-06-09T17:09:00.227Z","updatedAt":"2024-06-09T17:09:00.227Z","__v":0,"id":"6665e1ac4cfda5ba9744fc09"},{"_id":"6665e1684cfda5ba9744fbda","name":"منى محمد فتحي","gender":"female","age":60,"locationOfLoss":"fayoum","dateOfLoss":"2024-04-10","city":"cairo","description":"Tall with blue eyes","images":["17179528721141eb63357c3cbcb29498168921acebb70.jpg"],"status":"missing","addedBy":"6634e034aefadba42041059f","mobileNumber":"01007995921","createdAt":"2024-06-09T17:07:52.334Z","updatedAt":"2024-06-09T17:07:52.334Z","__v":0,"id":"6665e1684cfda5ba9744fbda"},{"_id":"6665e12d4cfda5ba9744fbab","name":"احمد سيد علي","gender":"male","age":16,"locationOfLoss":"fayoum","dateOfLoss":"2024-04-10","city":"cairo","description":"Tall with blue eyes","images":["17179528137490e29783e682260dd84dd51ec469ad5e5.jpg"],"status":"missing","addedBy":"6634e034aefadba42041059f","mobileNumber":"01007995921","createdAt":"2024-06-09T17:06:53.874Z","updatedAt":"2024-06-09T17:06:53.874Z","__v":0,"id":"6665e12d4cfda5ba9744fbab"}]

class LoggedUserPosts {
  LoggedUserPosts({this.success, this.data, this.message, this.status});

  LoggedUserPosts.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(LoggedUserPost.fromJson(v));
      });

    }
    status = json['status'];
    message = json['message'];
  }
  bool? success;
  List<LoggedUserPost>? data;
  String? status;
  String? message;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}

/// _id : "6665e1ac4cfda5ba9744fc09"
/// name : "محمود عبدالرحمن عبدالله"
/// gender : "male"
/// age : 10
/// locationOfLoss : "fayoum"
/// dateOfLoss : "2024-04-10"
/// city : "cairo"
/// description : "Tall with blue eyes"
/// images : ["17179529401021ca8ff30807fbda4f02be13c94d2cec5.jpg"]
/// status : "missing"
/// addedBy : "6634e034aefadba42041059f"
/// mobileNumber : "01007995921"
/// createdAt : "2024-06-09T17:09:00.227Z"
/// updatedAt : "2024-06-09T17:09:00.227Z"
/// __v : 0
/// id : "6665e1ac4cfda5ba9744fc09"

class LoggedUserPost {
  LoggedUserPost({
    this.id,
    this.name,
    this.gender,
    this.age,
    this.locationOfLoss,
    this.dateOfLoss,
    this.city,
    this.description,
    this.images,
    this.status,
    this.addedBy,
    this.mobileNumber,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  LoggedUserPost.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    age = json['age'];
    locationOfLoss = json['locationOfLoss'];
    dateOfLoss = json['dateOfLoss'];
    city = json['city'];
    description = json['description'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    status = json['status'];
    addedBy = json['addedBy'];
    mobileNumber = json['mobileNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? gender;
  int? age;
  String? locationOfLoss;
  String? dateOfLoss;
  String? city;
  String? description;
  List<String>? images;
  String? status;
  String? addedBy;
  String? mobileNumber;
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
    map['city'] = city;
    map['description'] = description;
    map['images'] = images;
    map['status'] = status;
    map['addedBy'] = addedBy;
    map['mobileNumber'] = mobileNumber;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['id'] = id;
    return map;
  }
}
