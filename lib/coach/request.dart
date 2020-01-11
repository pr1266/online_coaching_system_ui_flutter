import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:online_coaching/models/models.dart';
import 'package:online_coaching/services/coach.dart';

class RequestsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RequestPage_();
  }
}

class RequestPage_ extends State<RequestsPage>{

  List<Contract> reqs = [];

  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nat_code = prefs.getString('coach_nat_code');
    print('coach nat_code');
    print(nat_code);
    String token = prefs.getString('token');

    var header = {
      'Authorization' : 'JWT ${token}'
    };
    print(header);
    var response = await Services().myRequests(nat_code, header);
    setState(() {
      reqs.addAll(response['contract']);
      print('final');
      print(reqs);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.blue,
      child: new ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: new Text(
              'درخواست ها',
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          reqs.length == 0 ? new Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            height: MediaQuery.of(context).size.height * .1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: new Text(
              'شما هیچ درخواستی ندارید',
              style: new TextStyle(
                fontSize: 20
              ),
            ),
          ): new Container(
            child: new ListView.builder(
              shrinkWrap: true,
              itemCount: reqs.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  height: MediaQuery.of(context).size.height * .1,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}