import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
//TODO pages:
import 'package:online_coaching/athlete/search.dart';
import 'package:online_coaching/athlete/profile.dart';
import 'package:online_coaching/athlete/programs.dart';
import 'package:online_coaching/athlete/mycoaches.dart';
import 'package:online_coaching/athlete/coach_details.dart';
import 'package:online_coaching/services/auth.dart';

class myHomePageState extends StatefulWidget{

  final nat_code;
  final header;
  final username;

  myHomePageState({this.header, this.nat_code, this.username});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return myHomePage();
  }
}

class myHomePage extends State<myHomePageState>{

  getData() async{
    var response = await Auth().getInfo(widget.username, widget.header, true);
    setState(() {
      picture = response['picture'];
    });
  }

  @override
  void initState(){
    super.initState();
    getData();
  }

  var picture;
  int currentpageindex = 0;
   var children_list = [
    Container(),
    // TODO ino mikhaim
    CoachPages(),
    // TODO ino mikhaim
    SearchPage_(),
    ProgramPage(),
    // TODO inam k bayad pak she
    CoachProfile(),

    //TODO pas shod search o coach pages
  ];

  changePage(int indexPage){
    setState(() {
      currentpageindex = indexPage;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: this.children_list[this.currentpageindex],
        bottomNavigationBar: new Container(
          height: MediaQuery.of(context).size.height * .1,
          decoration: new BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30)
            )
          ),
          child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(10),
              child: new GestureDetector(
                onTap: (){
                  changePage(0);
                },
                child: new CircleAvatar(
                  backgroundImage: NetworkImage(picture, headers: widget.header),
                ),
              ),
            ),
            new Container(
              height: 70,
              width: 70,
              padding: EdgeInsets.all(10),
              child: new GestureDetector(
                onTap: (){
                  changePage(1);
                },
                child: new CircleAvatar(
                  backgroundImage: currentpageindex == 1 ? AssetImage('assets/navbar/my_coach_butt_green.png'): AssetImage('assets/navbar/my_coach_butt_black.png'),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.all(10),
              child: new GestureDetector(
                onTap: (){
                  changePage(2);
                },
                child: new CircleAvatar(
                  backgroundImage: currentpageindex == 2 ? AssetImage('assets/navbar/search_butt_green.png'): AssetImage('assets/navbar/search_butt_black.png'),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.all(10),
              child: new GestureDetector(
                onTap: (){
                  changePage(3);
                },
                child: new CircleAvatar(
                  backgroundImage: currentpageindex == 3 ? AssetImage('assets/navbar/pacage_butt_green.png'): AssetImage('assets/navbar/pacage_butt_black.png'),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.all(10),
              child: new GestureDetector(
                onTap: (){
                  changePage(4);
                },
                child: new CircleAvatar(
                  backgroundImage: currentpageindex == 4 ? AssetImage('assets/navbar/support_butt_green.png'): AssetImage('assets/navbar/support_butt_black.png'),
                  backgroundColor: Colors.white,
                ),
              ),
            )
          ],
        ),
        )
    );
  }
}