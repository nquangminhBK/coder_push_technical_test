/// id : "60d0fe4f5311236168a109cf"
/// title : "mrs"
/// firstName : "Carolina"
/// lastName : "Lima"
/// picture : "https://randomuser.me/api/portraits/med/women/5.jpg"
/// gender : "female"
/// email : "carolina.lima@example.com"
/// dateOfBirth : "1994-03-04T03:04:53.673Z"
/// phone : "(79) 9932-2522"
/// location : {"street":"4162, Rua da Paz ","city":"Boa Vista","state":"Rio Grande do Norte","country":"Brazil","timezone":"-4:00"}
/// registerDate : "2021-06-21T21:02:08.193Z"
/// updatedDate : "2021-06-21T21:02:08.193Z"


class UserDetailModel {
  UserDetailModel({
      String? id, 
      String? title, 
      String? firstName, 
      String? lastName, 
      String? picture, 
      String? gender, 
      String? email, 
      String? dateOfBirth, 
      String? phone, 
      Location? location, 
      String? registerDate, 
      String? updatedDate,}){
    _id = id;
    _title = title;
    _firstName = firstName;
    _lastName = lastName;
    _picture = picture;
    _gender = gender;
    _email = email;
    _dateOfBirth = dateOfBirth;
    _phone = phone;
    _location = location;
    _registerDate = registerDate;
    _updatedDate = updatedDate;
}

  UserDetailModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _picture = json['picture'];
    _gender = json['gender'];
    _email = json['email'];
    _dateOfBirth = json['dateOfBirth'];
    _phone = json['phone'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _registerDate = json['registerDate'];
    _updatedDate = json['updatedDate'];
  }
  String? _id;
  String? _title;
  String? _firstName;
  String? _lastName;
  String? _picture;
  String? _gender;
  String? _email;
  String? _dateOfBirth;
  String? _phone;
  Location? _location;
  String? _registerDate;
  String? _updatedDate;
UserDetailModel copyWith({  String? id,
  String? title,
  String? firstName,
  String? lastName,
  String? picture,
  String? gender,
  String? email,
  String? dateOfBirth,
  String? phone,
  Location? location,
  String? registerDate,
  String? updatedDate,
}) => UserDetailModel(  id: id ?? _id,
  title: title ?? _title,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  picture: picture ?? _picture,
  gender: gender ?? _gender,
  email: email ?? _email,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  phone: phone ?? _phone,
  location: location ?? _location,
  registerDate: registerDate ?? _registerDate,
  updatedDate: updatedDate ?? _updatedDate,
);
  String? get id => _id;
  String? get title => _title;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get picture => _picture;
  String? get gender => _gender;
  String? get email => _email;
  String? get dateOfBirth => _dateOfBirth;
  String? get phone => _phone;
  Location? get location => _location;
  String? get registerDate => _registerDate;
  String? get updatedDate => _updatedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['picture'] = _picture;
    map['gender'] = _gender;
    map['email'] = _email;
    map['dateOfBirth'] = _dateOfBirth;
    map['phone'] = _phone;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['registerDate'] = _registerDate;
    map['updatedDate'] = _updatedDate;
    return map;
  }

}

/// street : "4162, Rua da Paz "
/// city : "Boa Vista"
/// state : "Rio Grande do Norte"
/// country : "Brazil"
/// timezone : "-4:00"

class Location {
  Location({
      String? street, 
      String? city, 
      String? state, 
      String? country, 
      String? timezone,}){
    _street = street;
    _city = city;
    _state = state;
    _country = country;
    _timezone = timezone;
}

  Location.fromJson(dynamic json) {
    _street = json['street'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _timezone = json['timezone'];
  }
  String? _street;
  String? _city;
  String? _state;
  String? _country;
  String? _timezone;
Location copyWith({  String? street,
  String? city,
  String? state,
  String? country,
  String? timezone,
}) => Location(  street: street ?? _street,
  city: city ?? _city,
  state: state ?? _state,
  country: country ?? _country,
  timezone: timezone ?? _timezone,
);
  String? get street => _street;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get timezone => _timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = _street;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['timezone'] = _timezone;
    return map;
  }

}