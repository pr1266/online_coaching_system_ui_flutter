import 'dart:convert';

class Coachs{
  String nat_code;
  String first_name;
  String last_name;

  Coachs.fromJson(Map<String, dynamic> parsedJson){
    nat_code = parsedJson['nat_code'];
    first_name = utf8.decode(parsedJson['first_name'].toString().codeUnits);
    last_name = utf8.decode(parsedJson['last_name'].toString().codeUnits);
  }
}

class Athlets{
  String nat_code;
  String first_name;
  String last_name;

  Athlets.fromJson(Map<String, dynamic> parsedJson){
    nat_code = parsedJson['nat_code'];
    first_name = utf8.decode(parsedJson['first_name'].toString().codeUnits);
    last_name = utf8.decode(parsedJson['last_name'].toString().codeUnits);
  }
}

class Citys{
  int ID;
  String name;
    Citys.fromJson(Map<String, dynamic> parsedJson){
    ID = parsedJson['id'];
    name = utf8.decode(parsedJson['name'].toString().codeUnits);
  }
}