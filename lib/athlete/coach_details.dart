import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart';
import 'package:online_coaching/models/models.dart' as models;
import 'package:online_coaching/services/athlete.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CoachProfile extends StatefulWidget{

  final header;
  final nat_code;

  CoachProfile({this.header, this.nat_code});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CoachProfile_();
  }
}

class CoachProfile_ extends State<CoachProfile>{

  var first_name;
  var last_name;
  var degree;
  var athlete_nat_code;
  var token;
  var coach_nat_code;
  //List<models.CoachRecords> recs = [];

  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    athlete_nat_code = prefs.getString('athlete_nat_code');
    token = prefs.getString('token');
    // TODO inja detail ro betor e kamel begir:
    var header = {
      'Authorization': 'JWT ${token}'
    };
    var response = await Services().coachDetails(widget.nat_code, header);
    print(response);
    first_name = utf8.decode(response['coach_details']['first_name'].toString().codeUnits);
    last_name = utf8.decode(response['coach_details']['last_name'].toString().codeUnits);
    degree = utf8.decode(response['coach_details']['degree'].toString().codeUnits);
    coach_nat_code = response['coach_details']['nat_code'];
    print('first_name');
    print(first_name);
    //TODO: inja recordsesh ro begir
  }

  @override
  void initState(){
    super.initState();
    getData();
  }

  Widget _buildProfileImage(){
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/1.jpg'),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.all(Radius.circular(100)),
          border: Border.all(
            color: Colors.white,
            width: 10,
          )
        ),
      ),
    );
  }

  Widget _buildCoverImage(Size screensize, BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * .22,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size screensize = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue,
      child: new ListView(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              _buildCoverImage(screensize, context),
              new Align(
                child: _buildProfileImage(),
                alignment: Alignment.topRight,
              )
            ],
          ),
          new Container(
            height: 50,
          ),
          new Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: MediaQuery.of(context).size.height * .5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: new ListView(
              shrinkWrap: true,
              children: <Widget>[
                new Container(
                  height: 20,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(right: 15),
                      color: Colors.white,
                      height: 40,
                      child: new Text(
                        'نام :',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(right: 15),
                      color: Colors.white,
                      height: 40,
                      child: new Text(
                          first_name + ' ' + last_name,
                          style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(right: 15),
                      color: Colors.white,
                      height: 40,
                      child: new Text(
                        'مدرک :',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(right: 15),
                      color: Colors.white,
                      height: 40,
                      child: new Text(
                        degree,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(right: 15),
                      color: Colors.white,
                      height: 40,
                      child: new Text(
                        'شهر :',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(right: 15),
                      color: Colors.white,
                      height: 40,
                      child: new Text(
                        'شیراز',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                new Container(
                  height: 40,
                  padding: EdgeInsets.only(right: 15),
                  child: new Text(
                    'افتخارات',
                    style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                  ),
                ),
                // TODO eftekharat:
                new Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 20),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.add, color: Colors.black, ),
                      ),
                      new Container(
                        padding: EdgeInsets.only(right: 10),
                        child: new Text(
                          'قهرمان مستر المپیا حرفه ای 2019',
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // TODO eftekharat
                new Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 20),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.add, color: Colors.black, ),
                      ),
                      new Container(
                        padding: EdgeInsets.only(right: 10),
                        child: new Text(
                          'قهرمان مستر المپیا آماتوری 2015',
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  height: 100,
                  color: Colors.white,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.only(right: 10),
                        height: 50,
                        width: 150,
                        child: new ButtonTheme(
                          minWidth: 100,
                          buttonColor: Colors.white,
                          child: new RaisedButton(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black, width: 2,),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              onPressed: (){},
                              child: new Text('ریپورت' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        )
                      ),
                      new Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 50,
                          width: 150,
                          child: new ButtonTheme(
                            minWidth: 100,
                            buttonColor: Colors.green,
                            child: new RaisedButton(
                              shape: RoundedRectangleBorder(
                                  //side: BorderSide(color: Colors.black, width: 2,),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              onPressed: () async{
                                print(widget.header);
                                var response = await Services().createContract(athlete_nat_code, coach_nat_code, widget.header);
                              },
                              child: new Text('ارسال درخواست' , style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}