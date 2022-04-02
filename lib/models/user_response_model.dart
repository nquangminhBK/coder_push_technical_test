/// data : [{"id":"60d0fe4f5311236168a109ca","title":"ms","firstName":"Sara","lastName":"Andersen","picture":"https://randomuser.me/api/portraits/women/58.jpg"},{"id":"60d0fe4f5311236168a109cb","title":"miss","firstName":"Edita","lastName":"Vestering","picture":"https://randomuser.me/api/portraits/med/women/89.jpg"},{"id":"60d0fe4f5311236168a109cc","title":"ms","firstName":"Adina","lastName":"Barbosa","picture":"https://randomuser.me/api/portraits/med/women/28.jpg"},{"id":"60d0fe4f5311236168a109cd","title":"mr","firstName":"Roberto","lastName":"Vega","picture":"https://randomuser.me/api/portraits/med/men/25.jpg"},{"id":"60d0fe4f5311236168a109ce","title":"mr","firstName":"Rudi","lastName":"Droste","picture":"https://randomuser.me/api/portraits/med/men/83.jpg"},{"id":"60d0fe4f5311236168a109cf","title":"mrs","firstName":"Carolina","lastName":"Lima","picture":"https://randomuser.me/api/portraits/med/women/5.jpg"},{"id":"60d0fe4f5311236168a109d0","title":"mr","firstName":"Emre","lastName":"Asikoglu","picture":"https://randomuser.me/api/portraits/med/men/23.jpg"},{"id":"60d0fe4f5311236168a109d1","title":"mr","firstName":"Kent","lastName":"Brewer","picture":"https://randomuser.me/api/portraits/med/men/52.jpg"},{"id":"60d0fe4f5311236168a109d2","title":"mr","firstName":"Evan","lastName":"Carlson","picture":"https://randomuser.me/api/portraits/med/men/80.jpg"},{"id":"60d0fe4f5311236168a109d3","title":"mr","firstName":"Friedrich-Karl","lastName":"Brand","picture":"https://randomuser.me/api/portraits/med/men/7.jpg"}]
/// total : 99
/// page : 0
/// limit : 10
import 'package:hive/hive.dart';
part 'user_response_model.g.dart';
class UserResponseModel {
  UserResponseModel({
      List<UserBasicInfo>? data,
      int? total, 
      int? page, 
      int? limit,}){
    _data = data;
    _total = total;
    _page = page;
    _limit = limit;
}

  UserResponseModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(UserBasicInfo.fromJson(v));
      });
    }
    _total = json['total'];
    _page = json['page'];
    _limit = json['limit'];
  }
  List<UserBasicInfo>? _data;
  int? _total;
  int? _page;
  int? _limit;
UserResponseModel copyWith({  List<UserBasicInfo>? data,
  int? total,
  int? page,
  int? limit,
}) => UserResponseModel(  data: data ?? _data,
  total: total ?? _total,
  page: page ?? _page,
  limit: limit ?? _limit,
);
  List<UserBasicInfo>? get data => _data;
  int? get total => _total;
  int? get page => _page;
  int? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['page'] = _page;
    map['limit'] = _limit;
    return map;
  }

}

/// id : "60d0fe4f5311236168a109ca"
/// title : "ms"
/// firstName : "Sara"
/// lastName : "Andersen"
/// picture : "https://randomuser.me/api/portraits/women/58.jpg"
@HiveType(typeId: 1)
class UserBasicInfo {

  UserBasicInfo({
      String? id, 
      String? title, 
      String? firstName, 
      String? lastName, 
      String? picture,}){
    _id = id;
    _title = title;
    _firstName = firstName;
    _lastName = lastName;
    _picture = picture;
}

  UserBasicInfo.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _picture = json['picture'];
  }
  @HiveField(0)
  String? _id;
  @HiveField(1)
  String? _title;
  @HiveField(2)
  String? _firstName;
  @HiveField(3)
  String? _lastName;
  @HiveField(4)
  String? _picture;
UserBasicInfo copyWith({  String? id,
  String? title,
  String? firstName,
  String? lastName,
  String? picture,
}) => UserBasicInfo(  id: id ?? _id,
  title: title ?? _title,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  picture: picture ?? _picture,
);
  String? get id => _id;
  String? get title => _title;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get picture => _picture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['picture'] = _picture;
    return map;
  }

  @override
  String toString() {
    return 'UserBasicInfo{_id: $_id, _title: $_title, _firstName: $_firstName, _lastName: $_lastName, _picture: $_picture}';
  }
}