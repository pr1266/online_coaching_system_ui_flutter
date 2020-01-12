import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth{

  // token
  Future<dynamic> getToken(String UserName, String PassWord) async{
    print('info');
    print(UserName);
    print(PassWord);
    var body = {
      'username': UserName,
      'password': PassWord
    };
    var response = await http.post('http://10.0.2.2:8000/api-token-auth/', body: body);
    var responsebody = json.decode(response.body);
    print(responsebody);
    return responsebody;
  }
  // role
  Future<dynamic> getRole(String UserName, dynamic Header) async{
    var response = await http.get('http://10.0.2.2:8000/user/' + UserName + '/', headers: Header);
    var responsebody = json.decode(response.body);
    return responsebody;
  }

  Future<dynamic> getInfo(String UserName, dynamic Header, bool Type) async{
    var body = {
      'username': UserName.toString()
    };
    print(body);
    var response;
    if(Type){
      response = await http.post('http://10.0.2.2:8000/get_username_athlete/', headers: Header, body: body);
    } else {
      response = await http.post('http://10.0.2.2:8000/get_username_coach/', headers: Header, body: body);
    }
    var responsebody = json.decode(response.body);
    print(responsebody);
    return responsebody;
  }

  Future<dynamic> createUser(Map<dynamic, dynamic> body, dynamic Header) async{
    print(body);
    var response = await http.post('http://10.0.2.2:8000/createuser/', headers: Header, body: body);
    var responsebody = json.decode(response.body);
    print(responsebody);
    return responsebody;
  }

  Future<dynamic> SignUp(Map<dynamic, dynamic> body, dynamic Header, bool Type) async{
    print(body);
    var response;
    if(Type){
      response = await http.post('http://10.0.2.2:8000/createathlete/', headers: Header, body: body);
    } else {
      response = await http.post('http://10.0.2.2:8000/createcoach/', headers: Header, body: body);
    }
    var responsebody = json.decode(response.body);
    print(responsebody);
    return responsebody;
  }
}
