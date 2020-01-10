import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart';
import 'package:online_coaching/models/models.dart' as models;
import 'package:online_coaching/services/athlete.dart';


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
  //List<models.CoachRecords> recs = [];

  getData() async{
    // TODO inja detail ro betor e kamel begir:
    var response = await Services().coachDetails(widget.nat_code, widget.header);
    first_name = response['first_name'];
    last_name = response['last_name'];
    degree = response['degree'];
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

  Widget _buildStatus(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(4.0))
      ),
      child: Text(
        degree,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300
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

  Widget _buildFullName(){
    TextStyle _nameStyle = TextStyle(
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.bold
    );

    return Text(
      first_name + ' ' + last_name,
      style: _nameStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size screensize = MediaQuery.of(context).size;
    return Container(
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
                          ' هادی چوپان',
                          style: TextStyle(
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
                        'لیسانس تربیت بدنی',
                        style: TextStyle(
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
                              onPressed: (){
                                Services().createContract(Athlete, nat_code, widget.header);
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