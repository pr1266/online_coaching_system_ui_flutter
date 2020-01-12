import 'dart:convert';
import 'package:http/http.dart';
import 'package:online_coaching/models/models.dart';

class Services{
  Future<Map> myAthlets(String nat_code, Map<String, String> Header) async{
    //TODO inja request midim
    var response = await get('http://10.0.2.2:8000/athletsofcoach?q=${nat_code}', headers: Header);
    var responsebody = json.decode(response.body);
    //TODO inja model sazi mikonim
    List<Athlets> athlets = [];
    responsebody.forEach((item){
      athlets.add(Athlets.fromJson(item));
    });
    return {
      'athlets': athlets
    };
  }

  Future<int> AcceptContract(String Athlete, String Coach, bool Status, Map<String, String> Header) async{

    var body = {
      'athlete': Athlete,
      'coach': Coach,
      'status': Status.toString()
    };
    var response = await post('http://10.0.2.2:8000/updatecontract/', body: body, headers: Header);
    return response.statusCode;
  }

  Future<int> DeclinContract(String ContractID, Map<String, String> Header) async{

    var response = await delete('http://10.0.2.2:8000/contract/${ContractID}/delete/', headers: Header);
    return response.statusCode;
  }

  Future<Map> myRequests(String nat_code, Map<String, String> Header) async{
    var response = await get('http://10.0.2.2:8000/requestsofcoach/?q=${nat_code}', headers: Header);
    var responsebody = json.decode(response.body);
    print(responsebody);
    List<Contract> athlets = [];
    if(responsebody.length != 0) {
      responsebody.forEach((item) {
        athlets.add(Contract.fromJson(item));
      });
    }
    return {
      'contract': athlets
    };
  }
}