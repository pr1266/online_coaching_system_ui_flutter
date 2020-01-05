import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
//TODO pages:
import 'package:online_coaching/coach/profile.dart';
import 'package:online_coaching/coach/athletes.dart';

class myHomePageState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return myHomePage();
  }
}

class myHomePage extends State<myHomePageState>{

  int currentpageindex = 0;
  final children_list = [
    ProfilePage(),
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
                  child: new Icon(Icons.account_box),
                ),
              ),
              new Container(
                padding: EdgeInsets.all(10),
                child: new GestureDetector(
                  onTap: (){
                    changePage(1);
                  },
                  child: new Icon(Icons.assignment),
                ),
              ),
              new Container(
                padding: EdgeInsets.all(10),
                child: new GestureDetector(
                  onTap: (){
                    changePage(2);
                  },
                  child: new Icon(Icons.search),
                ),
              ),
              new Container(
                padding: EdgeInsets.all(10),
                child: new GestureDetector(
                  onTap: (){
                    changePage(3);
                  },
                  child: new Icon(Icons.play_arrow),
                ),
              ),
              new Container(
                padding: EdgeInsets.all(10),
                child: new GestureDetector(
                  onTap: (){
                    changePage(4);
                  },
                  child: new Icon(Icons.sms),
                ),
              )
            ],
          ),
        )
    );
  }
}