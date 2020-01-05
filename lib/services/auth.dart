import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth{

  // token
  Future<Map<dynamic, dynamic>> getToken(String UserName, String PassWord) async{
    print(UserName);
    print(PassWord);
    var body = {
      'username': UserName.toString(),
      'password': PassWord.toString()
    };
    var response = await http.post('http://10.0.2.2:8000/api-token-auth/', body: body);
    var responsebody = json.decode(response.body);
    print(responsebody);
    return responsebody;
  }
  // role
  Future<Map<String, String>> getRole(String UserName, Map<String, String> Header) async{
    var body = {
      'username': UserName
    };

    var response = await http.get('http://10.0.2.2:8000/user/${UserName}/', headers: Header);
    var responsebody = json.decode(response.body);
    return responsebody;
  }
}
