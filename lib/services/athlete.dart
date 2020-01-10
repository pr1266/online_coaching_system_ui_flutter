import 'dart:convert';
import 'package:http/http.dart';
import 'package:online_coaching/models/models.dart';

class Services{
  Future<Map> myCoaches(String nat_code, Map<String, String> Header) async{
    //TODO inja request midim
    var body = {
      'nat_code': nat_code
    };
    var response = await post('http://10.0.2.2:8000/coachofathlete/', body: body, headers: Header);
    var responsebody = json.decode(response.body);
    //TODO inja model sazi mikonim
    List<Coachs> coaches = [];
    responsebody.forEach((item){
      coaches.add(Coachs.fromJson(item));
    });
    return {
      'coaches': coaches
    };
  }

  Future<Map> coachDetails(String nat_code, Map<String, String> Header) async{
    var response = await get('http://10.0.2.2:8000/coach/{$nat_code}/', headers: Header);
    var responsebody = json.decode(response.body);
    return {
      'coach_details': responsebody
    };
  }

  Future<int> createContract(String Athlete, String Coach, Map<String, String> Header) async{
    var body = {
      'athlete': Athlete,
      'coach': Coach,
      'status': false
    };
    var response = await post('http://10.0.2.2:8000/createcontract/', body: body, headers: Header);
    return response.statusCode;
  }

  Future<Map> search(String Value, Map<String, String> Header) async{
    var response = await get('http://10.0.2.2:8000/coach/${Value}/', headers: Header);
    var responsebody = json.decode(response.body);
    //TODO inja model sazi
    Coachs coach_ = Coachs.fromJson(responsebody);
    return {
      'coaches': coach_
    };
  }

  Future<Map> getCity(Map<String, String> Header) async{
    var response = await get('http://10.0.2.2:8000/', headers: Header);
    var responsebody = json.decode(response.body);

    // TODO inja bayad model sazi koni
    List<Citys> city = [];
    responsebody.forEach((item){
      city.add(Citys.fromJson(item));
    });
    return {
      'city': city
    };
  }


}