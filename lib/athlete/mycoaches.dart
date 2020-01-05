import 'package:flutter/material.dart';

class CoachPages extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blue,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height * .08,
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                )
            ),
            child: new Text('مربی های من', style: new TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),),
            alignment: Alignment.center,
          ),
          new Container(
            height: MediaQuery.of(context).size.height * .1,
          ),
          new Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: MediaQuery.of(context).size.height * .1,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
            child: new Row(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(right: 20),
                  child: new Icon(Icons.search, size: 40,),
                ),
                new Container(
                    padding: EdgeInsets.only(right: 10),
                    child: new Text('جستجو...', style: new TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),)
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}