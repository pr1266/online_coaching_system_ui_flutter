import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart';


class CoachDetails extends StatelessWidget{

  final String fullname = 'هادی چوپان';
  final String degree = 'لیسانس تربیت بدنی';
  final String city = 'اصفهان';
  final records = 'سبیسیمبنسکبلنتلنابکلانبالمنیکمبلنکسمینبسکیمنبسیکمنلکیمانبکمانکمنیبمسیگبکمسگکمرزذورذدو.ئانمیبکلمنیبکلمنسکبلمنیکملنیکلمانلمنابمکانبکانیکبلنیکبملن';

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
      fullname,
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


//return Scaffold(
//body: Stack(
//children: <Widget>[
//_buildCoverImage(screensize, context),
//SafeArea(
//child: SingleChildScrollView(
//child: Column(
//children: <Widget>[
//SizedBox(
//height: screensize.height/7,
//),
//_buildProfileImage(),
////_buildFullName(),
////_buildStatus(context),
//Container(
//height: MediaQuery.of(context).size.height * .1,
//),
//Container(
//height: MediaQuery.of(context).size.height * .5,
//margin: EdgeInsets.only(left: 20, right: 20),
//decoration: BoxDecoration(
//borderRadius: BorderRadius.all(Radius.circular(20)),
//color: Colors.blue
//),
//)
//],
//),
//),
//),
//],
//),
//);