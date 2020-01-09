//import 'dart:convert';
//import 'package:http/http.dart';
//
//class Services{
//  Future<Map> myCoaches(String nat_code, Map<String, String> Header) async{
//    //TODO inja request midim
//    var body = {
//      'nat_code': nat_code
//    };
//    var response = await post('http://10.0.2.2:8000/', body: body, headers: Header);
//    var responsebody = json.decode(response.body);
//    //TODO inja model sazi mikonim
//    return {
//      'coaches':
//    };
//  }
//
//  Future<Map> coachDetails(String nat_code, Map<String, String> Header) async{
//    var body = {
//      'nat_code': nat_code
//    };
//    var response = await post('http://10.0.2.2:8000/', body: body, headers: Header);
//    var responsebody = json.decode(response.body);
//
//    return {
//      'coach_details': responsebody
//    };
//  }
//
//  Future<int> createContract(String Athlete, String Coach, Map<String, String> Header) async{
//    var body = {
//      'athlete': Athlete,
//      'coach': Coach,
//    };
//    var response = await post('http://10.0.2.2:8000/', body: body, headers: Header);
//    return response.statusCode;
//  }
//
//  Future<Map> search(String cityID, Map<String, String> Header) async{
//    var response = await get('http://10.0.2.2:8000/', headers: Header);
//    var responsebody = json.decode(response.body);
//    //TODO inja model sazi
//
//    return {
//      'coaches':
//    };
//  }
//
//  Future<Map> getCity(Map<String, String> Header) async{
//    var response = await get('http://10.0.2.2:8000/', headers: Header);
//    var responsebody = json.decode(response.body);
//
//    //inja bayad model sazi koni
//    return {
//      'city':
//    };
//  }
//
//
//}