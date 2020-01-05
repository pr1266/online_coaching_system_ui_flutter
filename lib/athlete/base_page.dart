import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
//TODO pages:
import 'package:online_coaching/athlete/search.dart';
import 'package:online_coaching/athlete/profile.dart';
import 'package:online_coaching/athlete/programs.dart';


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
    SearchPage(),
    ProgramPage()
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
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(title : new Text('profile', style: TextStyle(color: Colors.black)), icon: new Icon(Icons.home, color: Colors.black)),
            new BottomNavigationBarItem(title : new Text('coaches', style: TextStyle(color: Colors.black)), icon: new Icon(Icons.search, color: Colors.black)),
            new BottomNavigationBarItem(title : new Text('search', style: TextStyle(color: Colors.black)), icon: new Icon(Icons.add_box, color: Colors.black)),
            new BottomNavigationBarItem(title : new Text('packages', style: TextStyle(color: Colors.black)), icon: new Icon(Icons.favorite, color: Colors.black)),
            new BottomNavigationBarItem(title : new Text('help', style: TextStyle(color: Colors.black)), icon: new Icon(Icons.account_box, color: Colors.black)),
          ],
          onTap: changePage,
          currentIndex: currentpageindex,
        )
    );
  }
}