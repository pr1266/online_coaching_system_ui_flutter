import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:online_coaching/models/models.dart';
import 'package:online_coaching/services/coach.dart';

class myAthlets extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return myAthlets_();
  }
}

class myAthlets_ extends State<myAthlets>{

  List<Athlets> my_athlets = [];
  var header;
  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nat_code = prefs.getString('coach_nat_code');
    String token = prefs.getString('token');
    header = {
      'Authorization': 'JWT ${token}'
    };
    var response = await Services().myAthlets(nat_code, header);
    print('response');
    print(response);
    setState(() {
      my_athlets.addAll(response['athlets']);
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
    return Container(
      color: Colors.blue,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .08,
            child: new Text(
              'شاگردان من',
              style: new TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15))
            ),
          ),
          my_athlets.length == 0 ? Container(
            margin: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height * .1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            alignment: Alignment.center,
            child: new Text(
              'درحال حاضر شما شاگردی ندارید',
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          ): ListView.builder(
            shrinkWrap: true,
            itemCount: my_athlets.length,
            itemBuilder: (BuildContext context, int index){
              return Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                height: MediaQuery.of(context).size.height * .1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white
                ),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(right: 10),
                      height: 60,
                      width: 70,
                      child: new CircleAvatar(
                        backgroundImage: NetworkImage(my_athlets[index].picture, headers: header),
                      ),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width * .755,
                      alignment: Alignment.center,
                      //padding: EdgeInsets.only(right: 20),
                      child: new Text(
                        my_athlets[index].first_name + ' ' + my_athlets[index].last_name,
                        style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          )
        ],
      ),
    );
  }
}