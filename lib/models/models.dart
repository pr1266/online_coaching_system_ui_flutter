import 'dart:convert';

class Coachs{
  String nat_code;
  String first_name;
  String last_name;
  String picture;

  Coachs.fromJson(Map<String, dynamic> parsedJson){
    nat_code   = parsedJson['nat_code'];
    first_name = utf8.decode(parsedJson['first_name'].toString().codeUnits);
    last_name  = utf8.decode(parsedJson['last_name'].toString().codeUnits);
    picture    = parsedJson['picture'];
  }
}

class Athlets{
  String nat_code;
  String first_name;
  String last_name;
  String picture;

  Athlets.fromJson(Map<String, dynamic> parsedJson){
    nat_code   = parsedJson['nat_code'];
    first_name = utf8.decode(parsedJson['first_name'].toString().codeUnits);
    last_name  = utf8.decode(parsedJson['last_name'].toString().codeUnits);
    picture    = parsedJson['picture'];
  }
}

class Citys{
  int ID;
  String name;
    Citys.fromJson(Map<String, dynamic> parsedJson){
    ID   = parsedJson['id'];
    name = utf8.decode(parsedJson['name'].toString().codeUnits);
  }
}

class CoachRecords{
  String rec;
  String year;
  CoachRecords.fromJson(Map<String, dynamic> parsedJson){
    rec  = utf8.decode(parsedJson['text'].toString().codeUnits);
    year = parsedJson['year'];
  }
}

class Contract{
  int ID;
  String athlete;
  String coach;
  bool status;
  String picture;
  String first_name;
  String last_name;
  Contract.fromJson(Map<String, dynamic> parsedJson){
    ID      = parsedJson['id'];
    athlete = parsedJson['athlete']['nat_code'];
    coach   = parsedJson['coach']['nat_code'];
    status  = parsedJson['status'];
    picture = parsedJson['athlete']['picture'];
    first_name = utf8.decode(parsedJson['athlete']['first_name'].toString().codeUnits);
    last_name = utf8.decode(parsedJson['athlete']['last_name'].toString().codeUnits);
  }
}